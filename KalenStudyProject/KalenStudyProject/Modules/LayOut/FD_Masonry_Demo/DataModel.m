//
//  DataModel.m
//  TestAutoCell
//
//  Created by Huashen on 11/13/15.
//  Copyright © 2015 csc. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

+(instancetype)dataModelWithTitle:(NSString *)title content:(NSString *)content
{
    DataModel *dataModel = [[DataModel alloc] init];
    dataModel.title = title;
    dataModel.content = content;
    return dataModel;
}
@end
