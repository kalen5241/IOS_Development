//
//  ChartVC.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/28.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "ChartVC.h"
#import "TableViewCell.h"
#import "UUChart.h"
@interface ChartVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *cellName = NSStringFromClass([TableViewCell class]);
    [self.tableview registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];


}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    cell.contentView.backgroundColor = [UIColor blueColor];
    [cell configUI:indexPath];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}
@end
