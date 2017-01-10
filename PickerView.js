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
    /**
     * 显示 date picker
     */
    show: React.PropTypes.func,
    /**
     * 最小年份
     */
    minYear: React.PropTypes.number,
    /**
     * 最大年份
     */
    maxYear: React.PropTypes.number,
    /**
     * 设置默认选中日期时间
     */
    defaultTime: React.PropTypes.string,
  };
  constructor(props) {
    super(props);
    this.state = {
      showPicker: false,
    };
  }

  componentDidMount() {
  }

  componentWillUnmount() {
  }

  show() {
    this.setState({ showPicker: true });
  }

  hide() {
    this.setState({ showPicker: false });
  }

  render() {
    const { showPicker } = this.state;
    if (!showPicker) return null;
    const { minYear, maxYear, datePickerMode, title, onPickerConfirm, onPickerCancel, defaultTime } = this.props;
    return (
      <RNPickerView
        style={styles.picker}
        minYear={minYear}
        maxYear={maxYear}
        datePickerMode={datePickerMode}
        defaultTime={defaultTime}
        title={title}
        onPickerConfirm={(event) => onPickerConfirm(event.nativeEvent.data)}
        onPickerCancel={(event) => onPickerCancel(event.nativeEvent.data)}
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