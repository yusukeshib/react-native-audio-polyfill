import Audio from '../..'

let test

export const description = 'play'

export default function() {
  test = new Audio('https://ia802508.us.archive.org/5/items/testmp3testfile/mpthreetest.mp3')
  test.autoPlay = true
  test.addEventListener('canplay', evt => {
    test.play()
  })
  test.addEventListener('timeupdate', evt => {
    console.log('timeupdate:', test.currentTime)
  })
}

export const unload = function() {
  test.pause()
}

