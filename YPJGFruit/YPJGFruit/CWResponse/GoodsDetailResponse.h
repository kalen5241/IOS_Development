//
//  GoodsDetailResponse.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/21.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWBaseModel.h"

#pragma mark - GoodsParametersModel
@interface GoodsParametersModel : Jastor
@property (nonatomic, strong) NSString *goodsId;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;
@end



#pragma mark - GoodsDetailModel
@interface GoodsDetailModel : Jastor
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
@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *weight;

@property (nonatomic, strong) NSArray *parameters;
@property (nonatomic, strong) NSArray *pictures;
+(Class)parameters_class;
+(Class)pictures_class;

@end




#pragma mark - GoodsDetailResponse
@interface GoodsDetailResponse : CWBaseModel
@property (nonatomic, strong) GoodsDetailModel *data;
@end
