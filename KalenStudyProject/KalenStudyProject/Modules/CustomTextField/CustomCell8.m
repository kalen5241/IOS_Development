//
//  CustomCell8.m
//  KalenStudyProject
//
//  Created by kalen on 16/3/4.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "CustomCell8.h"

@implementation CustomCell8

- (instancetype)init
{
    self = [super init];
    if (self) {
        [CustomCell8 customView:self.contentView];
    }
    return self;
}

+ (UIView *)customView:(UIView *)onView {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, 0, 100, 30);
    
    btn.backgroundColor = [UIColor redColor];
    
    [onView addSubview:btn];
    
    return onView;
}


@end
