//
//  UtilCheckerVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/21.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "UtilCheckerVC.h"


@interface UtilCheckerVC ()<UIAlertViewDelegate>

@end

@implementation UtilCheckerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
//    [self checkNSArrayLog];
//    [self checkDataFromPlist];
    
//    [self checkNSDictionaryLog];
    
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"test" message:@"hahh" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    
    
    [av show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    NSLog(@"ssssss");
    
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

- (void)checkDataFromPlist {
    
    [DataUtil showJSON];

}

@end
