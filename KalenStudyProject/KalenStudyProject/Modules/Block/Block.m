//
//  Block.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/14.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "Block.h"

@interface Block ()

@end

@implementation Block

- (void)viewDidLoad {
    [super viewDidLoad];

    [self click:^NSString *(NSString *temp) {
        return [temp stringByAppendingString:@"nice"];
    }];
    
}

// 步骤1 创建类 - 声明block类型 - 创建以block为参数的方法 - 在方法中为block准备参数（在block的定义阶段可以使用这个参数） - block执行：在方法中为block传参调用执行block - 在其它类中创建实例 - 调用含block的方法 - 定义block：完成block的方法实现 利用从方法中获得的block的参数，完成逻辑 - 完成方法

- (void)click:(myBlock)block {
    
    NSString *name = @"kalen";
    
    NSString *result = block(name);
    
    NSLog(@"%@",result);
}

@end
