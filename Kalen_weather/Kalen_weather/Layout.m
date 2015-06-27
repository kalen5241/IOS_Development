//
//  Layout.m
//  Kalen_weather
//
//  Created by tarena on 15/6/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Layout.h"
@interface Layout()
@end
@implementation Layout
+ (UILabel *)labelWithFrame:(CGRect)frame {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"HelveticalNeue-Light" size:30];
    return label;
}
@end
