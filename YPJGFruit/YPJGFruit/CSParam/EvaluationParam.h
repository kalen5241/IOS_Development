//
//  EvaluationParam.h
//  CarSecretary
//
//  Created by Robin on 15/7/24.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@interface EvaluationParam : Jastor

@property (nonatomic, strong) NSString *carId;

@property (nonatomic, strong) NSString *maintainNo;

@property (nonatomic, strong) NSString *comment;

@property (nonatomic, strong) NSString *serviceLevel;

@end
