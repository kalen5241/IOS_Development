//
//  FD_Masonry_DemoVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/20.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "FD_Masonry_DemoVC.h"
#import "DataModel.h"
#import "TableViewCellCode.h"
#import "TableViewCellXib.h"
#import "Masonry.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface FD_Masonry_DemoVC () <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation FD_Masonry_DemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
     [self initView];
}

#pragma mark - View

-(void)initView
{
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.top.equalTo(@0);
    }];
    
}

#pragma mark - <UITableViewDataSource/UITableViewDelegate>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    /*! Code
        TableViewCellCode *cell = [tableView dequeueReusableCellWithIdentifier:kHWTestHeightCellIdentifier forIndexPath:indexPath];*/
    
    /*! Xib*/
    TableViewCellXib *cell = [tableView dequeueReusableCellWithIdentifier:kHWTestHeightCellIdentifier forIndexPath:indexPath];
    cell.dataModel = _data[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*! Code
        CGFloat height = [tableView fd_heightForCellWithIdentifier:kHWTestHeightCellIdentifier cacheByIndexPath:indexPath configuration:^(id cell) {
            TableViewCellCode *tbCell = (TableViewCellCode *)cell;
            tbCell.dataModel = _data[indexPath.row];
        }];*/
    /*! Xib*/
    CGFloat height = [tableView fd_heightForCellWithIdentifier:kHWTestHeightCellIdentifier cacheByIndexPath:indexPath configuration:^(id cell) {
        TableViewCellXib *tbCell = (TableViewCellXib *)cell;
        tbCell.dataModel = _data[indexPath.row];
    }];
    return height;
}
#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        /*! Code
        [_tableView registerClass:[TableViewCellCode class] forCellReuseIdentifier:kHWTestHeightCellIdentifier];*/
        /*! Xib*/
        [_tableView registerNib:[UINib nibWithNibName:@"TableViewCellXib" bundle:nil] forCellReuseIdentifier:kHWTestHeightCellIdentifier];
    }
    
    return _tableView;
}

-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
        DataModel *model = [DataModel dataModelWithTitle:@"打打分放大发发大氛围七分袜打打分放大发发大氛围七分袜氛围七分袜" content:@"的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大"];
        
              DataModel *model2 = [DataModel dataModelWithTitle:@"打打分放大发发大氛围七分袜打打分放大发发大氛围七分袜氛围七分袜" content:@"的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大的发放四大范德萨发全五分啊我V大"];
        [_data addObject:model];
        [_data addObject:model2];
    }
    return _data;
}


@end
