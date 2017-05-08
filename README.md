react-native-audio-polyfill
==========

html Audio class polyfill for react-native.
You can use Audio for android,ios without modification to browser code.	

## Usage

```javascript
import Audio from 'react-native-audio-polyfill'

const audio1 = new Audio()

audio1.onload = () => {
  console.log('audio loaded')
  audio1.play()
}
audio1.addEventListener('error', err => console.log('audio error:', err)
audio1.src = './test.mp3'
audio1.load()
```

## Install

`npm install react-native-audio-polyfill`

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
* [x] defaultMuted
* [x] defaultPlaybackRate
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
* [x] timeupdate
* [x] volumechange
* [ ] waiting

## TODO

* canPlayType support.
* Create audio component with  `controls=true`.
* Buffering progress for ios.

## License

MIT
