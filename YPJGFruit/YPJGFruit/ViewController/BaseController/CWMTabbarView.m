//
//  CWMTabbarView.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/8.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWMTabbarView.h"

 

@interface CWMTabbarView()
@property (nonatomic, strong) NSArray *imageNormalS;
@property (nonatomic, strong) NSArray *imageSelectedS;
@end

@implementation CWMTabbarView


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    //创建五个label
    
    NSArray *labelTextA = @[@"首页",@"爱车",@"保养",@"发现",@"我的"];
    self.labelS = [NSMutableArray array];
    self.bigButtonS = [NSMutableArray array];
    self.btns = [NSMutableArray array];
    self.imageNormalS = @[@"bar_home",@"bar_loveCar",@"bar_maintain",@"bar_find",@"bar_myAccount"];
    self.imageSelectedS = @[@"bar_home_se",@"bar_loveCar_se",@"bar_maintain_se",@"bar_find_se",@"bar_myAccount_se"];
    
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60 * SCREEN_SCALE);
    self.backgroundColor = [UIColor whiteColor];
    UIView *lineV = [[UIView alloc]init];
    lineV.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1);
    lineV.backgroundColor = cwGreyColor;
    [self addSubview:lineV];
    
    
    NSMutableArray *viewArray = [NSMutableArray array];
    for (int i=0; i < 5 ; i ++) {
        
        UIView *view = [[UIView alloc]init];
        [self addSubview:view];
        
        
        UIImageView * imageV = [[UIImageView alloc]init];
        [view addSubview:imageV];
        imageV.image = [UIImage imageNamed:[self.imageNormalS objectAtIndex:i]];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        [self.btns addObject:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_top).offset(5);
            make.centerX.equalTo(view.mas_centerX);
            make.height.width.equalTo(@28);
        }];
        
        
        UIButton *bigButton = [[UIButton alloc]init];
        bigButton.tag = i;
        //        bigButton.backgroundColor = [UIColor redColor];
        [view addSubview:bigButton];
        [self.bigButtonS addObject:bigButton];
        
        [bigButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_top);
            make.bottom.equalTo(view.mas_bottom);
            make.centerX.equalTo(view.mas_centerX);
            make.width.equalTo(@40);
        }];
        
        
        //字体
        UILabel *labelB = [[UILabel alloc]init];
        labelB.text = [labelTextA objectAtIndex:i];
        [view addSubview:labelB];
        labelB.font = cwFont(12);
        labelB.textAlignment = NSTextAlignmentCenter;
        labelB.textColor = [UIColor colorWithSevenCFontColor];
        [self.labelS addObject:labelB];
        [labelB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageV.mas_bottom).offset(0);
            make.centerX.equalTo(view.mas_centerX);
            make.width.equalTo(imageV);
            make.height.equalTo(@15);
        }];
        
        
        [viewArray addObject:view];
    }
    
//    NSDictionary *dicImage =@{
//                              @"space":@0,
//                              @"top":@0,
//                              @"bottom":@-0,
//                              @"left":@0,
//                              @"right":@-0
//                              };
    [CWUtil divideView:self andSubViewArrar:viewArray andAttribute:nil];
    
    
}


- (void)addBtnsTarget:(id)aTarget action:(SEL)aAction {
    for (int i = 0; i < [self.btns count]; i++) {
        
        UIButton *bigButton = [self.bigButtonS objectAtIndex:i];
        [bigButton addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)selectedBtn:(NSInteger)aIndex {
    for (int i = 0; i < [self.btns count]; i++) {
        
        UILabel *lab = [self.labelS objectAtIndex:i];
        
        UIImageView *imageV = [self.btns objectAtIndex:i];
        
        if (i == aIndex) {
            lab.textColor = [UIColor colorWithFourTwoButtonColor];
            imageV.image = [UIImage imageNamed:[self.imageSelectedS objectAtIndex:i]];
            
        }else {
            lab.textColor = [UIColor colorWithSevenCFontColor];
            imageV.image = [UIImage imageNamed:[self.imageNormalS objectAtIndex:i]];
        }
    }
}

@end
