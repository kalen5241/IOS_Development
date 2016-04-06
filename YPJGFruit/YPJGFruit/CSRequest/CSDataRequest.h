//
//  CSDataRequest.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/2.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "RegistrationResponse.h"
#import "LoginResponse.h"
#import "ShopServerResponse.h"
#import "GoodsDetailResponse.h"
#import "GoodsCarResponse.h"
#import "CarErrorListResponse.h"

@interface CSDataRequest : NSObject

/**
 *注册
 */
+ (NSURLSessionDataTask *)doRegistration:(RegistrationParam *)param completion:(void(^)(RegistrationResponse *response, NSError *error))block ;

/**
 *注册获取密码
 */
+ (NSURLSessionDataTask *)fetchPassword:(NSString *)phoneNum completion:(void(^)(CWBaseModel *response, NSError *error))block;

/**
 *忘记密码 获取验证码
 */
+ (NSURLSessionDataTask *)fetchVerifyCode:(NSString *)phoneNum compeletion:(void(^)(CWBaseModel *response, NSError *error))block;

/**
 *忘记密码
 */
+ (NSURLSessionDataTask *)fetchForgetWord:(NSString *)phoneNum vcode:(NSString *)vcode password:(NSString *)password confirmpassword:(NSString *)confirmpassword compeletion:(void(^)(CWBaseModel *response, NSError *error))block;

/**
 *登录
 */
+ (NSURLSessionDataTask *)login:(LoginParam *)param compeletion:(void(^)(LoginResponse *response, NSError *error))block;

/**
 *商品 服务
 */
+ (NSURLSessionDataTask *)shopServer:(NSString *)shopOrServer compeletion:(void(^)(ShopServerResponse *response, NSError *error))block;

/**
 * 商品详情
 */
+ (NSURLSessionDataTask *)goodsDetail:(NSString *)goodsId compeletion:(void(^)(GoodsDetailResponse *response, NSError *error))block;

/**
 *查看购物车
 */
+ (NSURLSessionDataTask *)lookGoodsCarCompeletion:(void(^)(GoodsCarResponse *response, NSError *error))block;


/**
 *添加购物车
 */
+ (NSURLSessionDataTask *)addGoodsCar:(NSString *)goodsId andParam:(NSMutableDictionary *)param Compeletion:(void(^)(CWBaseModel *response, NSError *error))block;

/**
 *获取用户地址
 */
+ (NSURLSessionDataTask *)getUserAddressCompeletion:(void(^)(CarAddressResponse *response, NSError *error))block;


/**
 *获取省市列表
 */
+ (NSURLSessionDataTask *)getProvincesCityCompeletion:(void(^)(cityListResponse *response, NSError *error))block;


/**
 *添加收货地址
 */
+ (NSURLSessionDataTask *)addUserAddress:(CarAddressModel *)carAddress compeletion:(void(^)(CWBaseModel *response, NSError *error))block;


/**
 *保险信息修改
 */
+ (NSURLSessionDataTask *)setInsuranceInfoWithLastCompulsoryTime:(NSString*)lastCompulsoryTime andLastInsuranceTime:(NSString*)lastInsuranceTime compeletion:(void (^)(CWBaseModel *response, NSError *error))block;

/**
 *车辆检测
 */
+ (NSURLSessionDataTask *)fetchCarRealTimeError:(NSString *)carId compeletion:(void(^)(CarErrorListResponse *response, NSError *error))block;
@end
