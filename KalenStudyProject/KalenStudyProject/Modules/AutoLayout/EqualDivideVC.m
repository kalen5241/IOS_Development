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
@property (nonatomic,strong) UIView *HFirst;
@property (nonatomic,strong) UIView *HLast;
@property (nonatomic,strong) UIView *HSecond;
@property (nonatomic,strong) UIView *HView;
@property (nonatomic,strong) UIView *HView1;
@property (nonatomic,strong) UIView *VFirst;
@property (nonatomic,strong) UIView *VLast;
@property (nonatomic,strong) UIView *VSecond;
@property (nonatomic,strong) NSDictionary *dic;

@end

@implementation EqualDivideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 320, 200)];
    
    view.backgroundColor = [UIColor yellowColor];
    self.HView = view;
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
    
    self.dic = attributes;
    
    [self divideView:view andSubViewArrar:arr andAttribute:attributes];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 264, 320, 200)];
    
    view1.backgroundColor = [UIColor yellowColor];
    self.HView1 = view1;
    [self.view addSubview:view1];
   arr = [NSMutableArray array];
    
  
    for (int i = 0; i < 6; i++) {
        temp = [[UIView alloc]init];
        temp.backgroundColor = [UIColor redColor];
        [view1 addSubview:temp];
        [arr addObject:temp];
    }

    [self divideVerticalView:view1 andSubViewArrar:arr andAttribute:attributes];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(0, 464, 320, 50);
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(change:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn1.frame = CGRectMake(0, 514, 320, 50);
    btn1.backgroundColor = [UIColor yellowColor];
    [btn1 addTarget:self action:@selector(change1:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn1];
}


- (void)change:(UIButton *)sender {
    
    __block NSDictionary * weakAttributes = self.dic;
    
    __block float top = [weakAttributes[@"top"] floatValue];
    __block float bottom = [weakAttributes[@"bottom"] floatValue];
    __block float left = [weakAttributes[@"left"] floatValue];
    __block float right = [weakAttributes[@"right"] floatValue];
    __block float space = [weakAttributes[@"space"] floatValue];
    
    
    [self.HFirst mas_remakeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.HView.mas_top).offset(top);
        make.bottom.equalTo(self.HView.mas_bottom).offset(bottom);
        make.left.equalTo(self.HView.mas_left).offset(35);
        make.right.equalTo(self.HSecond.mas_left).offset(space);
        make.width.equalTo(self.HLast);
    }];
    
    [self.HLast mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.HView.mas_top).offset(top);
        make.bottom.equalTo(self.HView.mas_bottom).offset(bottom);
        make.right.equalTo(self.HView.mas_right).offset(-35);
        make.width.equalTo(self.HFirst);
    }];
}


- (void)change1:(UIButton *)sender {
    
    __block NSDictionary * weakAttributes = self.dic;
    
    __block float top = [weakAttributes[@"top"] floatValue];
    __block float bottom = [weakAttributes[@"bottom"] floatValue];
    __block float left = [weakAttributes[@"left"] floatValue];
    __block float right = [weakAttributes[@"right"] floatValue];
    __block float space = [weakAttributes[@"space"] floatValue];
    
    
    [self.VFirst mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.HView1.mas_top).offset(30);
        make.bottom.equalTo(self.VSecond.mas_top).offset(space);
        make.left.equalTo(self.HView1.mas_left).offset(left);
        make.right.equalTo(self.HView1.mas_right).offset(right);
        make.height.equalTo(self.VLast);
    }];
    
    [self.VLast mas_remakeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(self.HView1.mas_bottom).offset(-30);
        make.right.equalTo(self.HView1.mas_right).offset(right);
        make.left.equalTo(self.HView1.mas_left).offset(left);
        make.height.equalTo(self.VFirst);
    }];

}

//水平平分布局
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
        UIView *second = nil;
        UIView *temp = nil;
        
        for (int i = 0; i < arr.count; i++) {
            
            last  = (UIView *)arr[arr.count - 1];
            self.HLast = last;
            first = (UIView *)arr[0];
            self.HFirst = first;
            second = (UIView *)arr[1];
            self.HSecond = second;
            
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


//竖直平分布局
-(BOOL)divideVerticalView:(UIView *)view andSubViewArrar:(NSArray *)arr andAttribute:(NSDictionary *) attributes{
    
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
        UIView *second = nil;
        UIView *temp = nil;
        
        for (int i = 0; i < arr.count; i++) {
            
            last  = (UIView *)arr[arr.count - 1];
            self.VLast = last;
            first = (UIView *)arr[0];
            self.VFirst = first;
            second = (UIView *)arr[1];
            self.VSecond = second;
            
            if (i == 0) {
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(((UIView *)arr[1]).mas_top).offset(space);
                    make.left.equalTo(view.mas_left).offset(left);
                    make.right.equalTo(view.mas_right).offset(right);
                    make.height.equalTo(last);
                }];
            }else if (i == arr.count-1) {
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    //make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(view.mas_bottom).offset(bottom);
                    make.right.equalTo(view.mas_right).offset(right);
                    make.left.equalTo(view.mas_left).offset(left);
                    make.height.equalTo(first);
                }];
            }else {
                temp = (UIView *)arr[i+1];
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    //make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(temp.mas_top).offset(space);
                    make.right.equalTo(view.mas_right).offset(right);
                    make.left.equalTo(view.mas_left).offset(left);
                    make.height.equalTo(first);
                }];
            }
        }
        NSLog(@"将视图平分为%lu份",(unsigned long)arr.count);
        return true;
    }
}

@end
