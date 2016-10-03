//
//  BezierPathTool.m
//  KalenStudyProject
//
//  Created by kalen on 16/9/29.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "BezierPathTool.h"

#define SHANGKUANG 30
#define QUXIAN 270

@implementation BezierPathTool


- (UIBezierPath *)fetchDraw {
    
    NSArray *ar = [self.dic objectForKey:@"pointList"];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[ar[0] CGPointValue]];
    
    CGPoint t = [ar[0] CGPointValue];
    
    for (NSValue *v in ar) {
        CGPoint r =  [v CGPointValue];
        [path addCurveToPoint:r controlPoint1:CGPointMake(t.x + (r.x - t.x)/2,t.y) controlPoint2:CGPointMake(t.x + (r.x - t.x)/2,r.y)];
        t = r;
    }
    
    return path;
}

-(NSDictionary *)dic {
    
//    NSArray *arr =  @[@(0.1),@(0.6),@(0.3),@(0.7),@(1)];
    
    if (!_dic) {
        
        NSMutableArray *marr = [NSMutableArray array];
        
        for (int i = 1; i < self.arr.count + 1; i ++) {
            float t = (float) [self.arr[i-1] floatValue];
            CGFloat y = SHANGKUANG + (self.tBounds.size.height - SHANGKUANG) * (1 - t);
            CGPoint p1 = CGPointMake(self.tBounds.origin.x + self.tBounds.size.width/(self.arr.count + 1) * i ,y);
            [marr addObject:[NSValue valueWithCGPoint:p1]];
        }
        
        NSArray *arr = [marr copy];
        _dic  = @{@"pointList":arr};
    }
    return _dic;
}



- (UIBezierPath *)fetchDraw1 {
    
    NSArray *ar = [self.dic1 objectForKey:@"pointList"];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint ff = [ar[0] CGPointValue];
    
    ff.y = self.tBounds.size.height;
    
    [path moveToPoint:ff];
    
    CGPoint t = ff;
    for (NSValue *v in ar) {
        CGPoint r =  [v CGPointValue];
        [path addCurveToPoint:r controlPoint1:CGPointMake(t.x + (r.x - t.x)/2,t.y) controlPoint2:CGPointMake(t.x + (r.x - t.x)/2,r.y)];
        t = r;
    }
    
    CGPoint tt = [[ar lastObject] CGPointValue];
    CGPoint yy = tt;
    yy.y = self.tBounds.size.height;
    
    [path addCurveToPoint:yy controlPoint1:CGPointMake(t.x + (tt.x - t.x)/2,t.y) controlPoint2:CGPointMake(t.x + (tt.x - t.x)/2,tt.y)];
    
    return path;
}

-(NSDictionary *)dic1 {
//    NSArray *arr =  @[@(0.1),@(0.6),@(0.3),@(0.7),@(1)];
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    NSMutableArray *marr = [NSMutableArray array];
    y = self.tBounds.origin.y + self.tBounds.size.height;
    x = self.tBounds.origin.x;
    CGPoint p = CGPointMake(x, y);
    
    for (int i = 1; i < self.arr.count + 1; i ++) {
        float t = (float) [self.arr[i-1] floatValue];
        CGFloat y = SHANGKUANG + (self.tBounds.size.height - SHANGKUANG) * (1 - t);
        CGPoint p1 = CGPointMake(self.tBounds.origin.x + self.tBounds.size.width/(self.arr.count + 1) * i ,y);
        [marr addObject:[NSValue valueWithCGPoint:p1]];
    }
    _dic1 = @{
              @"startPoint":[NSValue valueWithCGPoint:p],
              @"pointList": [marr copy]
              };
    return _dic1;
}

@end
