#import <React/RCTUtils.h>
#import <React/RCTConvert.h>
#import "UniversalAudio.h"
#import "UniversalAudioPlayer.h"

@implementation UniversalAudio {
  NSMutableDictionary* audioMap;
}

- (void)setPlayer:(UniversalAudioPlayer *)player {
  if(audioMap == nil) {
    audioMap = [[NSMutableDictionary alloc] init];
  }
  NSString *key = [[NSNumber numberWithInt:(int)player.id] stringValue];
  [audioMap setValue:player forKey: key];
}

- (UniversalAudioPlayer *)getPlayer:(NSNumber *)audioId {
  NSString *key = [audioId stringValue];
  return [audioMap valueForKey: key];
}

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(create,
    resolver:(RCTPromiseResolveBlock)resolve
    rejecter:(RCTPromiseRejectBlock)reject)
{
  UniversalAudioPlayer *player = [[UniversalAudioPlayer alloc] init];
  [self setPlayer:player];
  NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
  [map setValue:[NSNumber numberWithInt:(int)player.id] forKey:@"audioId"];
  resolve(map);
}

RCT_EXPORT_METHOD(addTextTrack:(NSNumber *)audioId
                         value:(NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player addTextTrack: value];
}

RCT_EXPORT_METHOD(canPlayType:(NSNumber *)audioId mediaType:(NSString *)mediaType
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  UniversalAudioPlayer *player = [self getPlayer:audioId];
  if(player == nil) return;
  BOOL ret = [player canPlayType:mediaType];
  resolve(@(ret));
}

RCT_EXPORT_METHOD(load:(NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player load];
}

RCT_EXPORT_METHOD(play:(NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player play];
}

RCT_EXPORT_METHOD(pause:(NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player pause];
}

RCT_EXPORT_METHOD(setAutoplay:(NSNumber *)audioId
                        value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setAutoplay:value];
}

RCT_EXPORT_METHOD(setControls:(NSNumber *)audioId
                        value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setControls:value];
}

// RCT_EXPORT_METHOD(setCrossOrigin:(NSNumber *)audioId
    //                        value:(NSString *)value)
    // {
    //   UniversalAudioPlayer * player = [self getPlayer:audioId];
    //   if(player == nil) return;
    //   [player setCrossOrigin:value];
    // }

RCT_EXPORT_METHOD(setCurrentTime:(NSNumber *)audioId
                           value:(NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setCurrentTime:[value doubleValue]];
}

RCT_EXPORT_METHOD(setDefaultMuted:(NSNumber *)audioId
                            value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setDefaultMuted:value];
}

RCT_EXPORT_METHOD(setDefaultPlaybackRate:(NSNumber *)audioId
                                   value:(NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setDefaultPlaybackRate:[value doubleValue]];
}

RCT_EXPORT_METHOD(setLoop:(NSNumber *)audioId
                    value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setLoop:value];
}

RCT_EXPORT_METHOD(setMediaGroup:(NSNumber *)audioId
                          value:(NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setMediaGroup:value];
}

RCT_EXPORT_METHOD(setMuted:(NSNumber *)audioId
                     value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setMuted:value];
}

RCT_EXPORT_METHOD(setPaused:(NSNumber *)audioId
                      value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPaused:value];
}

RCT_EXPORT_METHOD(setPlaybackRate:(NSNumber *)audioId
                            value:(NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPlaybackRate:[value doubleValue]];
}

RCT_EXPORT_METHOD(setPreload:(NSNumber *)audioId
                       value:(NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPreload:value];
}

RCT_EXPORT_METHOD(setSource:(NSNumber *)audioId
                      value:(NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setSource:value];
}

RCT_EXPORT_METHOD(setVolume:(NSNumber *)audioId
                      value:(NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setVolume:[value doubleValue]];
}

@end
