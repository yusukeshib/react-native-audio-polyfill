package io.fata.polyfill.audio;

import java.util.concurrent.locks.ReentrantLock;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import android.media.MediaDataSource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import android.content.res.AssetFileDescriptor;
import android.util.Base64;
import android.util.Log;
import android.content.Context;

public class RNAudioCache {

  private static final String TAG = "ReactNative";
  private final ReentrantLock lock = new ReentrantLock();

  //Last argument true for LRU ordering
  private Map<String, String> cache = Collections.synchronizedMap(
      new LinkedHashMap<String, String>(10,1.5f,true));
  private Context context;

  public RNAudioCache(Context context) {
    this.context = context;
  }
  
  public String get(String source) {
    this.put(source);
    if(!cache.containsKey(source)) return null;
    return cache.get(source);
  }

  protected void put(String source) {
    lock.lock();
    if(cache.containsKey(source)) return;
    try {
      cache.put(source, getFile(source));
    } catch(Exception e) {
      Log.v(TAG, "RNAudioCache Error:" + e.getMessage());
    } finally {
      lock.unlock();
    }
  }

  protected static void copyStream(InputStream is, OutputStream os) {
    final int buffer_size = 1024;
    try {
      byte[] bytes = new byte[buffer_size];
      for(;;) {
        int count=is.read(bytes, 0, buffer_size);
        if(count == -1) break;
        os.write(bytes, 0, count);
      }
    } catch(Exception ex) {
    }
  }

  protected String getFile(String source) {

    String cacheDir = context.getExternalCacheDir().getAbsolutePath();
    String filename = String.valueOf(source.hashCode());
    File file = new File(cacheDir + filename);

    try {

      if(!file.exists()) {

        FileOutputStream output = new FileOutputStream(file);

        int resid = context.getResources().getIdentifier(source, "raw", context.getPackageName());
        // resource
        if(resid != 0) {
          // copy to cachrDir
          AssetFileDescriptor afd = context.getResources().openRawResourceFd(resid);
          FileInputStream input = new FileInputStream(afd.getFileDescriptor());
          copyStream(input, output);
          input.close();
          afd.close();
        }
        // remote
        else if(source.startsWith("http://") || source.startsWith("https://")) {
          URL url = new URL(source);
          InputStream input = url.openStream();
          copyStream(input, output);
          input.close();
        }
        // data-uri
        else if(source.startsWith("data:")) {
          final String PREFIX = "data:audio/";
          // get hash of data
          String extension = source.substring(PREFIX.length(), source.indexOf(';'));
          Context appContext = context.getApplicationContext();
          // create cache
          String encodingPrefix = "base64,";
          int contentStartIndex = source.indexOf(encodingPrefix) + encodingPrefix.length();
          String base64String = source.substring(contentStartIndex);
          byte[] decodedBytes = Base64.decode(base64String, Base64.NO_WRAP);
          output.write(decodedBytes);
        }
        // file
        else {
          AssetFileDescriptor afd = context.getAssets().openFd(source);
          FileInputStream input = new FileInputStream(afd.getFileDescriptor());
          copyStream(input, output);
          input.close();
          afd.close();
        }

        output.close();

      }

    } catch (Exception e) {
      Log.v(TAG, e.getMessage());
      return null;
    } finally {
      return file.getAbsolutePath();
    }
  }
}
