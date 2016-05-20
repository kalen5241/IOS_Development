//
//  TableViewCellXib.m
//  TestAutoCell
//
//  Created by Huashen on 11/14/15.
//  Copyright © 2015 csc. All rights reserved.
//

#import "TableViewCellXib.h"
#import "DataModel.h"

@interface TableViewCellXib()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@end
@implementation TableViewCellXib



-(void)setDataModel:(DataModel *)dataModel
{
    _dataModel = dataModel;
    self.titleLabel.text = dataModel.title;
    self.contentLabel.text = dataModel.content;
}
@end
