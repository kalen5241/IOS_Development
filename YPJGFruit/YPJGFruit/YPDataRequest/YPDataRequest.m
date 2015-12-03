//
//  YPDataRequest.m
//  YPJGFruit
//
//  Created by kalen on 15/11/15.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "YPDataRequest.h"

@implementation YPDataRequest


+ (NSURLSessionDataTask *)fetchProductType:(NSDictionary *)params Compeletion:(void(^)(YPResponse *response, NSError *error))block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"index.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            YPResponse *response = [[YPResponse alloc] initWithDictionary:resultDict];
            block(response, nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil, error);
    }];
}


+ (NSURLSessionDataTask *)fetchFruitList:(NSDictionary *)params Compeletion:(void(^)(ProductListResponse *response, NSError *error))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"index.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            ProductListResponse *response = [[ProductListResponse alloc] initWithDictionary:resultDict];
        block(response, nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil, error);
    }];
}

@end
