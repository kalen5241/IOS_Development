//
//  ViewController.m
//  Kalen_Automation
//
//  Created by kalen on 15/6/4.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Animal *A1 = [[Animal alloc]init];
    A1.sex =@"Male";
    NSLog(@"%d",[A1 isMale]);

}

@end
