#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface UniversalAudio : RCTEventEmitter<RCTBridgeModule>

- (void)sendEvent:(NSString *)type audioId:(NSNumber *)audioId data:(NSDictionary *)data;

@end
