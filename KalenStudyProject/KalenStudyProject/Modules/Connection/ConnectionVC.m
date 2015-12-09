//
//  ConnectionVC.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/2.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "ConnectionVC.h"
#import "AnimalC.h"
#import <objc/runtime.h>
#import "ErrorDepositeViewController.h"

@interface ConnectionVC ()

@end

@implementation ConnectionVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ErrorDepositeViewController *cell = [[ErrorDepositeViewController alloc]init];
    
    AnimalC *c = [[AnimalC alloc]init];
    
    [cell properties_aps:c];
    
    AnimalC *a = [AnimalC animalWithName:@"dog" andSex:@"female" andWeight:@"20"];
    
    [cell properties_aps:a];
    
    NSString *s = objc_getAssociatedObject(a, @"weight");
    NSLog(@"添加的属性值为%@",s);
    
    AnimalC *b = [AnimalC animalWithName:@"cat" andSex:@"male" andWeightBlock:^(NSString *weight) {
        NSLog(@"闭包内容是%@",weight);
    }];
    
    void (^block)(NSString *a) = objc_getAssociatedObject(b, @"block");
    
    block(@"小良心");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
