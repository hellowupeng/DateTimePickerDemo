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

typedef NS_ENUM(NSInteger, LanguageType) {
  LanguageTypeChinese = 1,
  LanguageTypeEnglish = 2,
};

@interface RNPickerView : UIView

@property (nonatomic, strong) HcdDateTimePickerView *picker;
@property (nonatomic, copy) RCTBubblingEventBlock onPickerConfirm;
@property (nonatomic, copy) RCTBubblingEventBlock onPickerCancel;
@property (nonatomic, assign) NSInteger minYear;
@property (nonatomic, assign) NSInteger maxYear;
@property (nonatomic, assign) NSInteger datePickerMode;
@property (nonatomic, copy) NSString *defaultTime;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) LanguageType languageType;

@end
