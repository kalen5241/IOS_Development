//
//  BaseTableVC.h
//  KalenStudyProject
//
//  Created by kalen on 16/5/23.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "BaseVC.h"
#import "KalenTableViewCellCode.h"

@interface BaseTableVC : BaseVC

@property (nonatomic,strong) id<UITableViewDataSource,UITableViewDelegate> delegate;
@property (nonatomic,assign) Class customCellClass;
@property (nonatomic,strong) NSString *cellIdentinfier;
@property (nonatomic,strong) NSString *tempNibName;
@property (nonatomic,assign) SEL select;
@property (nonatomic,assign) BOOL isHanderFlag;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,assign) BOOL isXib;
@property (nonatomic,assign) BOOL isStatic;
@property (nonatomic,assign) BOOL freshFlag;

@end
