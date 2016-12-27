//
//  DirectionAnimationVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/12/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "DirectionAnimationVC.h"
#import "DirectionTransformView.h"

@interface DirectionAnimationVC ()
@property (nonatomic, strong) UIView *vf;
@property (nonatomic, strong) UIView *vb;
@property (nonatomic, strong) UIView *frameView;
@property (nonatomic, assign) BOOL flag;
@end

@implementation DirectionAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [DirectionTransformView addDirectionAnimationView:self.view];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self layoutWrapper];
    _flag = YES;
    [self layoutBothView];
}

- (void)layoutWrapper {
    
    UIView *frameView = [[UIView alloc] init];
    self.frameView = frameView;
    [self.view addSubview:frameView];
    [frameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@100);
    }];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@100);
    }];
}

- (void) click:(id)button {
    
    self.flag = !self.flag;
    
    UIView *v1 = self.flag ? self.vf : self.vb;
    UIView *v2 = self.flag ? self.vb : self.vf;
    
    UIViewAnimationOptions transitionDirection =  UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionFromView:v1
                        toView:v2
                      duration:1.0
                       options:transitionDirection
                    completion:^(BOOL finished) {
                        
                        [self.vf removeFromSuperview];
                        [self.vb removeFromSuperview];
                        [self layoutBothView];
                    }];
}

- (void)layoutBothView {
    
    UIView *viewOne = [[UIView alloc] init];
    self.vf = viewOne;
    viewOne.backgroundColor = [UIColor blueColor];
    
    UIView *viewTwo = [[UIView alloc] init];
    self.vb = viewTwo;
    viewTwo.backgroundColor = [UIColor redColor];
    
    [self.frameView addSubview:self.flag ? self.vf : self.vb];
    [self.frameView addSubview:self.flag ? self.vb : self.vf];
    
    [self.vb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.frameView);
    }];
    [self.vf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.frameView);
    }];
}

@end
