//
//  ProductListResponse.h
//  YPJGFruit
//
//  Created by kalen on 15/11/20.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductListInType.h"
#import "Jastor.h"
@interface ProductListResponse : Jastor
@property (nonatomic, assign) int flag;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) ProductListInType  *list;
+ (Class)list_class;
@end
