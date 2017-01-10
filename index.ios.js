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
    this.state = {
      showPicker: false,
      selectedValue: '',
    };
  }

  componentDidMount() {
    this.defaultTime = '2019-10-10 06:25:22';
  }
  
  componentWillUnmount() {
  }

  show() {
    this.picker.show();
  }

  onPickerConfirm(data) {
    console.log('data ----- ', data);
    this.setState({ selectedValue: data });
    this.picker.hide();
  }

  onPickerCancel(data) {
    console.log('data ----- ', data);
    this.picker.hide();
  }

  render() {
    const { showPicker, selectedValue } = this.state;
    return (
      <View style={styles.container}>
        <View>
          <Text>{selectedValue}</Text>
          <Text style={styles.welcome} onPress={() => this.show()}>
            show Picker
          </Text>
        </View>
        <Picker
          ref={picker => this.picker = picker}
          minYear={2016}
          maxYear={2019}
          datePickerMode={7}
          title={'Title'}
          defaultTime={'2017-10-10 06:25:22'}
          onPickerConfirm={(data) => this.onPickerConfirm(data)}
          onPickerCancel={(data) => this.onPickerCancel(data)}
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