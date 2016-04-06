//
//  CustomBtn.m
//  CarSecretary_CS
//
//  Created by kalen on 15/9/9.
//  Copyright (c) 2015年 chewen. All rights reserved.
//

#import "CustomBtn.h"

#import "UIColor+Hex.h"

@interface CustomBtn ()
@property (nonatomic,strong) UIFont *myFont;
@end

@implementation CustomBtn

/**
 *  修改按钮中图片的位置
 *
 *  @param contentRect 默认图片内容所占据的Rect
 *
 *  @return 自定义后的图片的Rect
 */

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageX = 0;
    CGFloat imageY = contentRect.size.height/2.0 - 5;
//    CGFloat imageX = contentRect.origin.x;
//    CGFloat imageY = contentRect.origin.y;
    CGFloat imageH = 10;
    CGFloat imageW = 10;

    return CGRectMake(imageX, imageY, imageW, imageH);
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageX = 10;
    CGFloat imageY = 0;
    //    CGFloat imageX = contentRect.origin.x;
    //    CGFloat imageY = contentRect.origin.y;
    CGFloat imageH = 20;
    CGFloat imageW = 50;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
