//
//  TRSorts.m
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRSorts.h"

@implementation TRSorts
+(id)parseSortData:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.label = dict[@"label"];
        self.value = dict[@"value"];
    }
    return self;
}
@end
