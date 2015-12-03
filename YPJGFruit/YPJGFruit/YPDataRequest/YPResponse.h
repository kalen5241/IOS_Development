//
//  YPResponse.h
//  YPJGFruit
//
//  Created by kalen on 15/11/15.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
#import "YPModel.h"

@interface YPResponse : Jastor
@property (nonatomic, assign) int flag;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) YPModel *list;
+ (Class)list_class;
@end
