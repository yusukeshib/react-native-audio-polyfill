#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RNAudio : RCTEventEmitter<RCTBridgeModule>

- (void)sendEvent:(NSString *)type audioId:(NSNumber *)audioId data:(NSDictionary *)data;

@end
