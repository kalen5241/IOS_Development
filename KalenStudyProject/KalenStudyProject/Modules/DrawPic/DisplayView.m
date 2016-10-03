//
//  DisplayView.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "DisplayView.h"
#import "Constants.h"
#import "BezierPathTool.h"
#define SHANGKUANG 30
#define QUXIAN 270

@interface DisplayView ()
@end

@implementation DisplayView

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.arr = array;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
//    [self drawLineChart];
    [self drawBg];
//    [self flashPoint];
//    [self flashPointCenter];
}



//渐变背景
- (void)drawBg {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    BezierPathTool *bT = [[BezierPathTool alloc]init];
    bT.tBounds = self.bounds;
    bT.arr = self.arr;
    CGPathRef path = [[bT fetchDraw1] CGPath];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.2, 1.0};
    NSArray *colors = @[(__bridge id) ([[UIColor yellowColor] CGColor]), (__bridge id) ([[UIColor whiteColor] CGColor])];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(pathRect)-2, CGRectGetMinY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(pathRect)-2, CGRectGetMaxY(pathRect));
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextSetAlpha(context, 1.0);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

//闪烁点

- (void)flashPoint {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    CGContextAddArc(context, self.last.x, self.last.y, 3, 0, 2*M_PI, 1);
    CGContextStrokePath(context);

}

- (void)flashPointCenter {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    CGContextAddArc(context, self.last.x, self.last.y, 2, 0, 2*M_PI, 1);
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillPath(context);
    CGContextStrokePath(context);
 
}

@end
