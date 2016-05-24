//
//  NSString+Util.m
//  CarSecretary
//
//  Created by Robin on 15/9/24.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

+ (BOOL)isBlank:(NSString *)str {
    if (!str || str.length == 0) {
        return YES;
    }
    if ([str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {
        return YES;
    }
    return NO;
}

+ (NSString *)trim:(NSString *)str {
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

+ (BOOL)isPhoneNum:(NSString *)str {
    if (!str) {
        return NO;
    }
    if ([self trim:str].length != 11) {
        return NO;
    }
    return YES;
}

@end
