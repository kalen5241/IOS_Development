//
//  KalenTabBarC.h
//  KalenDemoProject
//
//  Created by kalen on 15/8/9.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KalenTabBarC : UITabBarController
@property (nonatomic,strong) UIView *myTabBar;
- (void)hideTabBar;
- (void)showTabBar;
@end
