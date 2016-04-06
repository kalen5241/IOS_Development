//
//  CWBaseModel.h
//  CarSecretary
//
//  Created by Robin on 15/7/23.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@interface CWBaseModel : Jastor

@property (nonatomic, assign) int code;

@property (nonatomic, strong) NSString *msg;

@end
