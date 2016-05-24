//
//  BaseTableVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/23.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "BaseTableVC.h"

@interface BaseTableVC ()
@property (nonatomic,strong) UITableView *tableview;
@end

@implementation BaseTableVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    
    [self.view addSubview:self.tableview];
    
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0).key(@"tvc1");
        make.left.equalTo(@0).key(@"tvc2");
        make.right.equalTo(@0).key(@"tvc3");
        make.bottom.equalTo(@0).key(@"tvc4");
    }];
}

- (UITableView *)tableview {
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]init];
        _tableview.dataSource = self.delegate;
        _tableview.delegate = self.delegate;
        NSString *tempIdefinder = self.cellIdentinfier ? self.cellIdentinfier : @"CELL";
        
        /*! xib*/
        NSString *tempNibName = self.tempNibName ? self.tempNibName :@"FD_Masonry_CellXib";
        [_tableview registerNib:[UINib nibWithNibName:tempNibName bundle:nil] forCellReuseIdentifier:tempIdefinder];
        
        /*! code*/
        Class tempClass =[self.customCell class] ? self.customCell : [UITableViewCell class];
        [_tableview registerClass:tempClass forCellReuseIdentifier:tempIdefinder];
        
        //下拉刷新
        _tableview.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(endHanderFresh)];
        
        //上拉加载
        _tableview.footer =  [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(endFooterFresh)];
    }
    return _tableview;
}


//顶部下拉刷新
- (void)endHanderFresh {
    
    self.isHanderFlag = true;
    if (self.select != nil) {
        IMP imp = [self methodForSelector:self.select];
        void (*func)(id, SEL) = (void *)imp;
        func(self, self.select);
    }
    [self.tableview.header endRefreshing];
}


//底部上拉加载新数据
- (void)endFooterFresh {
    
    self.isHanderFlag = false;
    if (self.select != nil) {
        IMP imp = [self methodForSelector:self.select];
        void (*func)(id, SEL) = (void *)imp;
        func(self, self.select);
    }
    [self.tableview.footer endRefreshing];
}

@end
