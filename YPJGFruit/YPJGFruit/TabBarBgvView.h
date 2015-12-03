//
//  TabBarBgvView.h
//  KalenDemoProject
//
//  Created by kalen on 15/8/13.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarBgvView : UIView

@property (weak, nonatomic) IBOutlet UIButton *home;
@property (weak, nonatomic) IBOutlet UIButton *message;
@property (weak, nonatomic) IBOutlet UIButton *discover;
@property (weak, nonatomic) IBOutlet UIButton *profile;
@property (nonatomic,assign) NSInteger btnIndex;


- (IBAction)homeClick:(UIButton *)sender;
- (IBAction)messageClick:(UIButton *)sender;
- (IBAction)discoverClick:(UIButton *)sender;
- (IBAction)profileClick:(UIButton *)sender;

@end
