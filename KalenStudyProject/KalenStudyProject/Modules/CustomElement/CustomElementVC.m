//
//  CustomElementVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/3/4.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "CustomElementVC.h"
#import "Cbuttton.h"
#import "CodeButton.h"

@interface CustomElementVC ()

@end

@implementation CustomElementVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    /*! xib */
    Cbuttton *bt =[[[NSBundle mainBundle] loadNibNamed:@"CbuttonView" owner:self options:nil] lastObject];
    /*! code*/
    CodeButton *b = [[CodeButton alloc] init];
    
    [self.view addSubview:bt];
    [self.view addSubview:b];
    
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(100);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@100);
    }];
    
    [b mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(230);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@100);
    }];
}
@end
