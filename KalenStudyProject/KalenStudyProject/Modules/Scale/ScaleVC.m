//
//  ScaleVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/12/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ScaleVC.h"

@interface ScaleVC ()

@end

@implementation ScaleVC

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

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //初始状态为变形前的常量状态 由于fromValue属性需要id类型，所以将常量封装成对象类型
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeScale(0.1, 0.1, 1)];
    scaleAnimation.duration = 2.0;
    [viewFrame.layer addAnimation:scaleAnimation forKey:nil];

}


@end
