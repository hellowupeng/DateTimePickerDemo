//
//  HcdUnitView.m
//  DatePickerDemo
//
//  Created by AndyWu on 1/10/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#define kTopViewHeight kScaleFrom_iPhone5_Desgin(44)

#import "HcdUnitView.h"
#import "NSString+LocalizedString.h"

@interface HcdUnitView ()

@property (nonatomic, strong) HcdTextView *yearUnitView;
@property (nonatomic, strong) HcdTextView *monthUnitView;
@property (nonatomic, strong) HcdTextView *dayUnitView;
@property (nonatomic, strong) HcdTextView *hourUnitView;
@property (nonatomic, strong) HcdTextView *minuteUnitView;
@property (nonatomic, strong) HcdTextView *secondUnitView;

@end

@implementation HcdUnitView

#pragma mark - init methods
- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
  }
  return self;
}

- (instancetype)initWithDatePickerMode:(DatePickerMode)datePickerMode {
  CGRect unitViewRect = CGRectMake(0, kTopViewHeight, kScreen_Width, unitViewHeight);
  self = [[HcdUnitView alloc] initWithFrame:unitViewRect];
  
  self.yearUnitView = [[HcdTextView alloc] initWithTitle:@"年"];
  [self addSubview:_yearUnitView];
  self.monthUnitView = [[HcdTextView alloc] initWithTitle:@"月"];
  [self addSubview:_monthUnitView];
  self.dayUnitView = [[HcdTextView alloc] initWithTitle:@"日"];
  [self addSubview:_dayUnitView];
  self.hourUnitView = [[HcdTextView alloc] initWithTitle:@"时"];
  [self addSubview:_hourUnitView];
  self.minuteUnitView = [[HcdTextView alloc] initWithTitle:@"分"];
  [self addSubview:_minuteUnitView];
  self.secondUnitView = [[HcdTextView alloc] initWithTitle:@"秒"];
  [self addSubview:_secondUnitView];
  [self updateFrameWithDatePickerMode:datePickerMode];
  return self;
}

- (void)updateFrameWithDatePickerMode:(DatePickerMode)datePickerMode {
  switch (datePickerMode) {
    case DatePickerDateMode: [self updateTextViewWithDateMode]; // 年月日
      break;
    case DatePickerTimeMode: [self updateTextViewWithTimeMode]; // 时分秒
      break;
    case DatePickerDateTimeMode: [self updateTextViewWithDateTimeMode]; // 年月日时分秒
      break;
    case DatePickerYearMonthMode: [self updateTextViewWithYearMonthMode]; // 年月
      break;
    case DatePickerMonthDayMode: [self updateTextViewWithMonthDayMode]; // 月日
      break;
    case DatePickerHourMinuteMode: [self updateTextViewWithHourMinuteMode]; // 时分
      break;
    case DatePickerDateHourMinuteMode: [self updateTextViewWithDateHourMinuteMode]; // 年月日时分
      break;
    default:
      break;
  }
}

- (void)updateTitleLanguage:(LanguageType)languageType {
  [self.yearUnitView updateTitleWithKey:@"年" Language:languageType];
  [self.monthUnitView updateTitleWithKey:@"月" Language:languageType];
  [self.dayUnitView updateTitleWithKey:@"日" Language:languageType];
  [self.hourUnitView updateTitleWithKey:@"时" Language:languageType];
  [self.minuteUnitView updateTitleWithKey:@"分" Language:languageType];
  [self.secondUnitView updateTitleWithKey:@"秒" Language:languageType];
}

#pragma mark - private methods
// DatePickerDateMode = 1
- (void)updateTextViewWithDateMode {
  self.yearUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.34, unitViewHeight);
  self.monthUnitView.frame = CGRectMake(kScreen_Width*0.34, 0, kScreen_Width*0.33, unitViewHeight);
  self.dayUnitView.frame = CGRectMake(kScreen_Width*0.67, 0, kScreen_Width*0.33, unitViewHeight);
  self.hourUnitView.frame = CGRectZero;
  self.minuteUnitView.frame = CGRectZero;
  self.secondUnitView.frame = CGRectZero;
  [self.yearUnitView updateTitleRect];
  [self updateTitle];
}

// DatePickerTimeMode = 2
- (void)updateTextViewWithTimeMode {
  self.yearUnitView.frame = CGRectZero;
  self.monthUnitView.frame = CGRectZero;
  self.dayUnitView.frame = CGRectZero;
  self.hourUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.34, unitViewHeight);
  self.minuteUnitView.frame = CGRectMake(kScreen_Width*0.34, 0, kScreen_Width*0.33, unitViewHeight);
  self.secondUnitView.frame = CGRectMake(kScreen_Width * 0.67, 0, kScreen_Width*0.33, unitViewHeight);
  [self updateTitle];
}

