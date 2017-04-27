import { NativeModules } from 'react-native'
import EventEmitter from 'event-emitter'

const { Platform, NativeAppEventEmitter, DeviceEventEmitter, UniversalAudio } = NativeModules

const audioMap = {}
const emitter = Platform.OS == 'ios' ? NativeAppEventEmitter : DeviceEventEmitter
emitter.addListener('UniversalAudioEvent', evt => {
  const audio = audioMap[evt.audioId]
  if(!audio) return
  audio._emit(evt)
})

export default class Audio {
  constructor(url) {
    this.src = url
    this._emitter = EventEmitter()
    this._audioId = undefined
    this._data = {
      audioTracks: undefined,
      autoplay: undefined,
      buffered: undefined,
      controller: undefined,
      controls: undefined,
      crossOrigin: undefined,
      currentSrc: undefined,
      currentTime: undefined,
      defaultMuted: undefined,
      defaultPlaybackRate: undefined,
      duration: undefined,
      ended: undefined,
      error: undefined,
      loop: undefined,
      mediaGroup: undefined,
      muted: undefined,
      networkState: undefined,
      paused: undefined,
      playbackRate: undefined,
      played: undefined,
      preload: undefined,
      seekable: undefined,
      seeking: undefined,
      src: undefined,
      textTracks: undefined,
      volume: undefined,
    }
    this._init()
  }
  async _init() {
    this._audioId = await UniversalAudio.create()
  }
  // abort	Fires when the loading of an audio/video is aborted
  // canplay	Fires when the browser can start playing the audio/video
  // canplaythrough	Fires when the browser can play through the audio/video without stopping for buffering
  // durationchange	Fires when the duration of the audio/video is changed
  // emptied	Fires when the current playlist is empty
  // ended	Fires when the current playlist is ended
  // error	Fires when an error occurred during the loading of an audio/video
  // loadeddata	Fires when the browser has loaded the current frame of the audio/video
  // loadedmetadata	Fires when the browser has loaded meta data for the audio/video
  // loadstart	Fires when the browser starts looking for the audio/video
  // pause	Fires when the audio/video has been paused
  // play	Fires when the audio/video has been started or is no longer paused
  // playing	Fires when the audio/video is playing after having been paused or stopped for buffering
  // progress	Fires when the browser is downloading the audio/video
  // ratechange	Fires when the playing speed of the audio/video is changed
  // seeked	Fires when the user is finished moving/skipping to a new position in the audio/video
  // seeking	Fires when the user starts moving/skipping to a new position in the audio/video
  // stalled	Fires when the browser is trying to get media data, but data is not available
  // suspend	Fires when the browser is intentionally not getting media data
  // timeupdate	Fires when the current playback position has changed
  // volumechange	Fires when the volume has been changed
  // waiting	Fires when the video stops because it needs to buffer the next frame
  _emit(evt) {
    this._emitter.emit(evt.type, evt.data)
  }
  addEventListener(type, listener) {
    this._emitter.on(type, listener)
  }
  removeEventListener(type, listener) {
    this._emitter.off(type, listener)
  }
  addTextTrack(v) {
    if(!this._audioId) return
    UniversalAudio.addTextTrack(this._audioId, v)
  }
  async canPlayType(mediaType) {
    if(!this._audioId) return false
    return await UniversalAudio.canPlayType(this._audioId, mediaType)
  }
  load() {
    if(!this._audioId) return
    UniversalAudio.load(this._audioId)
  }
  play() {
    if(!this._audioId) return
    UniversalAudio.play(this._audioId)
  }
  pause() {
    if(!this._audioId) return
    UniversalAudio.pause(this._audioId)
  }
  get audioTracks() {
    return this._data.audioTracks
  }
  set autoplay(v) {
    if(!this._audioId) return
    UniversalAudio.setAutoplay(this._audioId, v)
  }
  get autoplay() {
    return this._data.autoplay
  }
  get buffered() {
    return this._data.buffered
  }
  get controller() {
    return this._data.controller
  }
  set controls(v) {
    if(!this._audioId) return
    UniversalAudio.setControls(this._audioId, v)
  }
  get controls() {
    return this._data.controls
  }
  set crossOrigin(v) {
    if(!this._audioId) return
    UniversalAudio.setCrossOrigin(this._audioId, v)
  }
  get crossOrigin() {
    return this._data.crossOrigin
  }
  get currentSrc() {
    return this._data.currentSrc
  }
  set currentTime(v) {
    if(!this._audioId) return
    UniversalAudio.setCurrentTime(this._audioId, v)
  }
  get currentTime() {
    return this._data.currentTime
  }
  set defaultMuted(v) {
    if(!this._audioId) return
    UniversalAudio.setDefaultMuted(this._audioId, v)
  }
  get defaultMuted() {
    return this._data.defaultMuted
  }
  set defaultPlaybackRate(v) {
    if(!this._audioId) return
    UniversalAudio.setDefaultPlaybackRate(this._audioId, v)
  }
  get defaultPlaybackRate() {
    return this._data.defaultPlaybackRate
  }
  get duration() {
    return this._data.duration
  }
  get ended() {
    return this._data.ended
  }
  get error() {
    return this._data.error
  }
  set loop(v) {
    if(!this._audioId) return
    UniversalAudio.setLoop(this._audioId, v)
  }
  get loop() {
    return this._data.loop
  }
  set mediaGroup(v) {
    if(!this._audioId) return
    UniversalAudio.setMediaGroup(this._audioId, v)
  }
  get mediaGroup() {
    return this._data.mediaGroup
  }
  set muted(v) {
    if(!this._audioId) return
    UniversalAudio.setMuted(this._audioId, v)
  }
  get muted() {
    return this._data.muted
  }
  get networkState() {
    return this._data.networkState
  }
  set paused(v) {
    if(!this._audioId) return
    UniversalAudio.setPaused(this._audioId, v)
  }
  get paused() {
    return this._data.paused
  }
  set playbackRate(v) {
    if(!this._audioId) return
    UniversalAudio.setPlaybackRate(this._audioId, v)
  }
  get playbackRate() {
    return this._data.playbackRate
  }
  get played() {
    return this._data.played
  }
  set preload(v) {
    if(!this._audioId) return
    UniversalAudio.setPreload(this._audioId, v)
  }
  get preload() {
    return this._data.preload
  }
  get readyState() {
  }
  get seekable() {
    return this._data.seekable
  }
  get seeking() {
    return this._data.seeking
  }
  set src(v) {
    if(!this._audioId) return
    UniversalAudio.setSource(this._audioId, v)
  }
  get src() {
    return this._data.src
  }
  get textTracks() {
    return this._data.textTraks
  }
  set volume(v) {
    if(!this._audioId) return
    UniversalAudio.setVolume(this._audioId, v)
  }
  get volume() {
    return this._data.volume
  }
}
