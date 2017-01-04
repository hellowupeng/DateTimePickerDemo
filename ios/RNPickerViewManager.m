//
//  RNPickerViewManager.m
//  DatePickerDemo
//
//  Created by AndyWu on 2016/12/27.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNPickerViewManager.h"
#import "HcdDateTimePickerView.h"
#import "RNPickerView.h"

@implementation RNPickerViewManager

RCT_EXPORT_MODULE()
- (UIView *)view {
  RNPickerView *picker = [RNPickerView new];
  picker.delegate = self;
  return picker;
}

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

#pragma mark - RNPickerViewDelegate
- (void)pickerViewDidConfirm:(RNPickerView *)pickerView {
  NSDictionary *params = @{@"data": @"12345"};
  pickerView.onPickerConfirm(params);
}

- (void)pickerViewDidCancel:(RNPickerView *)pickerView {
  NSLog(@"picker did cancel");
  NSDictionary *params = @{@"data": @"54321"};
  pickerView.onPickerCancel(params);
}
RCT_EXPORT_VIEW_PROPERTY(onPickerConfirm, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onPickerCancel, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(minYear, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(maxYear, NSInteger)

@end
