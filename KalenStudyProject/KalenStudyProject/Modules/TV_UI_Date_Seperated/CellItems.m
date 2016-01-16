//
//  CellItems.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/16.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "CellItems.h"

@implementation CellItems
- (void)deposite {
    
    self.cell.str = self.strArray[self.indexPath.row];

}



@end
