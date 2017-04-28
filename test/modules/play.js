import Audio from '../..'

export const description = 'play'

export default function() {
  const test = new Audio('https://ia802508.us.archive.org/5/items/testmp3testfile/mpthreetest.mp3')
  test.autoPlay = true
  console.log(test)
  test.addEventListener('canplay', evt => {
    test.play()
    console.log('canplay')
  })
}

