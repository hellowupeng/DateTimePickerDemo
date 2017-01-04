//
//  RNPickerView.h
//  DatePickerDemo
//
//  Created by AndyWu on 2016/12/27.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTComponent.h"
@class RNPickerView;

@protocol RNPickerViewDelegate <NSObject>

@required
- (void)pickerViewDidConfirm:(RNPickerView *)pickerView;
- (void)pickerViewDidCancel:(RNPickerView *)pickerView;

@end

@interface RNPickerView : UIView

@property (nonatomic, weak) id<RNPickerViewDelegate> delegate;
@property (nonatomic, copy) RCTBubblingEventBlock onPickerConfirm;
@property (nonatomic, copy) RCTBubblingEventBlock onPickerCancel;
@property (nonatomic, assign) NSInteger minYear;
@property (nonatomic, assign) NSInteger maxYear;

@end
