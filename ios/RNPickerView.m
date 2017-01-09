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
  _picker = [[HcdDateTimePickerView alloc] initWithDatePickerMode:DatePickerDateMode defaultDateTime:[[NSDate alloc] initWithTimeIntervalSinceNow:0]];
  _picker.topViewColor = [UIColor greenColor];
//  _picker.title = @"";
  _picker.titleColor = [UIColor grayColor];
  _picker.clickedOkBtn = ^(NSString * datetimeStr){
    RNPickerView *innerself = weakSelf;
    NSDictionary *params = @{@"data": datetimeStr};
    innerself.onPickerConfirm(params);
  };
  _picker.clickedCancelButton = ^{
    RNPickerView *innerSelf = weakSelf;
    NSDictionary *params = @{@"data": @"0"};
    innerSelf.onPickerCancel(params);
  };
  [self addSubview:_picker];
  [_picker showHcdDateTimePicker];
}

- (void)setMinYear:(NSInteger)minYear {
  _picker.minYear = minYear;
}

- (NSInteger)minYear {
  return _picker.minYear;
}

- (void)setMaxYear:(NSInteger)maxYear {
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
    case 3:
      _picker.datePickerMode = DatePickerDateTimeMode;
      break;
    case 4:
      _picker.datePickerMode = DatePickerYearMonthMode;
      break;
    case 5:
      _picker.datePickerMode = DatePickerMonthDayMode;
      break;
    case 6:
      _picker.datePickerMode = DatePickerHourMinuteMode;
      break;
    case 7:
      _picker.datePickerMode = DatePickerDateHourMinuteMode;
      break;
      
    default:
      _picker.datePickerMode = DatePickerDateMode;
      break;
  }
}

- (NSInteger)datePickerMode {
  return _picker.datePickerMode;
}
// 选中时间
- (void)setDefaultTime:(NSString *)defaultTime {
  NSDate *date = [self dateFromString:defaultTime];
  _picker.defaultDate = date;
}

- (NSDate *)dateFromString:(NSString *)string {
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
  NSDate *date = [dateFormatter dateFromString:string];
  return date;
}

- (void)setTitle:(NSString *)title {
  _picker.title = title;
}

@end
