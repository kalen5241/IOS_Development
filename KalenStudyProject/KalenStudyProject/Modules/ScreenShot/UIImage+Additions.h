//
//  UIImage+Additions.h
//  XMLPaserManager
//
//  Created by Lee on 14-3-27.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UIColor(Additions)
- (BOOL)isBlackOrWhite;
@end

@interface UIImage(Additions)
//获取某个点的颜色
+ (UIColor *)colorFromImage:(UIImage *)image atX:(int)x andY:(int)y;
//获取背景颜色
- (UIColor *)imageBgColor;
//转换图片尺寸
+ (void)imageWithImage:(UIImage*)sourceImage
scaledToSizeWithSameAspectRatio:(CGSize)targetSize
                        Success:(void (^)(UIImage *image))success;
@end

