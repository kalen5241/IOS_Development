//
//  AutoCellHeightVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/3/9.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "AutoCellHeightVC.h"
#import "DataUtil.h"
#import "GuideDataItem.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "TestCell.h"

#define CELL_ID @"SmsDetailCellId"

@interface AutoCellHeightVC () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *array;
@end

@implementation AutoCellHeightVC

-(NSArray *)array {
    
    if (!_array) {
        _array = [DataUtil fetchArray];
    }
    return _array;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] init];
    
    self.tableView = tableView;
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64,0,0,0));
    }];
    
    [self.tableView registerClass:[TestCell class] forCellReuseIdentifier:CELL_ID];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    GuideDataItem *item = [self.array objectAtIndex:indexPath.row];
    cell.titleString = item.detail;
    cell.detailString = item.detail;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:CELL_ID cacheByIndexPath:indexPath configuration:^(id cell) {
        TestCell *itemCell = cell;
        GuideDataItem *item = [self.array objectAtIndex:indexPath.row];
        itemCell.titleString = item.detail;
        itemCell.detailString = item.detail;
    }];
}

@end
