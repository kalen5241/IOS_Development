//
//  UIColor+HexUIColor.m
//  CarSecretary
//
//  Created by Robin on 15/7/16.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color {
    return [self colorWithHexString:color alpha:1.0f];
}


/**
 * 所有边框的颜色
 */
+ (UIColor *)colorWithLineColor {
    return  [self colorWithHexString:@"c3c3c3"];
}


/**
 * 7c7c7c字体 颜色
 */
+ (UIColor *)colorWithSevenCFontColor{
    return  [self colorWithHexString:@"7c7c7c"];
}

/**
 * 3d3d3d字体 颜色
 */
+ (UIColor *)colorWithThreeDFontColor {
    return  [self colorWithHexString:@"3d3d3d"];
}

/**
 * 42b244 按钮背景颜色
 */
+ (UIColor *)colorWithFourTwoButtonColor {
    return  [self colorWithHexString:@"42b244"];
}

/**
 * ff7301 按钮背景颜色
 */
+ (UIColor *)colorWithFFButtonColor{
    return  [self colorWithHexString:@"ff7301"];
}

/**
 * 3c3c3e 按钮背景颜色
 */
+ (UIColor *)colorWithThreeCButtonColor{
    return  [self colorWithHexString:@"3c3c3e"];
}


@end
