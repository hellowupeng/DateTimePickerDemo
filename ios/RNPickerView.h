//
//  RNPickerView.h
//  DatePickerDemo
//
//  Created by AndyWu on 2016/12/27.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTComponent.h"
@class RNPickerView, HcdDateTimePickerView;

@interface RNPickerView : UIView

@property (nonatomic, strong) HcdDateTimePickerView *picker;
@property (nonatomic, copy) RCTBubblingEventBlock onPickerConfirm;
@property (nonatomic, copy) RCTBubblingEventBlock onPickerCancel;
@property (nonatomic, assign) NSInteger minYear;
@property (nonatomic, assign) NSInteger maxYear;
@property (nonatomic, assign) NSInteger datePickerMode;

@end
