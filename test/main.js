import React, { Component } from 'react'
import View from './components/view'
import Text from './components/text'
import tests from './modules'

export default class Main extends Component {
  constructor(props) {
    super(props)
    this.state = {}
    this._index = -1
    this.onTouchEnd = this.onTouchEnd.bind(this)
    this.next = this.next.bind(this)
  }
  // async update(fn) {

  //   const context = this.canvas.getContext()
  //   if(!context) return

  //   // clear
  //   context.save()
  //   context.fillStyle = '#fff'
  //   context.rect(0, 0, 320, 320)
  //   context.fill()
  //   context.restore()

  //   // grid
  //   context.save()
  //   context.strokeStyle = '#ccc'
  //   context.lineWidth = 1
  //   for(let x = 0; x < 320; x += 20) {
  //     context.beginPath()
  //     context.moveTo(x, 0)
  //     context.lineTo(x, 320)
  //     context.stroke()
  //   }
  //   for(let y = 0; y < 320; y += 20) {
  //     context.beginPath()
  //     context.moveTo(0, y)
  //     context.lineTo(320, y)
  //     context.stroke()
  //   }
  //   context.restore()

  //   context.save()
  //   if(fn) await fn(context)
  //   context.restore()

  //   if(context.update) context.update()
  // }
  next() {
    this._index = (this._index + 1) % tests.length
    const test =  tests[this._index]
    this.setState({ name: test.description })
    this.update(test.default)
  }
  onTouchEnd() {
    this.next()
  }
  render() {
    const { name } = this.state
    return (
      <View style={{
        backgroundColor: '#ccc',
        position: 'absolute',
        left:0,
        right:0,
        bottom: 0,
        top: 0,
        alignItems: 'center',
        justifyContent: 'center'
      }}>
        <Text style={{
          position: 'absolute',
          color: '#000',
          top: 10,
          left: 10
        }}>{name}</Text>
      </View>
    )
  }
}
