import Audio from '../..'

let test

export const description = 'play remote'

export default function() {
  test = new Audio()
  // test.autoplay = true
  test.addEventListener('canplay', evt => {
    test.play()
  })
  test.addEventListener('timeupdate', evt => {
    console.log('timeupdate:', test.currentTime)
  })
  test.src = 'https://ia802508.us.archive.org/5/items/testmp3testfile/mpthreetest.mp3'
  test.load()
}

export const unload = function() {
  test.src = ''
}

