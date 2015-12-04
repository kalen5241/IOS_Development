//
//  DrawPic.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "DrawPic.h"
#import "DisplayView.h"


@interface DrawPic ()

@end

@implementation DrawPic

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DisplayView *d = [[DisplayView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    
    d.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:d];
}

@end
