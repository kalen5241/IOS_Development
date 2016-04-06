//
//  NSString+Util.h
//  CarSecretary
//
//  Created by Robin on 15/9/24.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

/*
 * 判断字符串是否为空
 * [NSString isBlank:nil] == YES
 * [NSString isBlank:@""] == YES
 * [NSString isBlank:@"   "] == YES
 * [NSString isBlank:@" ss"] == NO
 */
+ (BOOL)isBlank:(NSString *)str;

+ (NSString *)trim:(NSString *)str;

/*
 * 判断给定字符串去掉首尾空格后是否为电话号码，只验证了位数
 */
+ (BOOL)isPhoneNum:(NSString *)str;

@end
