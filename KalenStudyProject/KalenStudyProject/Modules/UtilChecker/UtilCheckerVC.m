//
//  UtilCheckerVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/21.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "UtilCheckerVC.h"


@interface UtilCheckerVC ()

@end

@implementation UtilCheckerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self checkNSArrayLog];
//    [self checkNSDictionaryLog];
}


#pragma mark --CheckMathod

- (void)checkNSArrayLog {
    
    NSArray *arr = @[@{@"1":@"11111"},@{@"2":@"22222"},@{@"3":@"33333"},@{@"4":@"44444"}];
    NSDictionary *dic = @{
                          @"test":arr
                          };
    NSLog(@"Json格式：%@",dic);
}

- (void)checkNSDictionaryLog {
    
    NSDictionary *dict = @{
                           @"one":@"1",
                           @"two":@"2",
                           @"three":@"3"
                           };
    NSLog(@"字典内容为：%@",dict);
}

@end
