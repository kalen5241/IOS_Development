//
//  DrawPic.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "DrawPic.h"
#import "DisplayView.h"
#import <Masonry.h>

@interface DrawPic ()

@end

@implementation DrawPic

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DisplayView *d = [DisplayView new];
    d.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:d];
    
    [d mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64,0,0,0));
    }];
    
    
}

@end
