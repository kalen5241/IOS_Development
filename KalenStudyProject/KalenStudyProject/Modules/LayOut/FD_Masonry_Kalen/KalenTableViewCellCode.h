//
//  KalenTableViewCellCode.h
//  KalenStudyProject
//
//  Created by kalen on 16/5/20.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "TableViewCell.h"
#import "KalenDataModel.h"

static NSString * const kHWTestHeightCellIdentifier = @"kHWTestHeightCellIdentifier";

@interface KalenTableViewCellCode : TableViewCell
@property (strong, nonatomic) KalenDataModel *dataModel;
@end
