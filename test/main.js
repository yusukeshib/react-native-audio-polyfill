import React, { Component } from 'react'
import Button from './button'
import { View } from 'react-native'
import Audio from 'react-native-audio-polyfill'

import testMp3 from './test.mp3'

class Test {
  constructor() {
    this._test = new Audio()
  }
  load() {
    this._test.src = testMp3
    this._test.play()
  }
  unload() {
    this._test.src = undefined
    this._test.unload()
  }
}

export default class Main extends Component {
  constructor(props) {
    super(props)
    this.onAdd = this.onAdd.bind(this)
    this.onRemove = this.onRemove.bind(this)
    this._queue = []
  }
  onAdd() {
    const t = new Test()
    t.load()
    this._queue.push(t)
  }
  onRemove() {
    const t = this._queue.shift()
    if(t) t.unload()
  }
  render() {
    return (
      <View>
        <Button title='+' onPress={this.onAdd} />
        <Button title='-' onPress={this.onRemove} />
      </View>
    )
  }
}
