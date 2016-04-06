//
//  CarInfoParam.h
//  CarSecretary
//
//  Created by Robin on 15/9/25.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarInfoParam : NSObject

@property (nonatomic, copy) NSString *licenseNum;

@property (nonatomic, copy) NSString *brandId;

@property (nonatomic, copy) NSString *factoryId;

@property (nonatomic, copy) NSString *modelId;

@property (nonatomic, copy) NSString *carTypeId;

//新的属性
@property (nonatomic, copy) NSString *curMile;

@property (nonatomic, copy) NSString *lastMainteranceTime;

@property (nonatomic, copy) NSString *lastMile;

@end
