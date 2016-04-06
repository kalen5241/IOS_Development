//
//  CSDataRequest.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/2.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CSDataRequest.h"

@implementation CSDataRequest

/**
 *注册
 */
+ (NSURLSessionDataTask *)doRegistration:(RegistrationParam *)param completion:(void(^)(RegistrationResponse *response, NSError *error))block {
    NSDictionary *params = @{@"userName": param.userName,
                             @"phoneNum": param.phoneNum,
                             @"vcode": param.vcode,
                             @"inviteCode":param.inviteCode};
    
    //调用封装的post请求
    return [[AFAppDotNetAPIClient sharedClient] POST:@"addCar" parameters:params compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            RegistrationResponse *response = [[RegistrationResponse alloc] initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil,error);
        }
    }];
    
}

/**
 *注册获取密码
 */
+ (NSURLSessionDataTask *)fetchPassword:(NSString *)phoneNum completion:(void(^)(CWBaseModel *response, NSError *error))block {
    NSDictionary *params = @{@"phoneNum": phoneNum};
    
    //调用封装的get请求
    return [[AFAppDotNetAPIClient sharedClient] GET:@"sendPassword" parameters:params compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            CWBaseModel *response = [[CWBaseModel alloc] initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
    }];
    
}


/**
 *忘记密码 获取验证码
 */
+ (NSURLSessionDataTask *)fetchVerifyCode:(NSString *)phoneNum compeletion:(void(^)(CWBaseModel *response, NSError *error))block {
    NSDictionary *params = @{@"phoneNum": phoneNum};
    
    //调用封装的post请求
    return [[AFAppDotNetAPIClient sharedClient] POST:@"verifyCode" parameters:params compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            CWBaseModel *response = [[CWBaseModel alloc] initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
    }];
    
}


/**
 *忘记密码
 */
+ (NSURLSessionDataTask *)fetchForgetWord:(NSString *)phoneNum vcode:(NSString *)vcode password:(NSString *)password confirmpassword:(NSString *)confirmpassword compeletion:(void(^)(CWBaseModel *response, NSError *error))block {
    NSDictionary *params = @{@"phoneNum":phoneNum,
                             @"vcode":vcode,
                             @"password":password,
                             @"confirmpassword":confirmpassword};
    //调用封装的post请求
    return [[AFAppDotNetAPIClient sharedClient] POST:@"forgetPwd" parameters:params compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            CWBaseModel *response = [[CWBaseModel alloc] initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
    }];
}


/**
 *登录
 */
+ (NSURLSessionDataTask *)login:(LoginParam *)param compeletion:(void(^)(LoginResponse *response, NSError *error))block {
    NSDictionary *params = @{@"phoneNum": param.phoneNum,
                             @"pwd": param.password,
                             @"token": param.token,
                             @"appType": @"2",
                             @"version": [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]};
    
    //调用封装的post请求
    return  [[AFAppDotNetAPIClient sharedClient] POST:@"login" parameters:params compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            LoginResponse *response = [[LoginResponse alloc] initWithDictionary:resultDict];
            //NSLog(@"denglu = %@",response);
            block(response, nil);
        }else {
            block(nil, error);
        }
    }];
}

/**
 *商品 服务
 */
+ (NSURLSessionDataTask *)shopServer:(NSString *)shopOrServer compeletion:(void(^)(ShopServerResponse *response, NSError *error))block {
    //调用封装的post请求
    NSString * urlString = [NSString stringWithFormat:@"shop/recommends/%@",shopOrServer];
    
    return [[AFAppDotNetAPIClient sharedClient] GET:urlString parameters:nil compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            ShopServerResponse *response =[[ShopServerResponse alloc]initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }

    }];
}


/**
 * 商品详情
 */
+ (NSURLSessionDataTask *)goodsDetail:(NSString *)goodsId compeletion:(void(^)(GoodsDetailResponse *response, NSError *error))block {
    NSString * urlString = [NSString stringWithFormat:@"shop/goods/%@",goodsId];
    
    return [[AFAppDotNetAPIClient sharedClient] GET:urlString parameters:nil compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            GoodsDetailResponse *response =[[GoodsDetailResponse alloc]initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
        
    }];
}

/**
 *查看购物车
 */
+ (NSURLSessionDataTask *)lookGoodsCarCompeletion:(void(^)(GoodsCarResponse *response, NSError *error))block {
    
    NSString * urlString = @"shop/cart/items";
    NSDictionary * parame = @{@"passport":GET_USERINFO(USERINFO_PASSPORT)};
    
    return [[AFAppDotNetAPIClient sharedClient] GET:urlString parameters:parame compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            GoodsCarResponse *response =[[GoodsCarResponse alloc]initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
        
    }];
    
}

