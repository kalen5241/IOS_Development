//
//  CellItems.h
//  KalenStudyProject
//
//  Created by kalen on 16/1/16.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface CellItems : NSObject

//Cell
@property (nonatomic, assign) NSInteger secitons;
@property (nonatomic, assign) NSInteger rows;
@property (nonatomic, assign) NSIndexPath* indexPath;
@property (nonatomic, strong) UITableView *tv;
@property (nonatomic, strong) CustomCell *cell;

//Data
@property (nonatomic, strong) NSArray *strArray;

@end
