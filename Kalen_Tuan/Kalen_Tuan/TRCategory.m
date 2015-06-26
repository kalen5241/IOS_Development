//
//  TRCategory.m
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCategory.h"

@implementation TRCategory
+(id)parseCategoryData:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
        self.highlighted_icon= dict[@"highlighted_icon"];
        self.small_highlighted_icon = dict[@"small_highlighted_icon"];
        self.small_icon = dict[@"small_icon"];
        self.subcategories = dict[@"subcategories"];
    }
    return self;
}

@end
