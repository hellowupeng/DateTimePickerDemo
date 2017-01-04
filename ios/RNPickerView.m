//
//  RNPickerView.m
//  DatePickerDemo
//
//  Created by AndyWu on 2016/12/27.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNPickerView.h"
#import "HcdDateTimePickerView.h"

@implementation RNPickerView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self initDatePickerView];
  }
  return self;
}

- (void)initDatePickerView {
  __weak RNPickerView *weakSelf = self;
  HcdDateTimePickerView *picker = [[HcdDateTimePickerView alloc] initWithDatePickerMode:DatePickerDateHourMinuteMode defaultDateTime:[[NSDate alloc] initWithTimeIntervalSinceNow:0]];
  picker.topViewColor = [UIColor greenColor];
  picker.title = @"提示文字";
  picker.titleColor = [UIColor grayColor];
//  NSLog(@"minYear %ld, maxYear %ld", _minYear, _maxYear);
  [picker setMinYear:2015];
  [picker setMaxYear:2018];
  picker.clickedOkBtn = ^(NSString * datetimeStr){
    RNPickerView *innerself = weakSelf;
    //      NSLog(@"%@", datetimeStr);
    [innerself.delegate pickerViewDidConfirm:innerself];
  };
  picker.clickedCancelButton = ^{
    RNPickerView *innerSelf = weakSelf;
    NSLog(@"clicked cancel button");
    [innerSelf.delegate pickerViewDidCancel:innerSelf];
  };
  [self addSubview:picker];
  [picker showHcdDateTimePicker];
}

@end
