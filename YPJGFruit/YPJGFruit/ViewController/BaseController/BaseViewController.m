//
//  BaseViewController.m
//  CarSecretary
//
//  Created by Robin on 15/7/21.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIFont *font = [UIFont systemFontOfSize:18];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSFontAttributeName:font , NSForegroundColorAttributeName: [UIColor colorWithSevenCFontColor]}];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    
    if (IS_ABOVE_IOS7) {
        // 在iOS7及以上版本下，去除TableView顶部的空白
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    tasks = [[NSMutableArray alloc] init];
}

- (void)addTasks:(NSURLSessionDataTask *)task {
    [tasks addObject:task];
}

-(void)setBarItem {
    //设置左侧返回按钮
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"leftArrow"] forState:UIControlStateNormal];
    //设置 注册按钮的触发事件
    backButton.tag = -1;
    [backButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:backItem];
    
}

-(UIView *)createBottomButtonsView {

    UIView *viewBottom = [[UIView alloc]init];
     viewBottom.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewBottom];
    viewBottom.layer.borderWidth = 1.0f;
    viewBottom.layer.borderColor = cwGreyColor.CGColor;
    viewBottom.frame = CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH,50);
    return viewBottom;
    
}

//导航栏上的BarButtonItem的响应事件
-(void)onClick:(id)sender {
    UIButton * btn = (UIButton*)sender;
    if (btn.tag ==-1)
    {
        [self.navigationController popViewControllerAnimated:YES];
     }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    tabBarVC = (CWTabBarController *)self.tabBarController;
    [tabBarVC.tabBarBgView setHidden:YES];
     [self setBarItem];
}

- (void)viewWillDisappear:(BOOL)animated {
    [tabBarVC.tabBarBgView setHidden:NO];
    if (tasks && tasks.count > 0) {
        for (NSURLSessionDataTask *task in tasks) {
            [task cancel];
        }
    }
}


/**
 *  网络请求部分问题处理
 * @param  response        model
 * @param  error       错误信息
 */
- (BOOL)errorResponse:(CWBaseModel *)response andError:(NSError *)error isShowErrorMsg:(BOOL)isShow {
    
    if (error || response == nil) {
        if (isShow) {
           ErrorMsg(error,0);
        }
        return YES;
    }
    
    if (response.code == 403) {//环信
        return YES;
    }
    
    if (response.code != 0) {
        if (isShow) {
            AlertMsg(response.msg);
        }
        return YES;
    }
    return NO;
}
@end
