//
//  CellItems.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/16.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "CellItems.h"
#import "LayoutClass.h"
@implementation CellItems


//- (void)deposite {
//    
//    self.cell.str = self.strArray[self.indexPath.row];
//
//}

-(NSArray *)strArray {
    
    if (!_strArray) {
        _strArray = @[@"ddXFDFGSDFSDFSDFSDFSDFSDFSDFSFSDFSFSDFSDFSDFSd",@"ddds",@"ddSDFSDFSDFSFSDFSDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFds",@"ddds",@"dSDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFdds"];
    }
    return _strArray;
}

-(void)setCell:(CustomCell *)cell {
    _cell = cell;
    
    _cell.contentView.tag = 2;
    
    UILabel *l1 = [[UILabel alloc]init];
    l1.tag = 3;
    l1.text = self.strArray[self.indexPath.row];
    [LayoutClass view:_cell.contentView andView:l1];
    
}

- (NSInteger)rows {
    
    if (!_rows) {
        _rows = self.strArray.count;
    }
    
    return _rows;
}

- (NSInteger)secitons {
    
    if (!_secitons) {
        _secitons = 1;
    }
    
    return _secitons;
}

@end
