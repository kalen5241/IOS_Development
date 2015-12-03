//
//  MVC.m
//  YPJGFruit
//
//  Created by kalen on 15/8/16.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import "MVC.h"
#import "MessageVC.h"
#import "KalenTabBarC.h"
@interface MVC ()

@end

@implementation MVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    KalenTabBarC *temp = (KalenTabBarC  *)self.navigationController.tabBarController;
    
    [temp showTabBar];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"chat" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(show) forControlEvents:(UIControlEventTouchUpInside)];
    CGRect frame = CGRectMake(100, 100, 100, 100);
    btn.frame = frame;
    [self.view addSubview:btn];
}

- (void)show{
    MessageVC *m = [[MessageVC alloc] init];
    [self.navigationController pushViewController:m animated:YES];
    
    KalenTabBarC *temp = (KalenTabBarC  *)self.navigationController.tabBarController;
    
    [temp hideTabBar];
    
}


@end
