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
    
    DisplayView *d = [[DisplayView alloc]initWithFrame:CGRectMake(64, 64, 200, 200)];
    
    d.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:d];
}

@end
