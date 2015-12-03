//
//  FirstVC.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/2.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "FirstVC.h"
#import "LeftMenuVCViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "GuideViewController.h"
@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GuideViewController *centerVC = [[GuideViewController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:centerVC];
    
    LeftMenuVCViewController *leftMenuVC = [[LeftMenuVCViewController alloc]init];
    MMDrawerController *loginedVC = [[MMDrawerController alloc] initWithCenterViewController:nav leftDrawerViewController:leftMenuVC];
    [loginedVC setShowsShadow:NO];
    [loginedVC setCenterHiddenInteractionMode:MMDrawerOpenCenterInteractionModeFull];
    [loginedVC setMaximumLeftDrawerWidth:[[UIScreen mainScreen] bounds].size.width - 50];
    [loginedVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [loginedVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [self presentViewController:loginedVC animated:YES completion:nil];
    //[self.navigationController pushViewController:loginedVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
