//
//  BaseTableVC.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^CWTableBlock)();
@interface BaseTableVC : BaseViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *baseTableView;
@property (nonatomic,strong)  id<UITableViewDataSource,UITableViewDelegate> delegate;
@property (nonatomic,strong) UITableViewCell *customCell;
@property (nonatomic,strong) NSString *cellIdentinfier;
@property (nonatomic,assign) NSInteger rows;
@property (nonatomic,assign) NSInteger sections;
@property (nonatomic,assign) CWTableBlock block;
@property (nonatomic,assign) SEL headerSelect;
@property (nonatomic,assign) SEL footerSelect;

@property (nonatomic,assign) id sender;
@property (nonatomic,assign) BOOL isHanderFlag;

- (void)addTableViewToView;


- (void)changeTableFrame;
@end
