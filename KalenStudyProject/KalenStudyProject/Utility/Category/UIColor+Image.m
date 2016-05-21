//
//  UIColor+Image.m
//  CarSecretary
//
//  Created by Robin on 15/9/23.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import "UIColor+Image.h"

@implementation UIColor (Image)

+ (UIImage *)convertColorToImage:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
