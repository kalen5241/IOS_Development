//
//  VMVCViewController.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/26.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "VMVCViewController.h"
#import "VC1.h"
#import "VC2.h"

@interface VMVCViewController ()


@end

@implementation VMVCViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuBGColor = [UIColor redColor];
}

#pragma mark --LazyLoad
//
//- (NSArray<NSString *> *)titles {
//    
//    return  @[@"kkkk",@"lllll"];
//}
//
//- (NSArray<Class> *)viewControllerClasses {
//    
//    return @[[VC1 class],[VC2 class]];
//}


#pragma mark --Delegate

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    
    return self.titles.count;
}

- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    return self.childViewControllers[index];
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titles[index];
}


@end
