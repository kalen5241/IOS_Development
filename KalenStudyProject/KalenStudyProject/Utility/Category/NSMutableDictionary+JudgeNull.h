//
//  NSMutableDictionary+JudgeNull.h
//  CarSecretary
//
//  Created by wenjuan on 15/11/16.
//  Copyright © 2015年 Chewen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (JudgeNull)

/**
 * 处理网络返回字典中value为<null> 的情况
 * @param  dictionary  网络返回的字典
 */
+ (NSMutableDictionary *) dictionaryWithDictionaryJudgeNull:(NSDictionary *)dictionary;


@end
