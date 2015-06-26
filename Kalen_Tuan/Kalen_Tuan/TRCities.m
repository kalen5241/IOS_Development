//
//  TRCities.m
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCities.h"

@implementation TRCities
+(id)parseCityData:(NSDictionary *)dic{
    return [[self alloc]initWithCity:dic];
}

-(id)initWithCity:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.name = dic[@"name"];
        self.pinYin = dic[@"pinYin"];
        self.pinYinHead = dic[@"pinYinHead"];
    }
    return self;
}
@end
