
//
//  FD_Masonry_KalenVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/20.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "FD_Masonry_KalenVC.h"
#import "KalenDataModel.h"
#import "KalenTableViewCellCode.h"
#import "FD_Masonry_CellXib.h"


#define CELL1 @"cellIdf"

@interface FD_Masonry_KalenVC () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *tableview;
@end

@implementation FD_Masonry_KalenVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];

}

#pragma mark -- View

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

- (NSArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        KalenDataModel *model1 = [KalenDataModel initDataModelWithTitle:@"ddddd1"
                                                             andContent:@"ddddd"
                                                           andImageView:@"taocan.png"];
        [_dataArray addObject:model1];
    }
    return _dataArray;
}

- (UITableView *)tableview {
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]init];
        _tableview.dataSource = self;
        _tableview.delegate = self;
        
        /*! xib
        [_tableview registerNib:[UINib nibWithNibName:@"FD_Masonry_CellXib" bundle:nil] forCellReuseIdentifier:CELL1]; */
        
        /*! code*/
         [_tableview registerClass:[KalenTableViewCellCode class] forCellReuseIdentifier:CELL1];
    }
    return _tableview;
}


#pragma mark --UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*! xib
    FD_Masonry_CellXib *cell = [tableView dequeueReusableCellWithIdentifier:CELL1 forIndexPath:indexPath];*/
    
    /*! code*/
    KalenTableViewCellCode *cell = [tableView dequeueReusableCellWithIdentifier:CELL1 forIndexPath:indexPath];
    
    cell.dataModel = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    CGFloat height = [tableView fd_heightForCellWithIdentifier:CELL1 cacheByIndexPath:indexPath configuration:^(id cell) {
        /*! xib
        FD_Masonry_CellXib *tbCell = (FD_Masonry_CellXib *)cell;*/
        
        /*! code*/
        KalenTableViewCellCode *tbCell = (KalenTableViewCellCode *)cell;
        tbCell.dataModel = self.dataArray[indexPath.row];
    }];
    return height;
}



@end
