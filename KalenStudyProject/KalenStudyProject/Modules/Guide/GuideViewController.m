//
//  GuideViewController.m
//  KalenStudyProject
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "GuideViewController.h"
#import "MutilDataSource.h"
#import "UITestingVC.h"
#import "DataUtil.h"
#import "BasicCell.h"
#import "GuideDataItem.h"
#import "MobClick.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "UIViewController+MMDrawerController.h"
#import "LeftMenuVCViewController.h"


#define CELL_ID @"KalenCell"
@interface GuideViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation GuideViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [MobClick beginLogPageView:@"Guide"];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [MobClick endLogPageView:@"Guide"];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
        {
            [self setEdgesForExtendedLayout:UIRectEdgeNone];
        }
    [self.navigationItem setHidesBackButton:YES];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataArray = [[[DataUtil alloc]init] fetchGuideArray];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BasicCell" bundle:nil] forCellReuseIdentifier:CELL_ID];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *menuBtnImage = [UIImage imageNamed:@"menu.png"]  ;
    [menuBtn setBackgroundImage:menuBtnImage forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(showLeftMenu:) forControlEvents:UIControlEventTouchUpInside];
    menuBtn.frame = CGRectMake(0, 0, 25, 20);
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
 
    NSString *sortPath = [[NSBundle mainBundle] pathForResource:@"Data.plist" ofType:nil];
    NSLog(@"文件路径为%@",sortPath);
    
}


- (void)showLeftMenu:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(NSArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [DataUtil fetchArray];
    }
    return _dataArray;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    BasicCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    GuideDataItem *item = [self.dataArray objectAtIndex:indexPath.row];
    cell.title.text = item.title;
    cell.detail.text = item.detail;

   [MobClick event:@"Guide_test" label:nil];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    GuideDataItem *item =  self.dataArray[indexPath.row];
    item.destVC.title = item.title;
    [self.navigationController pushViewController:item.destVC animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:CELL_ID cacheByIndexPath:indexPath configuration:^(id cell) {
        
        BasicCell *itemCell = cell;
        GuideDataItem *item = [self.dataArray objectAtIndex:indexPath.row];
        itemCell.title.text = item.title;
        itemCell.detail.text = item.detail;
    }];
}
@end

