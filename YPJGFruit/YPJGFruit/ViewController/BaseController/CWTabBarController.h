//
//  CWTabBarController.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/2.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWTabBarView.h"
#import "CWMTabbarView.h"

@interface CWTabBarController : UITabBarController{
    UIView* _tabBarBgView;
    CWTabBarView *_tabBarView;
    NSInteger currentSelectedIndex;
}


@property (nonatomic, retain) CWMTabbarView *tabBarView;
@property (nonatomic, retain) UIView *tabBarBgView;
@property (nonatomic, assign, readonly) CGFloat tabBarHeight;

- (void)selectedTab:(UIButton*)button;

- (void)setCurrentSelectedIndex:(NSInteger)_currentSelectedIndex;
@end
