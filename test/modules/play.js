import Audio from '../..'

export const description = 'play'

export default function() {
  const test = new Audio('http://techslides.com/demos/samples/sample.mp3')
  test.autoPlay = true
  console.log(test)
  test.addEventListener('canplay', evt => {
    test.play()
    console.log('canplay')
  })
}

