#import "RNAudio.h"
#import "RNAudioPlayer.h"

@implementation RNAudio {
  NSMutableDictionary* audioMap;
}

- (void)sendEvent:(NSString *)type
          audioId:(NSNumber *)audioId
             data:(NSDictionary *)data {
  NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary: data];
  [map setValue:audioId forKey:@"audioId"];
  [map setValue:type forKey:@"type"];
  [self sendEventWithName:@"RNAudioEvent" body:map];
}

- (void)setPlayer:(RNAudioPlayer *)player {
  if(audioMap == nil) {
    audioMap = [[NSMutableDictionary alloc] init];
  }
  NSString *key = [player.id stringValue];
  [audioMap setValue:player forKey: key];
}

- (RNAudioPlayer *)getPlayer:(NSNumber *)audioId {
  NSString *key = [audioId stringValue];
  return [audioMap valueForKey: key];
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"RNAudioEvent"];
}

RCT_REMAP_METHOD(create,
    resolver:(RCTPromiseResolveBlock)resolve
    rejecter:(RCTPromiseRejectBlock)reject)
{
  RNAudioPlayer *player = [[RNAudioPlayer alloc] initWithModule:self];
  [self setPlayer:player];
  resolve(@{@"audioId": player.id});
}

RCT_REMAP_METHOD(unload,
    audioId:(nonnull NSNumber *)audioId
   resolver:(RCTPromiseResolveBlock)resolve
   rejecter:(RCTPromiseRejectBlock)reject)
{
  RNAudioPlayer *player = [self getPlayer:audioId];
  if(player == nil) return;
  [player unload];
  [audioMap removeObjectForKey: [audioId stringValue]];
  resolve(@{@"audioId": audioId});
}

RCT_EXPORT_METHOD(addTextTrack:(nonnull NSNumber *)audioId
                         value:(nonnull NSString *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player addTextTrack: value];
}

RCT_EXPORT_METHOD(canPlayType:(nonnull NSNumber *)audioId
                  mediaType:(nonnull NSString *)mediaType
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  RNAudioPlayer *player = [self getPlayer:audioId];
  if(player == nil) return;
  BOOL ret = [player canPlayType:mediaType];
  resolve(@(ret));
}

RCT_EXPORT_METHOD(load:(nonnull NSNumber *)audioId)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player load];
}

RCT_EXPORT_METHOD(play:(nonnull NSNumber *)audioId)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player play];
}

RCT_EXPORT_METHOD(pause:(nonnull NSNumber *)audioId)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player pause];
}

RCT_EXPORT_METHOD(setAutoplay:(nonnull NSNumber *)audioId
                        value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setAutoplay:[value boolValue]];
}

RCT_EXPORT_METHOD(setControls:(nonnull NSNumber *)audioId
                        value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setControls:[value boolValue]];
}

// RCT_EXPORT_METHOD(setCrossOrigin:(nonnull NSNumber *)audioId
    //                        value:(nonnull NSString *)value)
    // {
    //   RNAudioPlayer * player = [self getPlayer:audioId];
    //   if(player == nil) return;
    //   [player setCrossOrigin:value];
    // }

RCT_EXPORT_METHOD(setCurrentTime:(nonnull NSNumber *)audioId
                           value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setCurrentTime:[value doubleValue]];
}

RCT_EXPORT_METHOD(setDefaultMuted:(nonnull NSNumber *)audioId
                            value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setDefaultMuted:[value boolValue]];
}

RCT_EXPORT_METHOD(setDefaultPlaybackRate:(nonnull NSNumber *)audioId
                                   value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setDefaultPlaybackRate:[value doubleValue]];
}

RCT_EXPORT_METHOD(setLoop:(nonnull NSNumber *)audioId
                    value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setLoop:[value boolValue]];
}

RCT_EXPORT_METHOD(setMediaGroup:(nonnull NSNumber *)audioId
                          value:(nonnull NSString *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setMediaGroup:value];
}

RCT_EXPORT_METHOD(setMuted:(nonnull NSNumber *)audioId
                     value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setMuted:[value boolValue]];
}

RCT_EXPORT_METHOD(setPaused:(nonnull NSNumber *)audioId
                      value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPaused:[value boolValue]];
}

RCT_EXPORT_METHOD(setPlaybackRate:(nonnull NSNumber *)audioId
                            value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPlaybackRate:[value doubleValue]];
}

RCT_EXPORT_METHOD(setPreload:(nonnull NSNumber *)audioId
                       value:(nonnull NSString *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setPreload:value];
}

RCT_EXPORT_METHOD(setSource:(nonnull NSNumber *)audioId
                      value:(nonnull NSDictionary *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setSource:value];
}

RCT_EXPORT_METHOD(setVolume:(nonnull NSNumber *)audioId
                      value:(nonnull NSNumber *)value)
{
  RNAudioPlayer * player = [self getPlayer:audioId];
  if(player == nil) return;
  [player setVolume:[value doubleValue]];
}

@end
