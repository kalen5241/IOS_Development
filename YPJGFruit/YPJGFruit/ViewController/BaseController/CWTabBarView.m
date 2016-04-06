//
//  CWTabBarView.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/2.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWTabBarView.h"

@implementation CWTabBarView


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
    
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60 * SCREEN_SCALE);
    self.backgroundColor = [UIColor whiteColor];
    UIView *lineV = [[UIView alloc]init];
    lineV.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1);
    lineV.backgroundColor = cwGreyColor;
    [self addSubview:lineV];
    
    _button1 = [[UIButton alloc]init];
    [self addSubview:_button1];
    
    _button2 = [[UIButton alloc]init];
    [self addSubview:_button2];
    
    _button3 = [[UIButton alloc]init];
    [self addSubview:_button3];
    
    _button4 = [[UIButton alloc]init];
    [self addSubview:_button4];
    
    _button5 = [[UIButton alloc]init];
    [self addSubview:_button5];
 
//    
//  
    CGFloat buttonW =28.0f;
    CGFloat space = (SCREEN_WIDTH - 40.0f - buttonW*5)/4.0f;
    CGFloat buttonY = (self.frame.size.height - buttonW - 15)/2;
    
    self.btns = [NSArray arrayWithObjects:_button1, _button2, _button3, _button4,_button5, nil];
    
    
    
    NSArray *buttonBGName = @[@"bar_home",@"bar_loveCar",@"bar_maintain",@"bar_find",@"bar_myAccount"];
    NSArray *buttonSeBGName = @[@"bar_home_se",@"bar_loveCar_se",@"bar_maintain_se",@"bar_find_se",@"bar_myAccount_se"];
    for (int i = 0; i < [self.btns count]; i++) {
        UIButton* btn = [self.btns objectAtIndex:i];
        btn.tag = i;
        
        //按钮的状态
        btn.frame = CGRectMake(20 + (buttonW + space) *i, buttonY, buttonW, buttonW);
        [btn setBackgroundImage:[UIImage imageNamed:[buttonBGName objectAtIndex:i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[buttonSeBGName objectAtIndex:i]] forState:UIControlStateSelected];
        
        UIButton *bigButton = [[UIButton alloc]init];
        bigButton.tag = i;
        bigButton.frame =CGRectMake(15 + (buttonW + space) *i, buttonY, buttonW+10, buttonW + 20);
        [self addSubview:bigButton];
        [self.bigButtonS addObject:bigButton];
        
        //字体
        UILabel *labelB = [[UILabel alloc]init];
        labelB.frame = CGRectMake(20 + (buttonW + space) *i, buttonY + buttonW , buttonW, 15);
        labelB.text = [labelTextA objectAtIndex:i];
        [self addSubview:labelB];
        labelB.font = cwFont(11);
        labelB.textAlignment = NSTextAlignmentCenter;
        labelB.textColor = [UIColor colorWithSevenCFontColor];
        [self.labelS addObject:labelB];
        
    }

}


- (void)addBtnsTarget:(id)aTarget action:(SEL)aAction {
    for (int i = 0; i < [self.btns count]; i++) {
        UIButton* btn = [self.btns objectAtIndex:i];
        [btn addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *bigButton = [self.bigButtonS objectAtIndex:i];
        [bigButton addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)selectedBtn:(NSInteger)aIndex {
    for (int i = 0; i < [self.btns count]; i++) {
        UIButton* btn = [self.btns objectAtIndex:i];
        btn.selected = (i == aIndex);
        
        UILabel *lab = [self.labelS objectAtIndex:i];
    
        if (i == aIndex) {
            lab.textColor = [UIColor colorWithFourTwoButtonColor];

        }else {
          lab.textColor = [UIColor colorWithSevenCFontColor];
            
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
