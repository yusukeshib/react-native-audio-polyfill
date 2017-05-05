import { Platform, NativeEventEmitter, DeviceEventEmitter, NativeModules } from 'react-native'
import EventEmitter from 'event-emitter'
import resolveAssetSource from 'react-native/Libraries/Image/resolveAssetSource'
import { error, log } from './utils/console'

const { UniversalAudio } = NativeModules

const n = (v, def) => parseFloat(v === undefined || isNaN(v) ? def || 0 : v)
const s = (v, def) => `${v === undefined ? def || '' : v}`
const b = (v, def) => v === undefined ? (!!def) || false : !!v

const audioMap = {}

const emitter = new NativeEventEmitter(UniversalAudio)
emitter.addListener('UniversalAudioEvent', evt => {
  const audio = audioMap[evt.audioId]
  if(!audio) return
  audio._emit(evt)
})

const TYPES = [
'abort',
'canplay',
'canplaythrough',
'durationchange',
'emptied',
'ended',
'error',
'loadeddata',
'loadedmetadata',
'loadstart',
'pause',
'play',
'playing',
'progress',
'ratechange',
'seeked',
'seeking',
'stalled',
'suspend',
'timeupdate',
'volumechange',
'waiting'
]

export default class Audio {
  set ['on' + ((type) => type)(TYPES)](listener) {
    const current  = this[`_on${type}`]
    if(current) this._emitter.off(type, current)
    if(listener) this._emitter.on(type, listener)
    this[`_on${type}`] = listener
  }
  get ['on' + ((type) => type)(TYPES)]() {
    return this[`_on${type}`]
  }
  constructor(url) {
    this._source = url
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
    this._init().then(() => {
      this._emitter.emit('init')
      if(this._source) this.src = this._source
    }, err => {
      error('Audio error:', err)
    })
  }
  async _init() {
    const ret = await UniversalAudio.create()
    this._audioId = ret.audioId
    audioMap[this._audioId] = this
  }
  _emit(evt) {
    this._data = { ...this._data, ...evt }
    // log('emitting:', evt.type, this._data)
    this._emitter.emit(evt.type, evt)
  }
  addEventListener(type, listener) {
    this._emitter.on(type, listener)
  }
  removeEventListener(type, listener) {
    this._emitter.off(type, listener)
  }
  addTextTrack(v) { if(!this._audioId) return
    UniversalAudio.addTextTrack(this._audioId, v)
  }
  async canPlayType(mediaType) {
    if(!this._audioId) return false
    return await UniversalAudio.canPlayType(this._audioId, s(mediaType))
  }
  waitForInit() {
    return new Promise((resolve, reject) => {
      this._emitter.once('init', resolve)
      this._emitter.once('error', reject)
    })
  }
  async load() {
    if(!this._audioId) await this.waitForInit()
    UniversalAudio.load(this._audioId)
  }
  async play() {
    if(!this._audioId) await this.waitForInit()
    UniversalAudio.play(this._audioId)
  }
  async pause() {
    if(!this._audioId) await this.waitForInit()
    UniversalAudio.pause(this._audioId)
  }
  get audioTracks() {
    return this._data.audioTracks
  }
  set autoplay(v) {
    if(!this._audioId) return
    UniversalAudio.setAutoplay(this._audioId, b(v))
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
    UniversalAudio.setControls(this._audioId, b(v))
  }
  get controls() {
    return this._data.controls
  }
  set crossOrigin(v) {
    if(!this._audioId) return
    UniversalAudio.setCrossOrigin(this._audioId, s(v))
  }
  get crossOrigin() {
    return this._data.crossOrigin
  }
  get currentSrc() {
    return this._data.currentSrc
  }
  set currentTime(v) {
    if(!this._audioId) return
    UniversalAudio.setCurrentTime(this._audioId, n(v))
  }
  get currentTime() {
    return this._data.currentTime
  }
  set defaultMuted(v) {
    if(!this._audioId) return
    UniversalAudio.setDefaultMuted(this._audioId, b(v))
  }
  get defaultMuted() {
    return this._data.defaultMuted
  }
  set defaultPlaybackRate(v) {
    if(!this._audioId) return
    UniversalAudio.setDefaultPlaybackRate(this._audioId, n(v, 1))
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
    UniversalAudio.setLoop(this._audioId, b(v))
  }
  get loop() {
    return this._data.loop
  }
  set mediaGroup(v) {
    if(!this._audioId) return
    UniversalAudio.setMediaGroup(this._audioId, s(v))
  }
  get mediaGroup() {
    return this._data.mediaGroup
  }
  set muted(v) {
    if(!this._audioId) return
    UniversalAudio.setMuted(this._audioId, b(v))
  }
  get muted() {
    return this._data.muted
  }
  get networkState() {
    return this._data.networkState
  }
  set paused(v) {
    if(!this._audioId) return
    UniversalAudio.setPaused(this._audioId, b(v))
  }
  get paused() {
    return this._data.paused
  }
  set playbackRate(v) {
    if(!this._audioId) return
    UniversalAudio.setPlaybackRate(this._audioId, n(v, 1))
  }
  get playbackRate() {
    return this._data.playbackRate
  }
  get played() {
    return this._data.played
  }
  set preload(v) {
    if(!this._audioId) return
    UniversalAudio.setPreload(this._audioId, b(v))
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
    this._source = v
    if(!this._audioId) return
    if(typeof v === 'number') {
      const source = resolveAssetSource(v)
      v = source && source.uri
    }
		UniversalAudio.setSource(this._audioId, s(v))
  }
  get src() {
    return this._data.src
  }
  get textTracks() {
    return this._data.textTraks
  }
  set volume(v) {
    if(!this._audioId) return
    UniversalAudio.setVolume(this._audioId, n(v))
  }
  get volume() {
    return this._data.volume
  }
}
