import Audio from '../..'
import mp3Test from './mpthreetest.mp3'

let test

export const description = 'play with resource'

export default function() {
  test = new Audio(mp3Test)
  // test.autoplay = true
  test.addEventListener('canplay', evt => {
    test.play()
  })
  test.load()
}

export const unload = function() {
  test.src = ''
}
