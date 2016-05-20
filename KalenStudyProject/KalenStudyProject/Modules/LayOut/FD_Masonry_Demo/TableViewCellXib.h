//
//  TableViewCellXib.h
//  TestAutoCell
//
//  Created by Huashen on 11/14/15.
//  Copyright © 2015 csc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataModel;
@interface TableViewCellXib : UITableViewCell
@property (strong, nonatomic) DataModel *dataModel;
@end
