import Audio from '../..'
import mp3Test from './mpthreetest.mp3'
import mp3Test2 from './mpthreetest'

let test

const sleep = sec => new Promise((resolve ,reject) => setTimeout(resolve, sec*1000))

export const description = 'change src'

export default async function() {
  test = new Audio()

  console.log('a')
  test.src = mp3Test2
  test.play()
  await sleep(3)

  console.log('b')
  test.src = ''
  test.play()
  await sleep(3)

  console.log('c')
  test.src = mp3Test2
  test.play()
}

export const unload = function() {
  test.pause()
}

