#import "UniversalAudioPlayer.h"

@implementation UniversalAudioPlayer {
  // protected static int __id__ = 0;

  // protected int id;
  // protected MediaPlayer player = null;
  // protected ReactContext context;
  // protected HashMap<String, Object> data = new HashMap<>();
  // protected Timer timer;

}

- (id)init {
  // this.context = context;
  // this.id = __id__++;

  // // default settings
  // this.setAudioTracks("");
  // this.setAutoplay(false);
  // this._setBuffered(false);
  // // this.setController(false);
  // this.setControls(false);
  // // this.setCrossOrigin("");
  // this._setCurrentSrc("");
  // this.setCurrentTime(0.0);
  // this.setDefaultMuted(false);
  // this.setDefaultPlaybackRate(1.0);
  // this._setDuration(0.0);
  // this._setEnded(false);
  // this._setError("");
  // this.setLoop(false);
  // this.setMediaGroup("");
  // this.setMuted(false);
  // this._setNetworkState("");
  // this.setPaused(false);
  // this.setPlaybackRate(1.0);
  // this._setPlayed(false);
  // this.setPreload("auto");
  // this._setSeekable(true);
  // this._setSeeking(false);
  // this.setSource("");
  // this.setTextTracks("");
  // this.setVolume(1.0);
}

- (void)emitEvent:(NSString *)type {
  // WritableMap map = Arguments.createMap();
  // // map.merge(this.data);
  // map.putInt("audioId", this.id);
  // map.putString("type", type);

  // RCTDeviceEventEmitter emitter = context.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class);
  // emitter.emit("UniversalAudioEvent", map);
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer*)player successfully:(BOOL)flag {
}

@end
