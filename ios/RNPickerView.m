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

#pragma mark - init methods
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
  _picker.titleColor = [UIColor grayColor];
  // click OK button callback
  _picker.clickedOkBtn = ^(NSString * datetimeStr) {
    RNPickerView *innerself = weakSelf;
    NSDictionary *params = @{@"data": datetimeStr};
    innerself.onPickerConfirm(params);
  };
  // Click cancel button callback
  _picker.clickedCancelButton = ^{
    RNPickerView *innerSelf = weakSelf;
    NSDictionary *params = @{@"data": @"0"};
    innerSelf.onPickerCancel(params);
  };
  // Selected date change callback
  _picker.selectedDateBlock = ^(NSString *selectedDate) {
    NSLog(@"selectedDate ---- %@", selectedDate);
    RNPickerView *innerSelf = weakSelf;
    innerSelf.picker.title = selectedDate;
  };
  [self addSubview:_picker];
  [_picker showHcdDateTimePicker];
}

#pragma mark - private methods
- (NSDate *)dateFromString:(NSString *)string {
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  dateFormatter.dateFormat = [self dateFormatterString];
  NSDate *date = [dateFormatter dateFromString:string];
  return date;
}

- (NSString *)dateFormatterString {
  NSString *dateFormatterString = [NSString new];
  switch (self.datePickerMode) {
    case DatePickerDateMode:
      dateFormatterString = @"yyyy-MM-dd";
      break;
    case DatePickerTimeMode:
      dateFormatterString = @"HH:mm:ss";
      break;
    case DatePickerDateTimeMode:
      dateFormatterString = @"yyyy-MM-dd HH:mm:ss";
      break;
    case DatePickerYearMonthMode:
      dateFormatterString = @"yyyy-MM";
      break;
    case DatePickerMonthDayMode:
      dateFormatterString = @"MM-dd";
      break;
    case DatePickerHourMinuteMode:
      dateFormatterString = @"HH:mm";
      break;
    case DatePickerDateHourMinuteMode:
      dateFormatterString = @"yyyy-MM-dd HH:mm:ss";
      break;
    default:
      dateFormatterString = @"yyyy-MM-dd";
      break;
  }
  return dateFormatterString;
}

#pragma mark - getters and setters
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

- (void)setDefaultTime:(NSString *)defaultTime {
  NSDate *date = [self dateFromString:defaultTime];
  _picker.defaultDate = date;
  _picker.title = defaultTime;
}

- (void)setTitle:(NSString *)title {
  _picker.title = title;
}

- (void)setLanguageType:(LanguageType)languageType {
  if (languageType == LanguageTypeEnglish) {
    _picker.language = LanguageTypeEnglish;
  } else {
    _picker.language = LanguageTypeChinese;
  }
}

@end
