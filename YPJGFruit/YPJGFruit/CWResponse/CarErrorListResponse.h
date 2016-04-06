//
//  CarErrorListResponse.h
//  CarSecretary
//
//  Created by Robin on 15/7/27.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import "CWBaseModel.h"


@interface CarErrorModel : Jastor

@property (nonatomic, copy) NSString *guZhangMa;

@property (nonatomic, assign) NSInteger guZhangMaZhuangTai;

@end


@interface CarErrorListResponse : CWBaseModel

@property(nonatomic, strong) NSArray *data;

+ (Class)data_class;

@end