// DatePickerDateTimeMode = 3
- (void)updateTextViewWithDateTimeMode {
  self.yearUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.25, unitViewHeight);
  self.monthUnitView.frame = CGRectMake(kScreen_Width*0.25, 0, kScreen_Width*0.15, unitViewHeight);
  self.dayUnitView.frame = CGRectMake(kScreen_Width*0.40, 0, kScreen_Width*0.15, unitViewHeight);
  self.hourUnitView.frame = CGRectMake(kScreen_Width*0.55, 0, kScreen_Width*0.15, unitViewHeight);
  self.minuteUnitView.frame = CGRectMake(kScreen_Width*0.70, 0, kScreen_Width*0.15, unitViewHeight);
  self.secondUnitView.frame = CGRectMake(kScreen_Width * 0.85, 0, kScreen_Width*0.15, unitViewHeight);
  [self updateTitle];
}

// DatePickerYearMonthMode = 4
- (void)updateTextViewWithYearMonthMode {
  self.yearUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.5, unitViewHeight);
  self.monthUnitView.frame = CGRectMake(kScreen_Width*0.5, 0, kScreen_Width*0.5, unitViewHeight);
  self.dayUnitView.frame = CGRectZero;
  self.hourUnitView.frame = CGRectZero;
  self.minuteUnitView.frame = CGRectZero;
  self.secondUnitView.frame = CGRectZero;
  [self updateTitle];
}

// DatePickerMonthDayMode = 5
- (void)updateTextViewWithMonthDayMode {
  self.yearUnitView.frame = CGRectZero;
  self.monthUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.5, unitViewHeight);
  self.dayUnitView.frame = CGRectMake(kScreen_Width*0.5, 0, kScreen_Width*0.5, unitViewHeight);
  self.hourUnitView.frame = CGRectZero;
  self.minuteUnitView.frame = CGRectZero;
  self.secondUnitView.frame = CGRectZero;
  [self updateTitle];
}

// DatePickerHourMinuteMode = 6
- (void)updateTextViewWithHourMinuteMode {
  self.yearUnitView.frame = CGRectZero;
  self.monthUnitView.frame = CGRectZero;
  self.dayUnitView.frame = CGRectZero;
  self.hourUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.5, unitViewHeight);
  self.minuteUnitView.frame = CGRectMake(kScreen_Width*0.5, 0, kScreen_Width*0.5, unitViewHeight);
  self.secondUnitView.frame = CGRectZero;
  [self updateTitle];
}

// DatePickerDateHourMinuteMode = 7
- (void)updateTextViewWithDateHourMinuteMode {
  self.yearUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.28, unitViewHeight);
  self.monthUnitView.frame = CGRectMake(kScreen_Width*0.28, 0, kScreen_Width*0.18, unitViewHeight);
  self.dayUnitView.frame = CGRectMake(kScreen_Width*0.46, 0, kScreen_Width*0.18, unitViewHeight);
  self.hourUnitView.frame = CGRectMake(kScreen_Width*0.64, 0, kScreen_Width*0.18, unitViewHeight);
  self.minuteUnitView.frame = CGRectMake(kScreen_Width*0.82, 0, kScreen_Width*0.18, unitViewHeight);
  [self updateTitle];
}

- (void)updateTitle {
  [self.yearUnitView updateTitleRect];
  [self.monthUnitView updateTitleRect];
  [self.dayUnitView updateTitleRect];
  [self.hourUnitView updateTitleRect];
  [self.minuteUnitView updateTitleRect];
  [self.secondUnitView updateTitleRect];
}

@end

@implementation HcdTextView

#pragma mark - init methods
- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor grayColor];
  }
  return self;
}

- (instancetype)initWithTitle:(NSString *)title {
  self = [[HcdTextView alloc] init];
  self.titleLabel.text = title;
  [self addSubview:_titleLabel];
  return self;
}

- (void)updateTitleRect {
  if (self.frame.size.width == 0 || self.frame.size.height == 0) {
    self.titleLabel.hidden = YES;
    return;
  }
  self.titleLabel.hidden = NO;
  NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
  CGSize titleSize = [self.titleLabel.text sizeWithAttributes:dic];
  self.titleLabel.frame = CGRectMake((self.bounds.size.width - titleSize.width) / 2.0,
                                     (self.bounds.size.height - titleSize.height) / 2.0, titleSize.width, titleSize.height);
}

- (void)updateTitleWithKey:(NSString *)key Language:(LanguageType)languageType {
  self.titleLabel.text = [NSString localizedStringWithKey:key languageType:languageType];
}

@end
