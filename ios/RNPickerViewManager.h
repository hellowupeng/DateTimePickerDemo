//
//  RCTPickerViewManager.h
//  DatePickerDemo
//
//  Created by AndyWu on 2016/12/27.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTViewManager.h"
#import "RCTBridgeModule.h"
@class HcdDateTimePickerView;
#import "RNPickerView.h"

@interface RNPickerViewManager : RCTViewManager<RCTBridgeModule>

@property (nonatomic) HcdDateTimePickerView *pickerView;
@property (nonatomic) UIView *view;

@end
