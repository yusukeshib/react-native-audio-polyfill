package io.fata.polyfill.audio;

import java.util.concurrent.locks.ReentrantLock;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import android.util.Log;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import android.content.Context;

public class RNAudioCache {

  private static final String TAG = "ReactNative";
  private final ReentrantLock lock = new ReentrantLock();

  //Last argument true for LRU ordering
  private Map<String, String> cache = Collections.synchronizedMap(
      new LinkedHashMap<String, String>(10,1.5f,true));
  private File cacheDir;
  private Context context;

  public RNAudioCache(Context context) {
    this.context = context;
    cacheDir = context.getCacheDir();
  }

  public String get(String source) {
    if(!cache.containsKey(source)) return null;
    return cache.get(source);
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

  public void put(String source) {
    lock.lock();

    if(cache.containsKey(source)) return;

    try {
      String filename = String.valueOf(source.hashCode());

      URL url = new URL(source);
      HttpURLConnection conn = (HttpURLConnection)url.openConnection();
      conn.setConnectTimeout(30000);
      conn.setReadTimeout(30000);
      conn.setInstanceFollowRedirects(true);
      InputStream input = conn.getInputStream();
      OutputStream output = context.openFileOutput(filename, Context.MODE_PRIVATE);
      copyStream(input, output);
      output.close();

      cache.put(source, filename);

      Log.v(TAG, "cached:" + filename);

    } catch(Exception e) {
    } finally {
      lock.unlock();
    }
  }

}
