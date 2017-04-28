import Audio from '../..'
import mp3Test from './mpthreetest'

let test

export const description = 'play with base64'

export default function() {
  test = new Audio(mp3Test)
  test.autoPlay = true
  console.log(test)
  test.addEventListener('canplay', evt => {
    test.play()
    console.log('canplay')
  })
  test.addEventListener('durationchange', evt => {
    console.log('duration:', test.duration)
  })
}

export const unload = function() {
  test.pause()
}
