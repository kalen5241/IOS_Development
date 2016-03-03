//
//  LoginVC.m
//  CarCare
//
//  Created by kalen on 16/3/2.
//  Copyright © 2016年 auguoguo. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC () <UIWebViewDelegate>

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *browser = [[UIWebView alloc]init];
    
    browser.delegate = self;
    
    [self.view addSubview:browser];
    
    [browser mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64, 0, 0, 0));
        make.edges.equalTo(self.view);
    }];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    
    NSURL* url = [NSURL fileURLWithPath:path];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [browser loadRequest:request];
    
    
}


@end
