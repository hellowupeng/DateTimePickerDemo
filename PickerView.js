import React, { Component } from 'react';
import { Dimensions, NativeModules, requireNativeComponent, StyleSheet } from 'react-native';
const RNPickerView = requireNativeComponent('RNPickerView', Picker);
const { RNPickerViewManager } = NativeModules;

export default class Picker extends Component {
  static propTypes={
    /**
     * `onPickerConfirm` (`function`)
     * 当选择 date picker `确定`按钮时调用时调用该 function.
     */
    onPickerConfirm: React.PropTypes.func,
  };
  constructor(props) {
    super(props);
    this.state = {
      showPicker: false,
    };
  }

  componentWillUnmount() {
    clearTimeout(this.timeoutID);
  }

  show() {
    this.setState({ showPicker: true });
  }

  onPickerConfirm(event) {
    console.log('event ----- ', event.nativeEvent.data);
    this.setState({ showPicker: false });
  }

  onPickerCancel(event) {
    console.log('event ----- ', event.nativeEvent.data);
    this.setState({ showPicker: false });
  }

  render() {
    const { showPicker } = this.state;
    if (!showPicker) return null;
    return (
      <RNPickerView style={styles.picker}
        {...this.props}
        onPickerConfirm={(event) => this.onPickerConfirm(event)}
        onPickerCancel={(event) => this.onPickerCancel(event)}
      />
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