/**
 *添加购物车
 */
+ (NSURLSessionDataTask *)addGoodsCar:(NSString *)goodsId andParam:(NSMutableDictionary *)param Compeletion:(void(^)(CWBaseModel *response, NSError *error))block {
    //调用封装的post请求
    NSString * urlString = [NSString stringWithFormat:@"shop/cart/%@",goodsId];
    [param setObject:GET_USERINFO(USERINFO_PASSPORT) forKey:@"passport"];
    
    //调用封装的post请求
    return  [[AFAppDotNetAPIClient sharedClient] POST:urlString parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            CWBaseModel *response = [[CWBaseModel alloc] initWithDictionary:resultDict];
            //NSLog(@"denglu = %@",response);
            block(response, nil);
        }else {
            block(nil, error);
        }
    }];
}


/**
 *获取用户地址
 */
+ (NSURLSessionDataTask *)getUserAddressCompeletion:(void(^)(CarAddressResponse *response, NSError *error))block {

    NSString * urlString = @"shop/addresses";
    NSDictionary * parame = @{@"passport":GET_USERINFO(USERINFO_PASSPORT)};
    
    return [[AFAppDotNetAPIClient sharedClient] GET:urlString parameters:parame compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            CarAddressResponse *response =[[CarAddressResponse alloc]initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
        
    }];
}

/**
 *获取省市列表
 */
+ (NSURLSessionDataTask *)getProvincesCityCompeletion:(void(^)(cityListResponse *response, NSError *error))block {

    NSString * urlString = @"shop/provinces";
    
    return [[AFAppDotNetAPIClient sharedClient] GET:urlString parameters:nil compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            cityListResponse *response =[[cityListResponse alloc]initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
        
    }];
}


/**
 *添加收货地址
 */
+ (NSURLSessionDataTask *)addUserAddress:(CarAddressModel *)carAddress compeletion:(void(^)(CWBaseModel *response, NSError *error))block {
    NSString * urlString = @"shop/addresses";
    NSMutableDictionary *param = [@{@"provinceId":carAddress.provinceId,
                                    @"cityId":carAddress.cityId,
                                    @"contact":carAddress.contact,
                                    @"contactPhone":carAddress.contactPhone,
                                    @"contactAddress":carAddress.contactAddress,
                                    @"passport":GET_USERINFO(USERINFO_PASSPORT)}mutableCopy];
   
    return  [[AFAppDotNetAPIClient sharedClient] POST:urlString parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            CWBaseModel *response = [[CWBaseModel alloc] initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
    }];
}

/**
 *保险信息修改
 */
+ (NSURLSessionDataTask *)setInsuranceInfoWithLastCompulsoryTime:(NSString*)lastCompulsoryTime andLastInsuranceTime:(NSString*)lastInsuranceTime compeletion:(void (^)(CWBaseModel *response, NSError *error))block {
    NSDictionary *params = @{@"carId": GET_USERINFO(USERINFO_CAR_ID),@"passport": GET_USERINFO(USERINFO_PASSPORT),@"lastCompulsoryTime":lastCompulsoryTime,@"lastInsuranceTime":lastInsuranceTime};
    
    //调用封装的post请求
    return [[AFAppDotNetAPIClient sharedClient] POST:@"setInsuranceInfo" parameters:params compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            CWBaseModel *response = [[CWBaseModel alloc] initWithDictionary:resultDict];
            block(response, nil);
        }else {
            block(nil, error);
        }
    }];
}


/**
 *车辆检测
 */
+ (NSURLSessionDataTask *)fetchCarRealTimeError:(NSString *)carId compeletion:(void(^)(CarErrorListResponse *response, NSError *error))block {
    NSDictionary *params = @{@"carId": carId, @"passport": GET_USERINFO(USERINFO_PASSPORT)};
    
    //调用封装的get请求
    return [[AFAppDotNetAPIClient sharedClient] GET:@"carRealTimeError" parameters:params compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
//        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *resultDict = responseObject;
//            CarErrorListResponse *response = [[CarErrorListResponse alloc] initWithDictionary:resultDict];
//            block(response, nil);
//        }else {
//            block(nil, error);
//        }
        
        CarErrorListResponse *repon = [[CarErrorListResponse alloc]init];
        repon.code = 0;
        block(repon,nil);
    }];
    
}

@end
