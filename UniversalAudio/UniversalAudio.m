#import <React/RCTUtils.h>
#import <React/RCTConvert.h>
#import "UniversalAudio.h"
#import "UniversalAudioPlayer.h"

@implementation UniversalAudio {
  NSMutableDictionary* audioMap;
}

- (void)sendEvent:(NSString *)type audioId:(NSNumber *)audioId {
  [self sendEventWithName:@"UniversalAudioEvent"
                       body:@{@"audioId": audioId, @"type": type} ];
}

- (void)setPlayer:(UniversalAudioPlayer *)player {
  if(audioMap == nil) {
    audioMap = [[NSMutableDictionary alloc] init];
  }
  NSString *key = [player.id stringValue];
  [audioMap setValue:player forKey: key];
}

- (UniversalAudioPlayer *)getPlayer:(NSNumber *)audioId {
  NSString *key = [audioId stringValue];
  return [audioMap valueForKey: key];
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"UniversalAudioEvent"];
}

RCT_REMAP_METHOD(create,
    resolver:(RCTPromiseResolveBlock)resolve
    rejecter:(RCTPromiseRejectBlock)reject)
{
  UniversalAudioPlayer *player = [[UniversalAudioPlayer alloc] initWithModule:self];
  [self setPlayer:player];
  NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
  [map setValue:player.id forKey:@"audioId"];
  resolve(map);
}

RCT_EXPORT_METHOD(addTextTrack:(nonnull NSNumber *)audioId
                         value:(nonnull NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player addTextTrack: value];
}

RCT_EXPORT_METHOD(canPlayType:(nonnull NSNumber *)audioId
                  mediaType:(nonnull NSString *)mediaType
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  UniversalAudioPlayer *player = [self getPlayer:audioId];
  if(player == nil) return;
  BOOL ret = [player canPlayType:mediaType];
  resolve(@(ret));
}

RCT_EXPORT_METHOD(load:(nonnull NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player load];
}

RCT_EXPORT_METHOD(play:(nonnull NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player play];
}

RCT_EXPORT_METHOD(pause:(nonnull NSNumber *)audioId)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player pause];
}

RCT_EXPORT_METHOD(setAutoplay:(nonnull NSNumber *)audioId
                        value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setAutoplay:[value boolValue]];
}

RCT_EXPORT_METHOD(setControls:(nonnull NSNumber *)audioId
                        value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setControls:[value boolValue]];
}

// RCT_EXPORT_METHOD(setCrossOrigin:(nonnull NSNumber *)audioId
    //                        value:(nonnull NSString *)value)
    // {
    //   UniversalAudioPlayer * player = [self getPlayer:audioId];
    //   if(player == nil) return;
    //   [player setCrossOrigin:value];
    // }

RCT_EXPORT_METHOD(setCurrentTime:(nonnull NSNumber *)audioId
                           value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setCurrentTime:[value doubleValue]];
}

RCT_EXPORT_METHOD(setDefaultMuted:(nonnull NSNumber *)audioId
                            value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setDefaultMuted:[value boolValue]];
}

RCT_EXPORT_METHOD(setDefaultPlaybackRate:(nonnull NSNumber *)audioId
                                   value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setDefaultPlaybackRate:[value doubleValue]];
}

RCT_EXPORT_METHOD(setLoop:(nonnull NSNumber *)audioId
                    value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setLoop:[value boolValue]];
}

RCT_EXPORT_METHOD(setMediaGroup:(nonnull NSNumber *)audioId
                          value:(nonnull NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setMediaGroup:value];
}

RCT_EXPORT_METHOD(setMuted:(nonnull NSNumber *)audioId
                     value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setMuted:[value boolValue]];
}

RCT_EXPORT_METHOD(setPaused:(nonnull NSNumber *)audioId
                      value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPaused:[value boolValue]];
}

RCT_EXPORT_METHOD(setPlaybackRate:(nonnull NSNumber *)audioId
                            value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPlaybackRate:[value doubleValue]];
}

RCT_EXPORT_METHOD(setPreload:(nonnull NSNumber *)audioId
                       value:(nonnull NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPreload:value];
}

RCT_EXPORT_METHOD(setSource:(nonnull NSNumber *)audioId
                      value:(nonnull NSString *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setSource:value];
}

RCT_EXPORT_METHOD(setVolume:(nonnull NSNumber *)audioId
                      value:(nonnull NSNumber *)value)
{
  UniversalAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setVolume:[value doubleValue]];
}

@end
