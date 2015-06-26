//
//  TRCityGroup.h
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRCityGroup : NSObject
@property (nonatomic,strong) NSArray *cities;
@property (nonatomic,strong) NSString *title;
+(id)parseCityGroupData:(NSDictionary *)dic;
@end
