//
//  UIColor+HexUIColor.h
//  CarSecretary
//
//  Created by Robin on 15/7/16.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 * 所有边框的颜色,提示信息 颜色 浅灰色
 */
+ (UIColor *)colorWithLineColor;

/**
 * 7c7c7c字体 颜色 中浅灰色
 */
+ (UIColor *)colorWithSevenCFontColor;

/**
 * 3d3d3d字体 颜色 深浅灰色
 */
+ (UIColor *)colorWithThreeDFontColor;

/**
 * 42b244 按钮背景颜色 绿色
 */
+ (UIColor *)colorWithFourTwoButtonColor;

/**
 * ff7301 按钮背景颜色 橙色
 */
+ (UIColor *)colorWithFFButtonColor;

/**
 * 3c3c3e 按钮背景颜色
 */
+ (UIColor *)colorWithThreeCButtonColor;

@end
