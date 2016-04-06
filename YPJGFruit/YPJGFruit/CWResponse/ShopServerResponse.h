//
//  ShopServerResponse.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/17.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWBaseModel.h"

#pragma mark - ShopServerModel
@interface ShopServerModel : Jastor


@property (nonatomic, strong) NSString *bigLogo;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *brandId;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *categoryNo;

@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *currentPrice;
@property (nonatomic, strong) NSString *dealerId;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *diliverFee;

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *middleLogo;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *no;
@property (nonatomic, strong) NSString *originalPrice;

@property (nonatomic, strong) NSString *saleCount;
@property (nonatomic, strong) NSString *smallLogo;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *storageCount;
@property (nonatomic, strong) NSString *type;  //商品类型  （商品 1 ，服务 2）

@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *weight;

@end



#pragma mark - ShopServerResponse

@interface ShopServerResponse : CWBaseModel

@property (nonatomic, strong) NSArray *data;

+(Class)data_class;
@end
