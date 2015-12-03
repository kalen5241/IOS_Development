//
//  ErrorDepositeViewController.h
//  KalenStudyProject
//
//  Created by kalen on 15/11/12.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ErrorDepositeViewController : UIViewController

/**
 * 测试try catch finally
 * @param  msg      测试字符串
 */
- (void)errorDeposite:(NSString *)str;



/**
 * 去除字典中有value为 <null> 的key,并返回新的字典
 * @param  msg      可能含有value为 <null>的字典
 */
- (NSDictionary *)dictionaryNullDeposit:(NSDictionary *)dic;

/**
 * 获取对象的属性及属性值
 * @param  de       需要获取信息的对象
 */
- (NSDictionary *)properties_aps:(id)de;

@end
