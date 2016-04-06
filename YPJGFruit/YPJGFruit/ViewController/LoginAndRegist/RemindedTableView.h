//
//  RemindedTableView.h
//  CarSecretary
//
//  Created by wenjuan on 15/11/27.
//  Copyright © 2015年 Chewen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemindedTableView : UITableView

@property (nonatomic, strong) NSMutableArray *phonePasswordArray;

@property (nonatomic, copy) NSString  *phone;
@property (nonatomic, copy) NSString  *password;
@property (nonatomic, assign) BOOL savePasswordState;
@property (nonatomic, assign) CGFloat phoneTableViewY;

@property (nonatomic, strong) UIView *masonryView;

//选中还是删除 1:选中   0：删除
@property (nonatomic, copy) NSString  *selectOrDeleget;



/**
 *  创建列表
 * @param  phonePasswordArray        数据源
 * @param  frame                     大小
 * @param  block                     回调方法
 */
+ (RemindedTableView *)phonePasswordTableView:(NSMutableArray *)phonePasswordArray andFrame:(CGRect)frame compeletion:(void(^)(RemindedTableView  *remindPPArray))block ;

/**
 *  tableview  数据源改变 table的也高度改变
 */
- (void)changeMove;

/**
 *  tableView 隐藏动画
 */
- (void)downMove;


/**
 *  创建列表
 * @param  phonePasswordArray        数据源
 * @param  frame                     大小
 * @param  block                     回调方法
 */
+ (RemindedTableView *)phonePasswordTableView:(NSMutableArray *)phonePasswordArray andView:(UIView *)masonryView compeletion:(void(^)(RemindedTableView  *remindPPArray))block ;


/**
 *  显示tableView
 */
- (void)showTable;
@end
