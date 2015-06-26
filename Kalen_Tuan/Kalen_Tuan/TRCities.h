//
//  TRCities.h
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRCities : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *pinYin;
@property (nonatomic,strong) NSString *pinYinHead;
+(id)parseCityData:(NSDictionary *)dic;
@end
