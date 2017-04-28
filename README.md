react-universal-audio
==========

html Audio class polyfill for react-native.
You can use Audio for android,ios without modification to browser code.	

## Usage

<!--
Using ES2017 `async` / `await` internally, you need adding async/await suport in babelrc so in your react-native project.

```javascript
```
-->

```javascript
import Audio from 'react-universal-audio'

const sound = new Audio('./test.mp3')
sound.play()
```

## Install

`npm install react-universal-audio`

## Add it to your project

`react-native link`


## Coverage

### functions

* [ ] addTextTrack()
* [ ] canPlayType()
* [x] load()
* [x] play()
* [x] pause()

### properties

* [ ] audioTracks	
* [x] autoplay	
* [x] buffered // only android
* [ ] controller
* [ ] controls
* [ ] crossOrigin
* [ ] currentSrc
* [x] currentTime
* [ ] defaultMuted
* [ ] defaultPlaybackRate
* [x] duration
* [x] ended	
* [x] error
* [x] loop
* [x] mediaGroup
* [x] muted	
* [ ] networkState	
* [x] paused	
* [x] playbackRate
* [x] played
* [x] preload
* [ ] readyState
* [x] seekable
* [x] seeking
* [x] src
* [ ] startDate
* [ ] textTracks
* [ ] videoTracks
* [x] volume

### event

* [ ] abort	
* [x] canplay
* [ ] canplaythrough
* [x] durationchange
* [ ] emptied
* [x] ended	
* [x] error
* [x] loadeddata
* [x] loadedmetadata
* [x] loadstart
* [x] pause	
* [x] play
* [x] playing
* [x] progress // only android
* [x] ratechange
* [x] seeked
* [x] seeking
* [ ] stalled
* [ ] suspend
* [x] timeupdate // only android
* [x] volumechange
* [ ] waiting

## TODO

* property accessor
* canPlayType support.
* base64 data-uri support.
* Create audio component with  `controls=true`.
* Buffering progress for ios.

## License

MIT
