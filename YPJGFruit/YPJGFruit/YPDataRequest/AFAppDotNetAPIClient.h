//
//  AFAppDotNetAPIClient.h
//  CarSecretary
//
//  Created by kalen on 15/7/30.
//  Copyright (c) 2015年 Chewen. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import <Foundation/Foundation.h>

@interface AFAppDotNetAPIClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end
