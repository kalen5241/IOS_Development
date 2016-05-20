//
//  TableViewCell.h
//  TestAutoCell
//
//  Created by Huashen on 11/13/15.
//  Copyright © 2015 csc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;

static NSString * const kHWTestHeightCellIdentifier = @"kHWTestHeightCellIdentifier";

@interface TableViewCellCode : UITableViewCell

@property (strong, nonatomic) DataModel *dataModel;

@end
