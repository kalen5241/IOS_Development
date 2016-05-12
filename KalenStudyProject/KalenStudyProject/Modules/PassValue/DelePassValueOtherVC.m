//
//  DelePassValueOtherVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/8.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "DelePassValueOtherVC.h"

@interface DelePassValueOtherVC ()

@end

@implementation DelePassValueOtherVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    
    self.inputBox.placeholder = self.positiveString;
}

- (IBAction)back:(UIButton *)sender {
    
    self.before.inputString = self.inputBox.text;
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickDelegate:(UIButton *)sender {
    
    [self.delegate pass:@"jj"];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
