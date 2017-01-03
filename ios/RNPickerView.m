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
    __weak RNPickerView *weakSelf = self;
    HcdDateTimePickerView *picker = [[HcdDateTimePickerView alloc] initWithDatePickerMode:DatePickerDateHourMinuteMode defaultDateTime:[[NSDate alloc] initWithTimeIntervalSinceNow:1000]];
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
  return self;
}

@end
