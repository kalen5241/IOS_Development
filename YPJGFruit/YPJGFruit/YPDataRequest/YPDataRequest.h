//
//  YPDataRequest.h
//  YPJGFruit
//
//  Created by kalen on 15/11/15.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <UIKit+AFNetworking.h>
#import "YPResponse.h"
#import "AFAppDotNetAPIClient.h"
#import "ProductListResponse.h"

@interface YPDataRequest : NSObject


+ (NSURLSessionDataTask *)fetchProductType:(NSDictionary *)params Compeletion:(void(^)(YPResponse *response, NSError *error))block;

+ (NSURLSessionDataTask *)fetchFruitList:(NSDictionary *)param Compeletion:(void(^)(ProductListResponse *response, NSError *error))block;

@end


