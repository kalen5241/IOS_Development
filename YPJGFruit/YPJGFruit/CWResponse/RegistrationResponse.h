//
//  RegistrationResponse.h
//  CarSecretary
//
//  Created by Robin on 15/9/24.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import "CWBaseModel.h"
 
#pragma mark - RegistrationModel
@interface RegistrationModel : Jastor

@property (nonatomic, copy) NSString *obdCarId;

@end


#pragma mark - RegistrationResponse
@interface RegistrationResponse : CWBaseModel

@property (nonatomic, strong) RegistrationModel *data;

@end


#pragma mark - RegistrationParam
@interface RegistrationParam : NSObject

@property (nonatomic, copy) NSString *licenseNum;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *phoneNum;

@property (nonatomic, copy) NSString *vcode;

@property (nonatomic, copy) NSString *inviteCode;

@end