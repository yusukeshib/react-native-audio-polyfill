import React, { Component } from 'react'
import Button from './button'
import tests from './modules'

export default class Main extends Component {
  constructor(props) {
    super(props)
    this.state = {}
    this._index = -1
    this.onTouchEnd = this.onTouchEnd.bind(this)
    this.next = this.next.bind(this)
  }
  async update(fn) {
    if(fn) await fn()
  }
  next() {
    if(this._test && this._test.unload) this._test.unload()

    this._index = (this._index + 1) % tests.length

    const test =  tests[this._index]

    this.setState({ name: test.description })
    this.update(test.default)
    this._test = test
  }
  componentDidMount() {
    this.next()
  }
  onTouchEnd() {
    this.next()
  }
  render() {
    const { name } = this.state
    return (
      <Button title={name} onPress={this.next} />
    )
  }
}
