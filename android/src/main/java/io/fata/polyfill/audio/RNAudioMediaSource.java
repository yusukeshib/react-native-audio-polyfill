package io.fata.polyfill.audio;

import android.media.MediaDataSource;
import java.io.File;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.util.Base64;

public class RNAudioMediaSource extends MediaDataSource {

  private volatile byte[] buffer;
  private boolean valid;

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

  public boolean isValid() {
    return valid;
  }

  public RNAudioMediaSource(Context context, String source) {

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

      //
      FileInputStream input = new FileInputStream(file);
      ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
      int read = 0;
      while(read != -1) {
        read = input.read();
        byteArrayOutputStream.write(read);
      }
      input.close();
      byteArrayOutputStream.flush();
      buffer = byteArrayOutputStream.toByteArray();
      byteArrayOutputStream.close();
    } catch (Exception e) {
      valid = false;
    } finally {
      valid = true;
    }
  }

  @Override
  public synchronized int readAt(long position, byte[] buffer, int offset, int size) throws IOException {
    synchronized(buffer) {
      int length = buffer.length;
      if (position >= length) return -1;
      if (position + size > length) size -= (position + size) - length;
      System.arraycopy(buffer, (int)position, buffer, offset, size);
      return size;
    }
  }

  @Override
  public synchronized long getSize() throws IOException {
    synchronized(buffer) {
      return buffer.length;
    }
  }

  @Override
  public synchronized void close() throws IOException {
  }
}
