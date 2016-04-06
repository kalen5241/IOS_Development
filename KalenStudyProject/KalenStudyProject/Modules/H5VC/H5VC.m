//
//  H5VC.m
//  KalenStudyProject
//
//  Created by kalen on 16/3/3.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "H5VC.h"

@interface H5VC () <UIWebViewDelegate>

@end

@implementation H5VC

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
    
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames )
    {
        printf( "Family: %s \n", [familyName UTF8String]);
        
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames )
        {
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
    
}




@end
