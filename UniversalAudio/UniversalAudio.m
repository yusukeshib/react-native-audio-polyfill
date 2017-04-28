#import <React/RCTUtils.h>
#import "UniversalAudio.h"

@implementation UniversalAudio {
  NSMutableDictionary* audioMap;
}

- (void)setPlayer:(UniversalAudioPlayer *)player {
  if(self.audioMap == nil) {
    self.audioMap = [[NSMutableDictionary alloc] init];
  }
  [self.audioMap setValue:player forKey: player.id];
}

- (UniversalAudioPlayer *)getPlayer:(NSNumber *)audioId {
  return [self.audioMap valueForKey: audioId];
}

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(create,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  UniversalAudioPlayer player = [[UniversalAudioPlayer alloc] init];
  [ self putPlayer:player];
  NSMutableDictionary *map = [NSMutableDictionary directory];
  [map setValue:player.id forKey:@"audioId"];
  resolve(map);
}

RCT_REMAP_METHOD(addTextTrack:(NSNumber *)audioId
                        value:(NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player addTextTrack: v];
}

RCT_REMAP_METHOD(canPlayType:(NSNumber *)audioId
                   mediaType:(NSString *)mediaType,
                    resolver:(RCTPromiseResolveBlock)resolve
                    rejecter:(RCTPromiseRejectBlock)reject)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  BOOL ret = [player canPlayType: mediaType];
  resolver(ret);
}

RCT_REMAP_METHOD(load:(NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player load];
}

RCT_REMAP_METHOD(play:(NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player play];
}

RCT_REMAP_METHOD(load:(NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player pause];
}

RCT_REMAP_METHOD(setAutoplay:(NSNumber *)audioId
                       value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setAutoplay:value];
}

RCT_REMAP_METHOD(setControls:(NSNumber *)audioId
                       value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setControls:value];
}

// RCT_REMAP_METHOD(setCrossOrigin:(NSNumber *)audioId
//                        value:(NSString *)value)
// {
//   UniversalAudioPlayer * player = [self getPlayer:audioId];
//   if(player == nil) return;
//   [player setCrossOrigin:value];
// }

RCT_REMAP_METHOD(setCurrentTime:(NSNumber *)audioId
                       value:(NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setCurrentTime:value];
}

RCT_REMAP_METHOD(setDefaultMuted:(NSNumber *)audioId
                       value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setDefaultMuted:value];
}

RCT_REMAP_METHOD(setDefaultPlaybackRate:(NSNumber *)audioId
                       value:(NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setDefaultPlaybackRate:value];
}

RCT_REMAP_METHOD(setLoop:(NSNumber *)audioId
                       value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setLoop:value];
}

RCT_REMAP_METHOD(setMediaGroup:(NSNumber *)audioId
                       value:(NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setMediaGroup:value];
}

RCT_REMAP_METHOD(setMuted:(NSNumber *)audioId
                       value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setMuted:value];
}

RCT_REMAP_METHOD(setPaused:(NSNumber *)audioId
                       value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPaused:value];
}

RCT_REMAP_METHOD(setPlaybackRate:(NSNumber *)audioId
                       value:(NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPlaybackRate:value];
}

RCT_REMAP_METHOD(setPreload:(NSNumber *)audioId
                       value:(BOOL)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPreload:value];
}

RCT_REMAP_METHOD(setSource:(NSNumber *)audioId
                       value:(NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setSource:value];
}

RCT_REMAP_METHOD(setVolume:(NSNumber *)audioId
                       value:(NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setVolume:value];
}

@end
