//
//  ArcView.m
//  KalenStudyProject
//
//  Created by kalen on 16/9/28.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ArcView.h"

@implementation ArcView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawBg];
    [self bgCircle:rect];
    [[self cir] stroke];
    [self valueCircle:rect];
    
}

- (void)bgCircle:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    
    double radius = rect.size.width / 2.0;
    
    CGContextAddArc(context, radius, radius, radius-1, M_PI/6.0, 2*M_PI/3.0+M_PI/6.0, 1);
    
    CGContextStrokePath(context);
}

- (void)valueCircle:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 5);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    
//    CGContextSetLineCap(context, kCGLineCapRound);
    
    double radius = rect.size.width / 2.0;
    
    CGContextAddArc(context, radius, radius, radius-5, 0, -([self calculate:self.currentValue]), 1);
    
    CGContextStrokePath(context);
}

- (CGFloat)calculate:(CGFloat)value {
    
    return M_PI * value;
}

- (void)drawBg {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPathRef path = [[self cir] CGPath];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.2, 1.0};
    NSArray *colors = @[(__bridge id) ([[UIColor redColor] CGColor]), (__bridge id) ([[UIColor whiteColor] CGColor])];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextSetAlpha(context, 1.0);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (UIBezierPath *)cir {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:self.center radius:100.0 startAngle:0.0 endAngle:180.0 clockwise:YES];
    
    return path;
}



@end
