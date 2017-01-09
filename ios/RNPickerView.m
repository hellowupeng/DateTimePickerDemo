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
  _picker = [[HcdDateTimePickerView alloc] initWithDatePickerMode:DatePickerDateHourMinuteMode defaultDateTime:[[NSDate alloc] initWithTimeIntervalSinceNow:0]];
  NSLog(@"datePickerMode ---- %u", _picker.datePickerMode);
  _picker.topViewColor = [UIColor greenColor];
  _picker.title = @"提示文字";
  _picker.titleColor = [UIColor grayColor];
  _picker.clickedOkBtn = ^(NSString * datetimeStr){
    RNPickerView *innerself = weakSelf;
    //      NSLog(@"%@", datetimeStr);
    NSDictionary *params = @{@"data": @"12345"};
    innerself.onPickerConfirm(params);
  };
  _picker.clickedCancelButton = ^{
    RNPickerView *innerSelf = weakSelf;
    NSLog(@"clicked cancel button");
    NSDictionary *params = @{@"data": @"54321"};
    innerSelf.onPickerCancel(params);
  };
  [self addSubview:_picker];
  [_picker showHcdDateTimePicker];
}

- (void)setMinYear:(NSInteger)minYear {
  NSLog(@"minYear ---- %ld", minYear);
  _picker.minYear = minYear;
}

- (NSInteger)minYear {
  return _picker.minYear;
}

- (void)setMaxYear:(NSInteger)maxYear {
  NSLog(@"maxYear --- %ld", maxYear);
  _picker.maxYear = maxYear;
}

- (NSInteger)maxYear {
  return _picker.maxYear;
}

- (void)setDatePickerMode:(NSInteger)datePickerMode {
  switch (datePickerMode) {
    case 1:
      _picker.datePickerMode = DatePickerDateMode;
      break;
    case 2:
      _picker.datePickerMode = DatePickerTimeMode;
      break;
      
    default:
      _picker.datePickerMode = DatePickerDateMode;
      break;
  }
}

- (NSInteger)datePickerMode {
  return _picker.datePickerMode;
}

@end
