package io.fata.polyfill.audio;

import java.util.concurrent.locks.ReentrantLock;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import android.util.Log;
import android.content.Context;

public class RNAudioCache {

  private static final String TAG = "ReactNative";
  private final ReentrantLock lock = new ReentrantLock();

  //Last argument true for LRU ordering
  private Map<String, RNAudioMediaSource> cache = Collections.synchronizedMap(
      new LinkedHashMap<String, RNAudioMediaSource>(10,1.5f,true));
  private Context context;

  public RNAudioCache(Context context) {
    this.context = context;
  }
  
  public RNAudioMediaSource get(String source) {
    this.put(source);
    if(!cache.containsKey(source)) return null;
    return cache.get(source);
  }

  protected void put(String source) {
    lock.lock();
    if(cache.containsKey(source)) return;
    try {
      cache.put(source, new RNAudioMediaSource(context, source));
    } catch(Exception e) {
      Log.v(TAG, "RNAudioCache Error:" + e.getMessage());
    } finally {
      lock.unlock();
    }
  }
}
