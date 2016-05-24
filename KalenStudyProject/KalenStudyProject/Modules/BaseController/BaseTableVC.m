//
//  BaseTableVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/23.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "BaseTableVC.h"
#import "FD_Masonry_CellXib.h"

@interface BaseTableVC () <UITableViewDataSource,UITableViewDelegate>

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

#pragma mark --Getters
- (UITableView *)tableview {
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]init];
        _tableview.dataSource = self;
        _tableview.delegate = self;
        NSString *tempIdefinder = self.cellIdentinfier ? self.cellIdentinfier : @"CELL";
        
        /*! xib
        NSString *tempNibName = self.tempNibName ? self.tempNibName :@"FD_Masonry_CellXib";
        [_tableview registerNib:[UINib nibWithNibName:tempNibName bundle:nil] forCellReuseIdentifier:tempIdefinder];*/
        
        /*! code*/
        Class tempClass =self.customCellClass ? self.customCellClass : [UITableViewCell class];
        [_tableview registerClass:tempClass forCellReuseIdentifier:tempIdefinder];
        
        //下拉刷新
        _tableview.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(endHanderFresh)];
        
        //上拉加载
        _tableview.footer =  [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(endFooterFresh)];
    }
    return _tableview;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*! code*/
     KalenTableViewCellCode *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentinfier];
    /*! xib
    FD_Masonry_CellXib *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentinfier];*/
    
    cell.dataModel = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"CELL" cacheByIndexPath:indexPath configuration:^(id cell) {
        /*! xib
        FD_Masonry_CellXib *tbCell = (FD_Masonry_CellXib *)cell;*/
        
        /*! code*/
         KalenTableViewCellCode *tbCell = (KalenTableViewCellCode *)cell;
        tbCell.dataModel = self.dataArray[indexPath.row];
    }];
    return height;
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
