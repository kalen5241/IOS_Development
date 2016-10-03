//
//  yuan2_dt.m
//  2014621
//
//  Created by 孔凡群 on 14-7-1.
//  Copyright (c) 2014年 孔凡群. All rights reserved.
//

#import "yuan2_zj.h"
#import "BezierPathTool.h"

@implementation yuan2_zj

#define SHANGKUANG 30
#define QUXIAN 270

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.arr = array;
    }
    return self;
}


-(void)drawRect:(CGRect)rect{
    
   CAGradientLayer * gradientlayer = [CAGradientLayer layer];
    gradientlayer.startPoint = CGPointMake(1,0);
    gradientlayer.endPoint = CGPointMake(0,1);
    NSArray * array = [NSArray arrayWithObjects:(id)[[UIColor  orangeColor] CGColor],(id)[[UIColor yellowColor] CGColor], nil];
    gradientlayer.colors = array;
    gradientlayer.frame = rect;
    
    CAShapeLayer *  shapelayer = [CAShapeLayer layer];
    shapelayer.fillColor = [[UIColor clearColor]CGColor];
    shapelayer.strokeColor = [[UIColor redColor] CGColor];
    shapelayer.backgroundColor = [[UIColor clearColor] CGColor];
    shapelayer.lineJoin = kCALineJoinRound;
    shapelayer.lineCap = kCALineCapRound;
    shapelayer.frame = CGRectMake(0, 0, 0, 0);
    shapelayer.lineWidth = _zj_kd;
//    shapelayer.path = [self.bPath CGPath];
    BezierPathTool *tool = [[BezierPathTool alloc] init];
    tool.arr = self.arr;
    tool.tBounds = self.bounds;
    shapelayer.path = [[tool fetchDraw] CGPath];
//    shapelayer.path = [[self fetchDraw] CGPath];

    shapelayer.strokeEnd =1;
    [gradientlayer setMask:shapelayer];
    [self.layer addSublayer:gradientlayer];
}


@end
