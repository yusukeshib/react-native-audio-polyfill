package io.fata.universal.audio;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.net.Uri;
import android.media.AudioManager;
import android.content.Context;
import android.util.Log;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;

public class UniversalAudioPlayer {
  protected static int __id__ = 0;

  protected int id;
  protected MediaPlayer player = null;
  protected Context context;

  // audioTracks: undefined,
  // autoplay: undefined,
  // buffered: undefined,
  // controller: undefined,
  // controls: undefined,
  // crossOrigin: undefined,
  // currentSrc: undefined,
  // currentTime: undefined,
  // defaultMuted: undefined,
  // defaultPlaybackRate: undefined,
  // duration: undefined,
  // ended: undefined,
  // error: undefined,
  // loop: undefined,
  // mediaGroup: undefined,
  // muted: undefined,
  // networkState: undefined,
  // paused: undefined,
  // playbackRate: undefined,
  // played: undefined,
  // preload: undefined,
  // seekable: undefined,
  // seeking: undefined,
  // src: undefined,
  // textTracks: undefined,
  // volume: undefined,

  public UniversalAudioPlayer(Context context) {
    this.context = context;
    this.id = __id__++;
  }
  public int getId() {
    return this.id;
  }

  public void addTextTrack(String v) {
  }
  public Boolean canPlayType(String mediaType) {
    return false;
  }
  public void load() {
  }
  public void play() {
    if(player == null) return;
    if(player.isPlaying()) return;
    int pos = player.getCurrentPosition();
    player.seekTo(pos);
    player.start();
  }
  public void pause() {
  }
  public void setAutoplay(Boolean v) {
  }
  public void setControls(Boolean v) {
  }
  public void setCrossOrigin(String v) {
  }
  public void setCurrentTime(float v) {
  }
  public void setDefaultMuted(Boolean v) {
  }
  public void setDefaultPlaybackRate(float v) {
  }
  public void setLoop(Boolean v) {
  }
  public void setMediaGroup(String v) {
  }
  public void setMuted(Boolean v) {
  }
  public void setPaused(Boolean v) {
  }
  public void setPlaybackRate(float v) {
  }
  public void setPreload(Boolean v) {
  }
  public void setVolume(float v) {
  }

  public void setSource(String source) {
    int res = this.context.getResources().getIdentifier(source, "raw", this.context.getPackageName());
    if(res != 0) {
      player = MediaPlayer.create(this.context, res);
    }
    // TODO: data-uri
    // remote
    if(source.startsWith("http://") || source.startsWith("https://")) {
      player = new MediaPlayer();
      player.setAudioStreamType(AudioManager.STREAM_MUSIC);
      try {
        player.setDataSource(source);
      } catch(IOException e) {
        Log.e("UniversalAudioModule", "Exception", e);
      }
    }
    // file
    else {
      File file = new File(source);
      if(file.exists()) {
        Uri uri = Uri.fromFile(file);
        player = MediaPlayer.create(this.context, uri);
      }
    }

    try {
      player.prepare();
    } catch (Exception e) {
      Log.e("UniversalAudioModule", "Exception", e);
    }

    // // event
    // player.setOnCompletionListener(new OnCompletionListener() {
    //   @Override
    //   public synchronized void onCompletion(MediaPlayer mp) {
    //     if (!mp.isLooping()) {
    //       callback.invoke(true);
    //     }
    //   }
    // });
    // player.setOnErrorListener(new OnErrorListener() {
    //   @Override
    //   public synchronized boolean onError(MediaPlayer mp, int what, int extra) {
    //     callback.invoke(false);
    //     return true;
    //   }
    // });
  }

  // public void release(final Integer key) {
  //   player.release();
  // }

}

