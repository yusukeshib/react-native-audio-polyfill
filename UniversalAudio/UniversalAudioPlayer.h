#import <AVFoundation/AVFoundation.h>
#import <React/RCTBridgeModule.h>
#import "UniversalAudio.h"

@interface UniversalAudioPlayer : NSObject<AVAudioPlayerDelegate>

@property (nonatomic, strong) NSNumber *id;

- (id)initWithModule:(UniversalAudio *)module;

- (void)addTextTrack:(NSString *)v;
- (BOOL)canPlayType:(NSString *)mediaType;
- (void)load;
- (void)play;
- (void)pause;
- (void)setAudioTracks:(NSString *)v;
- (void)setAutoplay:(BOOL)v;
// - (void)setController:(BOOL)v;
- (void)setControls:(BOOL)v;
// - (void)setCrossOrigin:(NSString *)v;
- (void)setCurrentTime:(double)v;
- (void)setDefaultMuted:(BOOL)v;
- (void)setDefaultPlaybackRate:(double)v;
- (void)setLoop:(BOOL)v;
- (void)setMediaGroup:(NSString *)v;
- (void)setMuted:(BOOL)v;
- (void)setPaused:(BOOL)v;
- (void)setPlaybackRate:(double)v;
- (void)setPreload:(NSString *)v;
- (void)setTextTracks:(NSString *)v;
- (void)setVolume:(double)v;
- (void)setSource:(NSString *)source;

@end
