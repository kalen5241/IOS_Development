//
//  TRCityGroup.m
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCityGroup.h"

@implementation TRCityGroup
+(id)parseCityGroupData:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}
-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.cities = dic[@"cities"];
        self.title = dic[@"title"];
    }
    return self;
}

@end
