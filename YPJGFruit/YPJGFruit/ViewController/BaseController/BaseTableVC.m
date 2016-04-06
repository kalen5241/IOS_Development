//
//  BaseTableVC.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "BaseTableVC.h"

@interface BaseTableVC ()

@end

@implementation BaseTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTableViewToView];
}


-(UITableView *)baseTableView {
    
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc]init];
        _baseTableView.dataSource = self;
        _baseTableView.delegate = self;
        _baseTableView.separatorStyle = UITableViewCellAccessoryNone;
        _baseTableView.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    
        
    }
    
    return _baseTableView;
}


- (void)addTableViewToView {
    
//    [LayoutClass view:self.view andView:self.baseTableView];
    [self.view addSubview:self.baseTableView];
    self.baseTableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64- 50);
}


- (void)changeTableFrame {
    self.baseTableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
}


- (NSInteger)sections {
    
    if (!_sections) {
        _sections = 1;
    }
    return _sections;
}

- (NSInteger)rows {
    
    if (!_rows) {
        _rows = 4;
    }
    return _rows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sections;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.customCell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    if (!self.customCell) {
        self.customCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customCell"];
    }
    
    self.customCell.textLabel.text = @"123";
    return self.customCell;
}

//顶部下拉刷新
- (void)endHanderFresh {
    
    self.isHanderFlag = true;
    if (self.headerSelect != nil) {
        IMP imp = [self methodForSelector:self.headerSelect];
        void (*func)(id, SEL) = (void *)imp;
        func(self, self.headerSelect);
    }
    [self.baseTableView.header endRefreshing];
}


//底部上拉加载新数据
- (void)endFooterFresh {
    
    self.isHanderFlag = false;
    if (self.footerSelect != nil) {
        IMP imp = [self methodForSelector:self.footerSelect];
        void (*func)(id, SEL) = (void *)imp;
        func(self, self.footerSelect);
    }
    [self.baseTableView.footer endRefreshing];
}

- (void)setHeaderSelect:(SEL)headerSelect {
    if (headerSelect) {
        _headerSelect = headerSelect;
        //下拉刷新
        _baseTableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(endHanderFresh)];
    }
}

- (void)setFooterSelect:(SEL)footerSelect {
    if (footerSelect) {
        _footerSelect = footerSelect;
        //上拉加载
        _baseTableView.footer =  [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(endFooterFresh)];
    }
}


@end
