//
//  RotationVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/12/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "RotationVC.h"
#import <Masonry.h>
@interface RotationVC ()
@property (nonatomic, strong) UIView *tempView;
@end

@implementation RotationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    UIImageView *rotationImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    //
    //    [self.view addSubview:rotationImage];
    //
    //    [rotationImage mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.center.equalTo(self.view);
    //        make.width.equalTo(@100);
    //        make.height.equalTo(@100);
    //    }];
    //
    //    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    //
    //    animation.fromValue = [NSNumber numberWithFloat:0.f];
    //
    //    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    //
    //    animation.duration  = 3;
    //
    //    animation.autoreverses = NO;
    //
    //    animation.fillMode =kCAFillModeForwards;
    //
    //    animation.repeatCount = 500;
    //
    //    [rotationImage.layer addAnimation:animation forKey:nil];
    
    
    
//    UIView * viewFrame = [[UIView alloc] init];
//    
//    viewFrame.backgroundColor = [UIColor blueColor];
//    
//    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
//    
//    animation.fromValue = [NSNumber numberWithFloat:0.f];
//    
//    animation.toValue =  [NSNumber numberWithFloat: M_PI /2.0];
//    
//    animation.duration  = 0.5;
//    
//    animation.autoreverses = NO;
//    
//    animation.fillMode=kCAFillModeForwards;
//    
//    animation.removedOnCompletion = NO;
//    
//    animation.fillMode =kCAFillModeForwards;
//    
//    animation.repeatCount = 1;
//    
//    [viewFrame.layer addAnimation:animation forKey:nil];
//    
//    [self.view addSubview:viewFrame];
//    
//    [viewFrame mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(300);
//        make.centerX.equalTo(self.view);
//        make.width.height.equalTo(@200);
//    }];
//    
    UIView * viewFrame1 = [[UIView alloc] init];
    
    self.tempView = viewFrame1;
    
    viewFrame1.backgroundColor = [UIColor redColor];
    
    CABasicAnimation *animation2 =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    animation2.fromValue = [NSNumber numberWithFloat:M_PI/2.0];
    
    animation2.toValue =  [NSNumber numberWithFloat: 0.f];
    
    animation2.duration  = 5;
    
    animation2.autoreverses = NO;
    
    animation2.fillMode=kCAFillModeForwards;
    
    animation2.removedOnCompletion = NO;
    
    animation2.fillMode =kCAFillModeForwards;
    
    animation2.repeatCount = 1;
    
    [viewFrame1.layer addAnimation:animation2 forKey:nil];
    
    [self.view addSubview:viewFrame1];
    
    [viewFrame1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(300);
        make.centerX.equalTo(self.view);
        make.width.height.equalTo(@200);
    }];
    
    CABasicAnimation *animation3 =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    animation3.fromValue = [NSNumber numberWithFloat:M_PI/2.0];
    
    animation3.toValue =  [NSNumber numberWithFloat: 0.f];
    
    animation3.duration  = 5;
    
    animation3.autoreverses = NO;
    
    animation3.fillMode=kCAFillModeForwards;
    
    animation3.removedOnCompletion = NO;
    
    animation3.fillMode =kCAFillModeForwards;
    
    animation3.repeatCount = 1;
    
    [viewFrame1.layer addAnimation:animation3 forKey:nil];
    
//    UIImageView *rotationImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
//    
//    [viewFrame addSubview:rotationImage1];
//    
//    [rotationImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(viewFrame);
//        make.width.equalTo(@100);
//        make.height.equalTo(@100);
//    }];
//    
//    CGMutablePathRef path = CGPathCreateMutable();
//    
//    CGPathAddArc(path, NULL, 100, 100, 1, 0,M_PI * 2, -1);
//    
//    CAKeyframeAnimation * animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    
//    animation1.path = path;
//    
//    CGPathRelease(path);
//    
//    animation1.duration = 3;
//    
//    animation1.repeatCount = 500;
//    
//    animation1.autoreverses = NO;
//    
//    animation1.rotationMode =kCAAnimationRotateAuto;
//    
//    animation1.fillMode =kCAFillModeForwards;
//    
//    [rotationImage1.layer addAnimation:animation1 forKey:nil];
}


- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    [self.tempView removeFromSuperview];
}

@end
