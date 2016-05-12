//
//  DelePassValueVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/8.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "DelePassValueVC.h"
#import "DelePassValueOtherVC.h"

@interface DelePassValueVC () <PassStringDelegate>
@end

@implementation DelePassValueVC

-(NSString *)inputString {
    
    if (!_inputString) {
        _inputString = @"红桃K";
    }
    return _inputString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *txf = [[UITextField alloc]init];
    txf.backgroundColor = [UIColor redColor];
    [self.view addSubview:txf];
    self.mylabel = txf;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"正反向传值" forState:(UIControlStateNormal)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"协议传值" forState:(UIControlStateNormal)];
    button1.backgroundColor = [UIColor redColor];
    [button1 addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button1];
    
    UITextField *txf1 = [[UITextField alloc]init];
    txf1.backgroundColor = [UIColor redColor];
    [self.view addSubview:txf1];
    self.mylabel1 = txf1;
    
    [txf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
    }];

    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(txf.mas_bottom).offset(30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
    }];
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).offset(30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
    }];
    
    [txf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button1.mas_bottom).offset(100);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
    }];
}

-(void)click:(id)btn {

    DelePassValueOtherVC *dest = [[DelePassValueOtherVC alloc] init];
    
    dest.positiveString = self.mylabel.text;
    
    dest.before = self;
     
    dest.delegate = self;
    
    [self.navigationController pushViewController:dest animated:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.mylabel.text = self.inputString;
    self.mylabel1.text = self.passString;
}

-(void)pass:(NSString *)str {
    
    self.passString = str;
}


@end
