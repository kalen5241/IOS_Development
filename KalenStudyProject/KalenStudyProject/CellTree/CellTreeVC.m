//
//  CellTreeVC.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/8.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "CellTreeVC.h"
#import "RATreeView.h"
#import "RADataObject.h"
#import "GuideDataItem.h"
#import "GuideViewController.h"
#import "RotationVC.h"
#import "ScaleVC.h"
#import "MoveVC.h"
#import "OpacityVC.h"
#import "GroupAnimationVC.h"
#import "LayoutAnimationVC.h"
#import "DirectionAnimationVC.h"
#import "DBTestVC.h"
#import "ActivityByDBVC.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface CellTreeVC () <RATreeViewDelegate,RATreeViewDataSource>
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) id expanded;
@property (weak, nonatomic) RATreeView *treeView;
@end

@implementation CellTreeVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if([[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."][0] intValue] >= 7) {
        CGRect statusBarViewRect = [[UIApplication sharedApplication] statusBarFrame];
        float heightPadding = statusBarViewRect.size.height+self.navigationController.navigationBar.frame.size.height -66;
        self.treeView.contentInset = UIEdgeInsetsMake(heightPadding, 0.0, 0.0, 0.0);
        self.treeView.contentOffset = CGPointMake(0.0, -heightPadding);
    }
    self.treeView.frame = self.view.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"知识管理";
    
    RotationVC *animationTypeOne = [[RotationVC alloc] init];
    ScaleVC *animationTypeTwo = [[ScaleVC alloc] init];
    MoveVC *animationTypeThree = [[MoveVC alloc] init];
    OpacityVC *animationTypeFour = [[OpacityVC alloc] init];
    GroupAnimationVC *animationTypeFive = [[GroupAnimationVC alloc] init];
    LayoutAnimationVC *animationTypeSix = [[LayoutAnimationVC alloc] init];
    DirectionAnimationVC *animationTypeSeven = [[DirectionAnimationVC alloc] init];
    
    RADataObject *phone1 = [RADataObject dataObjectWithName:@"旋转" childrenVC:animationTypeOne];
    RADataObject *phone2 = [RADataObject dataObjectWithName:@"缩放" childrenVC:animationTypeTwo];
    RADataObject *phone3 = [RADataObject dataObjectWithName:@"移动" childrenVC:animationTypeThree];
    RADataObject *phone4 = [RADataObject dataObjectWithName:@"透明度" childrenVC:animationTypeFour];
    RADataObject *phone5 = [RADataObject dataObjectWithName:@"组合" childrenVC:animationTypeFive];
    RADataObject *phone6 = [RADataObject dataObjectWithName:@"自动布局动画" childrenVC:animationTypeSix];
    RADataObject *phone7 = [RADataObject dataObjectWithName:@"翻转视图" childrenVC:animationTypeSeven];

    RADataObject *phone = [RADataObject dataObjectWithName:@"动画相关"
                                                  children:[NSArray arrayWithObjects:phone1, phone2, phone3, phone4, phone5,phone6, phone7,nil]];
    
    
    DBTestVC *DB1 = [[DBTestVC alloc] init];
    ActivityByDBVC *DB2 = [[ActivityByDBVC alloc] init];
    
    RADataObject *notebook1 = [RADataObject dataObjectWithName:@"Notebook 1" childrenVC:DB1];
    RADataObject *notebook2 = [RADataObject dataObjectWithName:@"Notebook 2" childrenVC:DB2];
    self.expanded = notebook1;
    
    RADataObject *computer1 = [RADataObject dataObjectWithName:@"数据库相关1"
                                                      children:[NSArray arrayWithObjects:notebook1, notebook2, nil]];    
    RADataObject *computer2 = [RADataObject dataObjectWithName:@"数据库相关1"
                                                      children:[NSArray arrayWithObjects:notebook1, notebook2, nil]];
    
    RADataObject *computer3 = [RADataObject dataObjectWithName:@"Computer 3" children:nil];
    
    RADataObject *computer = [RADataObject dataObjectWithName:@"数据库相关"
                                                     children:[NSArray arrayWithObjects:computer1, computer2, computer3, nil]];
    RADataObject *car = [RADataObject dataObjectWithName:@"Cars" children:nil];
    
    
    self.data = [NSArray arrayWithObjects:phone, computer, car, nil];

    RATreeView *treeView = [[RATreeView alloc] initWithFrame:self.view.bounds];
    treeView.delegate = self;
    treeView.dataSource = self;
    [self.view addSubview:treeView];
    self.treeView = treeView;
    [treeView reloadData];
    [treeView expandRowForItem:phone withRowAnimation:RATreeViewRowAnimationLeft]; //expands Row
}



#pragma mark TreeView Data Source
- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    
    
    NSInteger numberOfChildren = [treeNodeInfo.children count];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Number of children %ld", (long)numberOfChildren];
    cell.textLabel.text = ((RADataObject *)item).name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (treeNodeInfo.treeDepthLevel == 0) {
        cell.detailTextLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}


- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [self.data count];
    }
    RADataObject *data = item;
    return [data.children count];
}

- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item
{
    RADataObject *data = item;
    if (item == nil) {
        return [self.data objectAtIndex:index];
    }
    return [data.children objectAtIndex:index];
}



#pragma mark TreeView Delegate methods
- (NSInteger)treeView:(RATreeView *)treeView indentationLevelForRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return 3 * treeNodeInfo.treeDepthLevel;
}

- (BOOL)treeView:(RATreeView *)treeView shouldExpandItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return YES;
}

- (BOOL)treeView:(RATreeView *)treeView shouldItemBeExpandedAfterDataReload:(id)item treeDepthLevel:(NSInteger)treeDepthLevel
{
    if ([item isEqual:self.expanded]) {
        return YES;
    }
    return NO;
}

- (void)treeView:(RATreeView *)treeView willDisplayCell:(UITableViewCell *)cell forItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    if (treeNodeInfo.treeDepthLevel == 0) {
        cell.backgroundColor = UIColorFromRGB(0xF7F7F7);
    } else if (treeNodeInfo.treeDepthLevel == 1) {
        cell.backgroundColor = UIColorFromRGB(0xD1EEFC);
    } else if (treeNodeInfo.treeDepthLevel == 2) {
        cell.backgroundColor = UIColorFromRGB(0xE0F8D8);
    }
}

- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return 47;
}

- (void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo {
    
    if (((RADataObject *)item).subVC ) {
            [self.navigationController pushViewController:((RADataObject *)item).subVC animated:YES];
    }

}
@end
