//
//  EqualDivideVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/11.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "EqualDivideVC.h"
#import <Masonry.h>

@interface EqualDivideVC ()

@end

@implementation EqualDivideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 320, 200)];
    
    view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view];
    
    NSMutableArray *arr = [NSMutableArray array];
    
    UIView *temp = nil;
    for (int i = 0; i < 6; i++) {
        temp = [[UIView alloc]init];
        temp.backgroundColor = [UIColor redColor];
        [view addSubview:temp];
        [arr addObject:temp];
    }
    
    
    
    
    NSDictionary *attributes = @{
                                 @"space":@-3.2,
                                 @"top":@3.3,
                                 @"bottom":@-3.2,
                                 @"left":@5.5,
                                 @"right":@-5.4
                                 };
    
    
    [self divideView:view andSubViewArrar:arr andAttribute:attributes];
}

-(BOOL)divideView:(UIView *)view andSubViewArrar:(NSArray *)arr andAttribute:(NSDictionary *) attributes{
    
    __block NSDictionary * weakAttributes = attributes;
    
    __block float top = [weakAttributes[@"top"] floatValue];
    __block float bottom = [weakAttributes[@"bottom"] floatValue];
    __block float left = [weakAttributes[@"left"] floatValue];
    __block float right = [weakAttributes[@"right"] floatValue];
    __block float space = [weakAttributes[@"space"] floatValue];
    
    
    if (arr.count < 2) {
        NSLog(@"数组元素过少");
        return false;
    }else {
        
        UIView *last = nil;
        UIView *first = nil;
        UIView *temp = nil;
        
        for (int i = 0; i < arr.count; i++) {
            
            last  = (UIView *)arr[arr.count - 1];
            first = (UIView *)arr[0];
            
            if (i == 0) {
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(view.mas_bottom).offset(bottom);
                    make.left.equalTo(view.mas_left).offset(left);
                    make.right.equalTo(((UIView *)arr[1]).mas_left).offset(space);
                    make.width.equalTo(last);
                }];
            }else if (i == arr.count-1) {
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(view.mas_bottom).offset(bottom);
                    make.right.equalTo(view.mas_right).offset(right);
                    make.width.equalTo(first);
                }];
            }else {
                temp = (UIView *)arr[i+1];
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(view.mas_bottom).offset(bottom);
                    make.right.equalTo(temp.mas_left).offset(space);
                    make.width.equalTo(first);
                }];
            }
        }
        NSLog(@"将视图平分为%lu份",(unsigned long)arr.count);
        return true;
    }
}

@end
