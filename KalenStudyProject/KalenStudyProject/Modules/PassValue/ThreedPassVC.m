//
//  ThreedPassVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/10.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ThreedPassVC.h"

@interface ThreedPassVC ()

@end

@implementation ThreedPassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)downLoad:(UIButton *)sender {

    [self changeStatus:^(NSString *msg) {
        self.showLabel.text = msg;
    }];
}

- (IBAction)done:(UIButton *)sender {
    
    [self changeOtherStatus:^(NSString *msg) {
        self.showLabel.text = msg;
    }];
}

- (void)changeStatus:(void (^)(NSString *msg))block {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        block(@"下载完成!");
    });
}

- (void)changeOtherStatus:(void(^)(NSString *msg))block {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        block(@"正在下载。。。。。。");
    });
}


@end
