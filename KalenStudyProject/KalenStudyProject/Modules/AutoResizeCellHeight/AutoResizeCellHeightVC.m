//
//  AutoResizeCellHeightVC.m
//  KalenStudyProject
//
//  Created by kalen on 15/11/13.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "AutoResizeCellHeightVC.h"
#import "DataUtil.h"
#import "BasicCell.h"
#import "GuideDataItem.h"
#import <UITableView+FDTemplateLayoutCell.h>


#define CELL_ID @"SmsDetailCellId"

@interface AutoResizeCellHeightVC () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *array;
@end

@implementation AutoResizeCellHeightVC


-(NSArray *)array {
    
    if (!_array) {
        _array = [DataUtil fetchArray];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *smsDetailCellNib = [UINib nibWithNibName:@"BasicCell" bundle:nil];
    [self.tableView registerNib:smsDetailCellNib forCellReuseIdentifier:CELL_ID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BasicCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    GuideDataItem *item = [self.array objectAtIndex:indexPath.row];
    cell.title.text = item.title;
    cell.detail.text = item.detail;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:CELL_ID cacheByIndexPath:indexPath configuration:^(id cell) {
        BasicCell *itemCell = cell;
        GuideDataItem *item = [self.array objectAtIndex:indexPath.row];
        itemCell.title.text = item.title;
        itemCell.detail.text = item.detail;
    }];
}

@end
