//
//  YPResponse.m
//  YPJGFruit
//
//  Created by kalen on 15/11/15.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "YPResponse.h"
#import "YPModel.h"
@implementation YPResponse
+ (Class)list_class {
    return [YPModel class];
}
@end
