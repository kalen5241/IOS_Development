//
//  PassValueVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/8.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "PassValueVC.h"
#import "BasicCell.h"
#import "GuideDataItem.h"
#import "TestCell.h"
#import "DelePassValueVC.h"
#import "NotificationVC.h"
#import "ThreedPassVC.h"
#import <UITableView+FDTemplateLayoutCell.h>

#define CELL_ID @"SmsDetailCellId"


@interface PassValueVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *array;
@end

@implementation PassValueVC

-(NSArray *)array {
    
    if (!_array) {
        
        GuideDataItem *item1 = [[GuideDataItem alloc]init];
        item1.title = @"协议传值";
        item1.destVC = [[DelePassValueVC alloc]init];
        item1.detail = @"协议传值-delePassValueVC";
        
        GuideDataItem *item2 = [[GuideDataItem alloc]init];
        item2.title = @"通知传值";
        item2.destVC = [[NotificationVC alloc]init];
        item2.detail = @"通知传值-NotificationVC";

        GuideDataItem *item3 = [[GuideDataItem alloc]init];
        item3.title = @"创建线程传值";
        item3.destVC = [[ThreedPassVC alloc]init];
        item3.detail = @"创建线程传值-ThreedPassVC";
//
//        GuideDataItem *item4 = [[GuideDataItem alloc]init];
//        item4.title = @"UITableView根据内容自适应高度";
//        item4.destVC = [[AutoResizeCellHeightVC alloc]init];
//        item4.detail = @"为解决每次都根据内容调整单元格高度的问题-AutoResizeCellHeightVC";
//        
//        GuideDataItem *item5 = [[GuideDataItem alloc]init];
//        item5.title = @"UMeng分享";
//        item5.destVC = [[UMengSocialVCViewController alloc]init];
//        item5.detail = @"用于友盟分享测试-UMengSocialVCViewController";
//        
//        GuideDataItem *item6 = [[GuideDataItem alloc]init];
//        item6.title = @"初始化方法、工厂方法、关联";
//        item6.destVC = [[ConnectionVC alloc]init];
//        item6.detail = @"通过工厂方法调用初始化方法给对象添加关联属性-ConnectionVC";
//        
//        GuideDataItem *item7 = [[GuideDataItem alloc]init];
//        item7.title = @"图片开法";
//        item7.destVC = [[ImageDevVC alloc]init];
//        item7.detail = @"图片开发的多种方法-ImageDevVC";
//        
//        GuideDataItem *item8 = [[GuideDataItem alloc]init];
//        item8.title = @"绘制曲线";
//        item8.destVC = [[DrawPic alloc]init];
//        item8.detail = @"用于测试绘制曲线-DrawPic";
//        
//        GuideDataItem *item9 = [[GuideDataItem alloc]init];
//        item9.title = @"树形展开Cell";
//        item9.destVC = [[CellTreeVC alloc]init];
//        item9.detail = @"可多级展开的TableView－CellTreeVC";
//        
//        GuideDataItem *item10 = [[GuideDataItem alloc]init];
//        item10.title = @"运行时RunTime";
//        item10.destVC = [[RunTimeVC alloc]init];
//        item10.detail = @"练习运行时－CellTreeVC";
//        
//        GuideDataItem *item11 = [[GuideDataItem alloc]init];
//        item11.title = @"Chart";
//        item11.destVC = [[ChartVC alloc]init];
//        item11.detail = @"练习图表－CellTreeVC";
        
        _array = @[item1,item2,item3];
    }
    return _array;
}

//-(NSArray *)array {
//    
//    if (!_array) {
//        _array = [DataUtil fetchArray];
//    }
//    return _array;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] init];
    
    self.tableView = tableView;
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0,0,0,0));
    }];
    
    UINib *nib = [UINib nibWithNibName:@"BasicCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID];
    
//    [self.tableView registerClass:[TestCell class] forCellReuseIdentifier:CELL_ID];
    
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
        itemCell.title.text = item.detail;
        itemCell.detail.text = item.detail;
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GuideDataItem *item =  self.array[indexPath.row];
    item.destVC.title = item.title;
    [self.navigationController pushViewController:item.destVC animated:YES];
    
}

@end
