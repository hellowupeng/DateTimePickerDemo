//
//  HcdUnitView.m
//  DatePickerDemo
//
//  Created by AndyWu on 1/10/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#define kTopViewHeight kScaleFrom_iPhone5_Desgin(44)

#import "HcdUnitView.h"

@interface HcdUnitView ()

@property (nonatomic, strong) HcdTextView *yearUnitView;
@property (nonatomic, strong) HcdTextView *monthUnitView;
@property (nonatomic, strong) HcdTextView *dayUnitView;
@property (nonatomic, strong) HcdTextView *hourUnitView;
@property (nonatomic, strong) HcdTextView *minuteUnitView;
@property (nonatomic, strong) HcdTextView *secondUnitView;

@end

@implementation HcdUnitView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor blueColor];
  }
  return self;
}

- (instancetype)initWithDatePickerMode:(DatePickerMode)datePickerMode {
  CGRect unitViewRect = CGRectMake(0, kTopViewHeight, kScreen_Width, unitViewHeight);
  self = [[HcdUnitView alloc] initWithFrame:unitViewRect];
  
  self.yearUnitView = [[HcdTextView alloc] initWithTitle:NSLocalizedString(@"年", nil)];
  self.yearUnitView.backgroundColor = [UIColor redColor];
  [self addSubview:_yearUnitView];
  self.monthUnitView = [[HcdTextView alloc] initWithTitle:NSLocalizedString(@"月", nil)];
  self.monthUnitView.backgroundColor = [UIColor orangeColor];
  [self addSubview:_monthUnitView];
  self.dayUnitView = [[HcdTextView alloc] initWithTitle:NSLocalizedString(@"日", nil)];
  self.dayUnitView.backgroundColor = [UIColor yellowColor];
  [self addSubview:_dayUnitView];
  self.hourUnitView = [[HcdTextView alloc] initWithTitle:NSLocalizedString(@"时", nil)];
  self.hourUnitView.backgroundColor = [UIColor greenColor];
  [self addSubview:_hourUnitView];
  self.minuteUnitView = [[HcdTextView alloc] initWithTitle:NSLocalizedString(@"分", nil)];
  self.minuteUnitView.backgroundColor = [UIColor blueColor];
  [self addSubview:_minuteUnitView];
  self.secondUnitView = [[HcdTextView alloc] initWithTitle:NSLocalizedString(@"秒", nil)];
  self.secondUnitView.backgroundColor = [UIColor purpleColor];
  [self addSubview:_secondUnitView];
  [self updateFrameWithDatePickerMode:datePickerMode];
  return self;
}

- (void)updateFrameWithDatePickerMode:(DatePickerMode)datePickerMode {
  switch (datePickerMode) {
    case DatePickerDateMode: // 年月日
    {
      self.yearUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.34, unitViewHeight);
      self.monthUnitView.frame = CGRectMake(kScreen_Width*0.34, 0, kScreen_Width*0.33, unitViewHeight);
      self.dayUnitView.frame = CGRectMake(kScreen_Width*0.67, 0, kScreen_Width*0.33, unitViewHeight);
      self.hourUnitView.frame = CGRectZero;
      self.minuteUnitView.frame = CGRectZero;
      self.secondUnitView.frame = CGRectZero;
      [self.yearUnitView updateTitleRect];
      [self updateTitle];
    }
      break;
    case DatePickerTimeMode: // 时分秒
    {
      self.yearUnitView.frame = CGRectZero;
      self.monthUnitView.frame = CGRectZero;
      self.dayUnitView.frame = CGRectZero;
      self.hourUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.34, unitViewHeight);
      self.minuteUnitView.frame = CGRectMake(kScreen_Width*0.34, 0, kScreen_Width*0.33, unitViewHeight);
      self.secondUnitView.frame = CGRectMake(kScreen_Width * 0.67, 0, kScreen_Width*0.33, unitViewHeight);
      [self updateTitle];
    }
      break;
    case DatePickerDateTimeMode: // 年月日时分秒
    {
      self.yearUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.25, unitViewHeight);
      self.monthUnitView.frame = CGRectMake(kScreen_Width*0.25, 0, kScreen_Width*0.15, unitViewHeight);
      self.dayUnitView.frame = CGRectMake(kScreen_Width*0.40, 0, kScreen_Width*0.15, unitViewHeight);
      self.hourUnitView.frame = CGRectMake(kScreen_Width*0.55, 0, kScreen_Width*0.15, unitViewHeight);
      self.minuteUnitView.frame = CGRectMake(kScreen_Width*0.70, 0, kScreen_Width*0.15, unitViewHeight);
      self.secondUnitView.frame = CGRectMake(kScreen_Width * 0.85, 0, kScreen_Width*0.15, unitViewHeight);
      [self updateTitle];
    }
      break;
    case DatePickerYearMonthMode: // 年月
    {
      self.yearUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.5, unitViewHeight);
      self.monthUnitView.frame = CGRectMake(kScreen_Width*0.5, 0, kScreen_Width*0.5, unitViewHeight);
      self.dayUnitView.frame = CGRectZero;
      self.hourUnitView.frame = CGRectZero;
      self.minuteUnitView.frame = CGRectZero;
      self.secondUnitView.frame = CGRectZero;
      [self updateTitle];
    }
      break;
    case DatePickerMonthDayMode: // 月日
    {
      self.yearUnitView.frame = CGRectZero;
      self.monthUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.5, unitViewHeight);
      self.dayUnitView.frame = CGRectMake(kScreen_Width*0.5, 0, kScreen_Width*0.5, unitViewHeight);
      self.hourUnitView.frame = CGRectZero;
      self.minuteUnitView.frame = CGRectZero;
      self.secondUnitView.frame = CGRectZero;
      [self updateTitle];
    }
      break;
    case DatePickerHourMinuteMode: // 时分
    {
      self.yearUnitView.frame = CGRectZero;
      self.monthUnitView.frame = CGRectZero;
      self.dayUnitView.frame = CGRectZero;
      self.hourUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.5, unitViewHeight);
      self.minuteUnitView.frame = CGRectMake(kScreen_Width*0.5, 0, kScreen_Width*0.5, unitViewHeight);
      self.secondUnitView.frame = CGRectZero;
      [self updateTitle];
    }
      break;
    case DatePickerDateHourMinuteMode: // 年月日时分
    {
      self.yearUnitView.frame = CGRectMake(0, 0, kScreen_Width*0.28, unitViewHeight);
      self.monthUnitView.frame = CGRectMake(kScreen_Width*0.28, 0, kScreen_Width*0.18, unitViewHeight);
      self.dayUnitView.frame = CGRectMake(kScreen_Width*0.46, 0, kScreen_Width*0.18, unitViewHeight);
      self.hourUnitView.frame = CGRectMake(kScreen_Width*0.64, 0, kScreen_Width*0.18, unitViewHeight);
      self.minuteUnitView.frame = CGRectMake(kScreen_Width*0.82, 0, kScreen_Width*0.18, unitViewHeight);
      [self updateTitle];
    }
      break;
      
    default:
      break;
  }
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
  self.titleLabel.frame = CGRectMake((self.bounds.size.width - titleSize.width) / 2.0, (self.bounds.size.height - titleSize.height) / 2.0, titleSize.width, titleSize.height);
}

@end
