//
//  NSString+LocalizedString.m
//  DatePickerDemo
//
//  Created by AndyWu on 1/18/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "NSString+LocalizedString.h"

@implementation NSString (LocalizedString)

+ (NSString *)localizedStringWithKey:(NSString *)key languageType:(LanguageType)languageType {
  if (languageType == LanguageTypeChinese) {
    NSString *string = NSLocalizedStringFromTable(key, @"Chinese", nil);
    return string;
  }
  NSString *string = NSLocalizedStringFromTable(key, @"English", nil);
  return string;
}

@end
