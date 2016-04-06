//
//  CWTabBarController.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/2.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWTabBarController.h"
#import "HomeVC.h"
#import "CWTabBarView.h"




#define TabBar_Hight 60
@interface CWTabBarController ()

@end

@implementation CWTabBarController
@synthesize tabBarView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabBarHeight = TabBar_Hight;
    currentSelectedIndex = 0;
    [self initTabBar];
}

 
- (void)initTabBar {
    HomeVC *homeVC1 = [[HomeVC alloc] init];
    UINavigationController *page1 = [[UINavigationController alloc] initWithRootViewController:homeVC1];

    HomeVC *homeVC2 = [[HomeVC alloc] init];
    UINavigationController *page2 = [[UINavigationController alloc] initWithRootViewController:homeVC2];
    
    HomeVC *homeVC3 = [[HomeVC alloc] init];
    UINavigationController *page3 = [[UINavigationController alloc] initWithRootViewController:homeVC3];
    
    HomeVC *homeVC4 = [[HomeVC alloc] init];
    UINavigationController *page4 = [[UINavigationController alloc] initWithRootViewController:homeVC4];
    
    HomeVC *homeVC5 = [[HomeVC alloc] init];
    UINavigationController *page5 = [[UINavigationController alloc] initWithRootViewController:homeVC5];
    
   
    NSArray* pageArray = [NSArray arrayWithObjects:page1,page2,page3,page4,page5,nil];
    self.viewControllers = pageArray;
    
    
    [self.tabBar removeFromSuperview];

    _tabBarBgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - TabBar_Hight * SCREEN_SCALE, self.view.frame.size.width, TabBar_Hight * SCREEN_SCALE)];
    
    _tabBarBgView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_tabBarBgView];
    
    self.tabBarView = [[CWMTabbarView alloc]init];
    [self.tabBarView addBtnsTarget:self action:@selector(selectedTab:)];
    [self.tabBarView setFrame:self.tabBarBgView.bounds];
    [self.tabBarBgView addSubview:self.tabBarView];
}


- (void)selectedTabWithIndex:(int)index {
    if(index <= 5 && index >= 0)
    {
        UIButton *button = [self.tabBarView.btns objectAtIndex:index];
        [self selectedTab:button];
    }
}

- (void)selectedTab:(UIButton*)button {
    self.selectedIndex = button.tag;
    //    [self.tabBarView selectedBtn:self.selectedIndex];
    [self.tabBarView selectedBtn:button.tag];
    
}

- (void)setCurrentSelectedIndex:(NSInteger)_currentSelectedIndex {
    currentSelectedIndex = _currentSelectedIndex;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabBarView selectedBtn:currentSelectedIndex];
    //self.selectedIndex = currentSelectedIndex;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
