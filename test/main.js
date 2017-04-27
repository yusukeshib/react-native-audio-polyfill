import React, { Component } from 'react'
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
  async update(fn) {
    if(fn) await fn()
  }
  next() {
    this._index = (this._index + 1) % tests.length
    const test =  tests[this._index]
    this.setState({ name: test.description })
    this.update(test.default)
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
      <Text>{name}</Text>
    )
  }
}
