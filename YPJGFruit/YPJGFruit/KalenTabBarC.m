//
//  KalenTabBarC.m
//  KalenDemoProject
//
//  Created by kalen on 15/8/9.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import "KalenTabBarC.h"
#import "TabBarBgvView.h"
#import "FruitSelectionVC.h"
#import "MessageVC.h"
#import "MVC.h"

#define SCREEN_SCALE [[UIScreen mainScreen] bounds].size.width / 375.0
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface KalenTabBarC ()

@end

@implementation KalenTabBarC

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"initWithCoder");
    }
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        NSLog(@"initWithNibName");
        NSLog(@"%@",nibNameOrNil);
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    FruitSelectionVC *home = [[FruitSelectionVC alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:home];
    home.view.backgroundColor = [UIColor yellowColor];
    
    
    [self addChildViewController:homeNav];
    
   MVC *message = [[MVC alloc]init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:message];
    
    
    UIViewController *discover = [[UIViewController alloc]init];
    UINavigationController *discoverNav = [[UINavigationController alloc] initWithRootViewController:discover];
    discover.view.backgroundColor = [UIColor blackColor];
    
    UIViewController *me = [[UIViewController alloc]init];
    UINavigationController *meNav = [[UINavigationController alloc]initWithRootViewController:me];
    me.view.backgroundColor = [UIColor blueColor];

    NSArray *array = @[homeNav,messageNav,discoverNav,meNav];
    
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-117, SCREEN_WIDTH, 117)];
    
    self.myTabBar = bg;
    
    [self.view addSubview:bg];
    
    //[self setValue:nil forKeyPath:@"tabBar"];
    
    [self.tabBar removeFromSuperview];
    
    TabBarBgvView *tabBarView = [[[NSBundle mainBundle] loadNibNamed:@"TabBarBgView" owner:self
            options:nil] lastObject];
    [tabBarView setFrame:bg.bounds];
    [bg addSubview:tabBarView];
    
    self.viewControllers = array;
    
    [tabBarView addObserver:self forKeyPath:@"btnIndex" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"btnIndex"])
    {
        NSLog(@"%@",change);
        NSLog(@"%@",[change objectForKey:@"new"]);
        NSLog(@"%@",object);
        self.selectedIndex = [[change objectForKey:@"new"] integerValue];
    }
}

- (void)hideTabBar {
    
    self.myTabBar.hidden = YES;
}

- (void)showTabBar {
    
    self.myTabBar.hidden = NO;
}

@end
