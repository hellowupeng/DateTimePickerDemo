/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  Dimensions,
  NativeModules,
  StyleSheet,
  Text,
  View
} from 'react-native';
import Picker from './PickerView';

export default class DatePickerDemo extends Component {
  constructor(props) {
    super(props);
    this.state = { showPicker: false };
  }

  show() {
    this.picker.show();
  }

  render() {
    const { showPicker } = this.state;
    return (
      <View style={styles.container}>
        <View style={{ flexDirection: 'row'}}>
        <Text style={styles.welcome} onPress={() => this.show()}>
          show Picker
        </Text>
        </View>
        <Picker
          ref={picker => this.picker = picker}
        />
      </View>
    );
  }
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  picker: {
    position: 'absolute',
    left: 0,
    top: 0,
    width: Dimensions.get('window').width,
    height: Dimensions.get('window').height,
    backgroundColor: 'green',
  },
});
AppRegistry.registerComponent('DatePickerDemo', () => DatePickerDemo);