//
//  BaseTableTestVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/24.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "BaseTableTestVC.h"
#import "KalenTableViewCellCode.h"
#import "FD_Masonry_CellXib.h"

@interface BaseTableTestVC ()
@end

@implementation BaseTableTestVC

- (void)viewDidLoad {
    
    self.freshFlag = YES;
    self.isXib = NO;
    self.isStatic= NO;
    
    if (self.isXib) {
    /* !xib*/
    self.tempNibName = @"FD_Masonry_CellXib";
    }else {
    /* !code*/
     self.customCellClass = [KalenTableViewCellCode class];
    }
    self.cellIdentinfier = @"CELL";
    self.dataArray =  [self fetchDataArray];
    [super viewDidLoad];
}

- (NSMutableArray *)fetchDataArray {
    
    NSMutableArray*  dataArray = [NSMutableArray array];
    KalenDataModel *model1 = [KalenDataModel initDataModelWithTitle:@"ddddd1"
                                                         andContent:@"ddddd"
                                                       andImageView:@"taocan.png"];
    [dataArray addObject:model1];
    KalenDataModel *model2 = [KalenDataModel initDataModelWithTitle:@"ddddd1"
                                                         andContent:@"ddddd"
                                                       andImageView:@"taocan.png"];
    [dataArray addObject:model2];
    return dataArray;
}

@end
