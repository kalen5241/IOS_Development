//
//  CodeChartVC.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/28.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "CodeChartVC.h"
#import "TableViewCell.h"
@interface CodeChartVC () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation CodeChartVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UITableView *tv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 260)];
    
    NSString *cellName = NSStringFromClass([TableViewCell class]);
    [tv registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];
    
    tv.dataSource = self;
    tv.delegate = self;
    [self.view addSubview:tv];
    

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
    return 260;
}

@end
