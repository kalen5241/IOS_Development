//
//  GroupAnimationVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/12/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "GroupAnimationVC.h"

@interface GroupAnimationVC ()

@end

@implementation GroupAnimationVC

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
    //moveAnimation.duration = 2.0;
    //添加动画的layer中
    //[self.imageView.layer addAnimation:moveAnimation forKey:nil];
    
    //缩放动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //初始状态为变形前的常量状态
    //由于fromValue属性需要id类型，所以将常量封装成对象类型
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeScale(0.1, 0.1, 1)];
    //scaleAnimation.duration = 2.0;
    //[self.imageView.layer addAnimation:scaleAnimation forKey:nil];
    
    //透明度动画
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1.0;
    alphaAnimation.toValue = @0.0;
    //alphaAnimation.duration = 2.0;
    //[self.imageView.layer addAnimation:alphaAnimation forKey:nil];
    
    //可以创建动画组来管理所有动画，统一设置动画时长及统一添加到某个视图的layer上
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[moveAnimation,scaleAnimation,alphaAnimation];
    group.duration = 5.0;
    [viewFrame.layer addAnimation:group forKey:nil];
}
@end
