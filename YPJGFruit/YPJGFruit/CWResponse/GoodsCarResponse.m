//
//  GoodsCarResponse.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/21.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "GoodsCarResponse.h"

#pragma mark - 购物车idModel
@implementation CarIdModel

@end


#pragma mark - 购物车 车与商品
@implementation GoodsCarModel


@end


#pragma mark - 购物车 请求会数据
@implementation GoodsCarResponse

+(Class)data_class {
    return [GoodsCarModel class];
}

@end



#pragma mark - 配送地址
@implementation CarAddressModel

@end



#pragma mark - 配送地址 请求返回数据
@implementation CarAddressResponse
+(Class)data_class {
    return [CarAddressModel class];
}
@end



#pragma mark - 城市Model
@implementation cityModel
@end


#pragma mark - 城市列表Model
@implementation cityListModel
+(Class)city_class {
    return [cityModel class];
}

@end


#pragma mark - 城市列表Response
@implementation cityListResponse
+(Class)data_class {
    return [cityListModel class];
}

@end
