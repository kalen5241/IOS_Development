//
//  DisplayView.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "DisplayView.h"

@implementation DisplayView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    

    /**
     *  Core Graphics绘图
     */
    /*
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextMoveToPoint(context, 40, 40);
     CGContextAddLineToPoint(context, 40, 140);
     CGContextAddLineToPoint(context, 140, 40);
     CGContextAddLineToPoint(context, 40, 40);
     CGContextSetStrokeColorWithColor(context, [[UIColor redColor]CGColor]);
     CGContextStrokePath(context);
     */
    
    
    /**
     *  UIKit绘图
     */
    /**/
    
    CGPoint p = CGPointMake(40, 40);
    CGPoint p1 = CGPointMake(40, 140);
    CGPoint p2 = CGPointMake(140, 40);
    CGPoint p3 = CGPointMake(40, 40);
    NSValue *v = [NSValue valueWithCGPoint:p];
    NSValue *v1 = [NSValue valueWithCGPoint:p1];
    NSValue *v2 = [NSValue valueWithCGPoint:p2];
    NSValue *v3 = [NSValue valueWithCGPoint:p3];
    NSArray *arr = @[v1,v2,v3];
    NSDictionary * dic = [NSDictionary dictionary];
    NSDictionary *de = @{
                         @"startPoint":v,
                         @"pointList":arr
                         };
    
    [dic objectForKey:@"startPoint"];
    self.dic = de;
    NSValue *s = [self.dic objectForKey:@"startPoint"];
    NSArray *ar = [self.dic objectForKey:@"pointList"];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[s CGPointValue]];
    

    for (NSValue *v in ar) {
        CGPoint r =  [v CGPointValue];
        [path addLineToPoint:r];
    }
    
    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinMiter;
    [path stroke];
    
    
}
@end
