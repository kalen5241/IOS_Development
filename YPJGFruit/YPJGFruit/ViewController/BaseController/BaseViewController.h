//
//  BaseViewController.h
//  CarSecretary
//
//  Created by Robin on 15/7/21.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWTabBarController.h"
#import "UIColor+Hex.h"
#import "CarInfo.h"
#import "MJRefresh.h"
#import "CSDataRequest.h"


@interface BaseViewController : UIViewController {
    CWTabBarController *tabBarVC;
    
    // 网络请求任务数组
    NSMutableArray *tasks;
}

-(void)setBarItem;
-(void)onClick:(id)sender;
-(void)addTasks:(NSURLSessionDataTask *)task;

/**
 *  创建存放下方按钮的view
 */
-(UIView *)createBottomButtonsView;


#pragma mark - 网络请求处理
/**
 *  网络请求部分问题处理
 * @param  response        model
 * @param  error       错误信息
 */
- (BOOL)errorResponse:(CWBaseModel *)response andError:(NSError *)error isShowErrorMsg:(BOOL)isShow;

@end
