//
//  OpenOtherAppVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/20.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "OpenOtherAppVC.h"

@interface OpenOtherAppVC ()

@end

@implementation OpenOtherAppVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [btn setTitle:@"汽车秘书" forState:(UIControlStateNormal)];
    
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    [btn setBackgroundColor:[UIColor blueColor]];
    
    [btn addTarget:self action:@selector(openOther:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(70);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.width.equalTo(@130);
        make.height.equalTo(@50);
    }];
    
}

-(void)openOther:(UIButton *)sender {
    
    NSLog(@"打开应用");
    
    NSString *customURL = @"CWUser://";
    
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:customURL]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL error"
                                                        message:[NSString stringWithFormat:
                                                                 @"No custom URL defined for %@", customURL]
                                                       delegate:self cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}



@end
