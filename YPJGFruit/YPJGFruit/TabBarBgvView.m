//
//  TabBarBgvView.m
//  KalenDemoProject
//
//  Created by kalen on 15/8/13.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import "TabBarBgvView.h"

@implementation TabBarBgvView



-(void)awakeFromNib{
    NSLog(@"nib");
    self.home.selected = YES;
}

- (void)changeStatus {
    
    self.message.selected = NO;
    self.discover.selected = NO;
    self.home.selected = NO;
    self.profile.selected = NO;
    
}

- (IBAction)homeClick:(UIButton *)sender {
    NSLog(@"homeClick");
    self.btnIndex =0;
    [self changeStatus];
    sender.selected = !sender.selected;
    
}

- (IBAction)messageClick:(UIButton *)sender {
    NSLog(@"messageClick");
    self.btnIndex =1;
    [self changeStatus];
    sender.selected = !sender.selected;

}

- (IBAction)discoverClick:(UIButton *)sender {
    NSLog(@"discoverClick");
    [self changeStatus];
    self.btnIndex =2;
    
    sender.selected = !sender.selected;

}

- (IBAction)profileClick:(UIButton *)sender {
    NSLog(@"profileClick");
    [self changeStatus];
    self.btnIndex =3;
    sender.selected = !sender.selected;

}
@end
