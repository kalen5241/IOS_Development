//
//  ErrorDepositeViewController.m
//  KalenStudyProject
//
//  Created by kalen on 15/11/12.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "ErrorDepositeViewController.h"
#import <objc/runtime.h>

@interface ErrorDepositeViewController ()
@property (nonatomic,strong) NSString *str;
@end

@implementation ErrorDepositeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.str = @"111";
    
    [self errorDeposite:@"kalen"];
    
    
}

/**
 *  去除字典中有value为 <null> 的key,并返回新的字典
 *
 *  @param NSDictionary 可能含有null的字典
 *
 *  @return 去除了value为空的对应key的字典
 */

//
- (NSDictionary *)dictionaryNullDeposit:(NSDictionary *)dic {
    NSMutableDictionary *userInfo = [NSMutableDictionary
                                     dictionaryWithDictionary:dic];
    
    for (NSString *key in [userInfo allKeys]) {
        if ([userInfo objectForKey:key] == [NSNull null]) {
            [userInfo removeObjectForKey:key];
        }
    }
    return userInfo;
}
/**
 *  传入对象返回对象所具有的属性
 *
 *  @param de 对象
 *
 *  @return 包含对象属性名和对应属性值的字典
 */
- (NSDictionary *)properties_aps:(id)de

{
    
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList([de class], &outCount);
    
    for (i = 0; i<outCount; i++)
        
    {
        
        objc_property_t property = properties[i];
        
        const char* char_f =property_getName(property);
        
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        NSLog(@"属性名:%@",propertyName);
        
        id propertyValue = [de valueForKey:(NSString *)propertyName];
        NSLog(@"属性值为:%@",propertyValue);
        
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
        
    }   
    
    free(properties);   
    
    return props;   
    
}

/**
 *  try catch测试
 *
 *  @param str 测试字符串
 */
- (void)errorDeposite:(NSString *)str {
    @try {
        NSLog(@"try");
        [self.str substringFromIndex:111];
    }
    @catch (NSException *exception) {
        NSLog(@"捕获到异常发生时执行的代码");
    }
    @finally {
        NSLog(@"无论是否有异常均执行的代码");
    }
}


@end
