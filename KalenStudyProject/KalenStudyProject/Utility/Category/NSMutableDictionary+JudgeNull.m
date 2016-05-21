//
//  NSMutableDictionary+JudgeNull.m
//  CarSecretary
//
//  Created by wenjuan on 15/11/16.
//  Copyright © 2015年 Chewen. All rights reserved.
//

#import "NSMutableDictionary+JudgeNull.h"

@implementation NSMutableDictionary (JudgeNull)

/**
 * 处理网络返回字典中value为<null> 的情况
 * @param  dictionary  网络返回的字典
 */
+ (NSMutableDictionary *) dictionaryWithDictionaryJudgeNull:(NSDictionary *)dictionary {
    
    NSMutableDictionary * muDic = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    
    for (NSString *key in [muDic allKeys]) {
        if ([muDic objectForKey:key] == [NSNull null]) {
            [muDic removeObjectForKey:key];
        }
    }
    return muDic;
}
@end
