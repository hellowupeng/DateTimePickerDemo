//
//  HcdUnitView.h
//  DatePickerDemo
//
//  Created by AndyWu on 1/10/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HcdDateTimePickerView.h"

@interface HcdUnitView : UIView

- (instancetype)initWithDatePickerMode:(DatePickerMode)datePickerMode;
- (void)updateFrameWithDatePickerMode:(DatePickerMode)datePickerMode;

@end

/**
 显示年、月、日、时、分、秒
 */
@interface HcdTextView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

- (instancetype)initWithTitle:(NSString *)title;
- (void)updateTitleRect;

@end
