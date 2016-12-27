//
//  MoveVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/12/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "MoveVC.h"

@interface MoveVC ()

@end

@implementation MoveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *viewFrame = [[UIView alloc] init];
    viewFrame.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:viewFrame];
    
    [viewFrame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@200);
        make.height.equalTo(@200);
    }];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50,100, 200, 150)];
    //创建关键帧
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 设置属性
    moveAnimation.path = path.CGPath;
    moveAnimation.duration = 2.0;
    //添加动画的layer中
    [viewFrame.layer addAnimation:moveAnimation forKey:nil];
}


@end
