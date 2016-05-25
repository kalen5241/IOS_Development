//
//  CodeButton.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/25.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "CodeButton.h"

@implementation CodeButton


- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *l1 = [[UIView alloc] init];
    l1.backgroundColor = [UIColor blueColor];
    [self addSubview:l1];
    
    UIView *l2 = [[UIView alloc] init];
    l2.backgroundColor = [UIColor yellowColor];
    [self addSubview:l2];
    
    UIButton *bt = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [bt addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:bt];
    
    
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(l2.mas_bottom);
        make.right.equalTo(@-20);
        make.left.equalTo(l2.mas_right);
        make.bottom.equalTo(@-20);
        make.width.equalTo(l2.mas_width);
        make.height.equalTo(l2.mas_height);
    }];
    
    [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.right.equalTo(l1.mas_left);
        make.left.equalTo(@20);
        make.bottom.equalTo(l1.mas_top);
    }];
    
    
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
}


- (void)click:(id)sender {
    
    NSLog(@"ssssssss");
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
//- (void)drawRect:(CGRect)rect {
//
//}


@end
