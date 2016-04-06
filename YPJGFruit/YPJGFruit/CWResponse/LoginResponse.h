//
//  LoginResponse.h
//  CarSecretary
//
//  Created by kalen on 15/7/29.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import "CWBaseModel.h"

#pragma mark - LoginInfo

@interface LoginInfo : Jastor
@property (nonatomic, copy) NSString *adminPhone;

@property (nonatomic, copy) NSString *zxTel;

@property (nonatomic, copy) NSString *passport;

@property (nonatomic, copy) NSString *carId;

@property (nonatomic, copy) NSString *logo;

@property (nonatomic, copy) NSString *phoneNum;

@property (nonatomic, copy) NSString *adminId;

@property (nonatomic, copy) NSString *bxTel;

@property (nonatomic, copy) NSString *adminName;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *jyTel;

@property (nonatomic, copy) NSString *needUpdateHead;

@property (nonatomic, copy) NSString *hasOBD;

@property (nonatomic, copy) NSString *hasCarType;

//车牌号
@property (nonatomic, copy) NSString *licenseNum;

//我的OBD
@property (nonatomic, copy) NSString *obdNum; //obd编码

@property (nonatomic, copy) NSString *obdStatus; //obd状态

@end


#pragma mark - LoginResponse

@interface LoginResponse : CWBaseModel
@property (nonatomic,strong) LoginInfo *data;
@end


#pragma mark - LoginParam
@interface LoginParam : Jastor

@property (nonatomic, strong) NSString *phoneNum;

@property (nonatomic, strong) NSString *password;

@property (nonatomic, strong) NSString *token;

@end
