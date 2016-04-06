//
//  GoodsCarResponse.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/21.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWBaseModel.h"
#import "ShopServerResponse.h"


#pragma mark - 购物车idModel
@interface CarIdModel : Jastor
@property (nonatomic, strong) NSString *carId;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *diliverMode;
@property (nonatomic, strong) NSString *goodsId;
@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *number;

@end


#pragma mark - 购物车 车与商品
@interface GoodsCarModel : Jastor
@property (nonatomic, strong) ShopServerModel *goods;
@property (nonatomic, strong) CarIdModel *cart;
@end


#pragma mark - 购物车 请求数据
@interface GoodsCarResponse : CWBaseModel
@property (nonatomic, strong) NSArray *data;

+(Class)data_class;
@end



#pragma mark - 配送地址
@interface CarAddressModel : Jastor

/*
 "carId": 216,
 "cityId": 800,
 "contact": "熊猫",
 "contactAddress": "熊猫区熊猫街熊猫路66号",
 "contactPhone": "15001234567",
 "createTime": "2016-03-23 10:21:50",
 "firstChoice": 0,
 "fullAddress": "辽宁 沈阳 熊猫区熊猫街熊猫路66号",
 "id": 2,
 "provinceId": 8,
 "status": 1
 */
@property (nonatomic, strong) NSString *carId;
@property (nonatomic, strong) NSString *cityId;
@property (nonatomic, strong) NSString *contact;
@property (nonatomic, strong) NSString *contactAddress;
@property (nonatomic, strong) NSString *contactPhone;

@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *firstChoice;
@property (nonatomic, strong) NSString *fullAddress;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *provinceId;
@property (nonatomic, strong) NSString *status;


@end


#pragma mark - 配送地址 请求返回数据
@interface CarAddressResponse : CWBaseModel
@property (nonatomic, strong) NSArray *data;
+(Class)data_class;
@end



#pragma mark - 城市Model
@interface cityModel : Jastor
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@end


#pragma mark - 城市列表Model
@interface cityListModel : Jastor

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *city;
+(Class)city_class;

@end

#pragma mark - 城市列表Response
@interface cityListResponse : CWBaseModel
@property (nonatomic, strong) NSArray *data;
+(Class)data_class;
@end
