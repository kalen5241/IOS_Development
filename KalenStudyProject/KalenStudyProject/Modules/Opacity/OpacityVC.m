//
//  OpacityVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/12/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "OpacityVC.h"

@interface OpacityVC ()

@end

@implementation OpacityVC

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
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1.0;
    alphaAnimation.toValue = @0.0;
    alphaAnimation.duration = 2.0;
    [viewFrame.layer addAnimation:alphaAnimation forKey:nil];

}


@end
