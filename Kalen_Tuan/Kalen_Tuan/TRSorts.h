//
//  TRSorts.h
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRSorts : NSObject
@property (nonatomic,strong) NSString *label;
@property (nonatomic,assign) NSNumber *value;
+(id)parseSortData:(NSDictionary *)dic;
@end
