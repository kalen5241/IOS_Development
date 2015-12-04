//
//  DisplayView.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "DisplayView.h"
#import "Constants.h"

#define SHANGKUANG 30
#define QUXIAN 270

@interface DisplayView ()
@end

@implementation DisplayView 

-(NSArray *)arr {
    if (!_arr) {
        _arr = @[@(0.1),@(0.2),@(0.3),@(0.4),@(1)];
    }
    return _arr;
}

-(NSDictionary *)dic {
    
    FRAME_LOG(self.frame);
    BOUNDS_LOG(self.bounds);
    if (!_dic) {
        
        CGFloat x = 0;
        CGFloat y = 0;
        
        
        NSMutableArray *marr = [NSMutableArray array];
        y = self.bounds.origin.y + self.bounds.size.height;
        x = self.bounds.origin.x;
        CGPoint p = CGPointMake(x, y);
        
        for (int i = 1; i < self.arr.count + 1; i ++) {
            float t = (float) [self.arr[i-1] floatValue];
            NSLog(@"t is %f",t);
            
            CGFloat y = SHANGKUANG + (self.bounds.size.height - SHANGKUANG) * (1 - t);
            
            NSLog(@"y is %f",y);
                CGPoint p1 = CGPointMake(self.bounds.origin.x + self.bounds.size.width/(self.arr.count + 1) * i ,y);
            [marr addObject:[NSValue valueWithCGPoint:p1]];
        }
        
        y = self.bounds.origin.y + self.bounds.size.height;
        x = self.bounds.origin.x + self.bounds.size.width;
        CGPoint p4 = CGPointMake(x, y);
        
        [marr addObject:[NSValue valueWithCGPoint:p4]];
        
        NSArray *arr = [marr copy];
        NSDictionary *de = @{
                             @"startPoint":[NSValue valueWithCGPoint:p],
                             @"pointList":arr
                             };
        _dic = de;
        
    }
    
    return _dic;
}

- (void)drawRect:(CGRect)rect {
    /**
     *  UIKit绘图
     */
    /**/
    NSValue *s = [self.dic objectForKey:@"startPoint"];
    NSArray *ar = [self.dic objectForKey:@"pointList"];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[s CGPointValue]];
    
    CGPoint t = [s CGPointValue];
    for (NSValue *v in ar) {
        CGPoint r =  [v CGPointValue];
        //[path addLineToPoint:r];
        [path addCurveToPoint:r controlPoint1:CGPointMake(t.x + (r.x - t.x)/2,t.y) controlPoint2:CGPointMake(t.x + (r.x - t.x)/2,r.y)];
        t = r;
    }
    
    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinMiter;
    [path stroke];
}

@end
