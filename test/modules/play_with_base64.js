import Audio from '../..'
import mp3Test from './mpthreetest'

let test

export const description = 'play with base64'

export default function() {
  test = new Audio(mp3Test)
  // test.autoplay = true
  test.addEventListener('canplay', evt => {
    test.play()
  })
  test.addEventListener('durationchange', evt => {
    console.log('duration:', test.duration)
  })
  test.load()
}

export const unload = function() {
  test.src = ''
}
