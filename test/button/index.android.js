import React, { Component } from 'react'
import { TouchableOpacity, View, Text } from 'react-native'

export default class Button extends Component {
  render() {
    const { onPress, title } = this.props
    return (
      <TouchableOpacity onPress={onPress}>
        <View style={{
          margin: 20,
          backgroundColor: '#00f'
        }}>
        <Text style={{
          color: '#fff',
          padding: 20
        }}>{title}</Text>
        </View>
      </TouchableOpacity>
    )
  }
}
