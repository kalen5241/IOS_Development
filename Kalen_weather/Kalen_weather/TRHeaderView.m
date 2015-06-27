//
//  TRHeaderView.m
//  Kalen_weather
//
//  Created by tarena on 15/6/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRHeaderView.h"
#import "Layout.h"
static CGFloat statusBarHeight = 30;
static CGFloat inset = 30;
static CGFloat cityLabelHeight = 30;
static CGFloat iconViewHeight = 30;
static CGFloat temperatureLabelHeight= 60;
static CGFloat hiloLabelHeight = 30;
static CGFloat conditionsLabelHeight = 30;

@implementation TRHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        
        CGRect iconViewFrasme = CGRectMake(inset,230, iconViewHeight, iconViewHeight);
        self.iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"weather-few.png"]];
        self.iconView.frame = iconViewFrasme;
        [self addSubview:self.iconView];
        
        
        CGRect cityLabelFrame = CGRectMake(0, statusBarHeight, self.frame.size.width, cityLabelHeight);
        self.cityLabel = [Layout labelWithFrame:cityLabelFrame];
        self.cityLabel.textColor = [UIColor whiteColor];
        self.cityLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:self.cityLabel];
        
        CGRect temperatureLabelFrame = CGRectMake(inset, self.iconView.frame.origin.y+iconViewHeight, (self.frame.size.width-2*inset)/2.0, temperatureLabelHeight);
        self.temperatureLabel = [Layout labelWithFrame:temperatureLabelFrame];
        self.temperatureLabel.textColor = [UIColor whiteColor];
        self.temperatureLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:self.temperatureLabel];
        
        
        CGRect hiloLabelFrame = CGRectMake(inset, self.iconView.frame.origin.y + iconViewHeight+temperatureLabelHeight, self.frame.size.width-2*inset, hiloLabelHeight);
        self.hiloLabel = [Layout labelWithFrame:hiloLabelFrame];
        self.hiloLabel.textColor = [UIColor whiteColor];
        self.hiloLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.hiloLabel];
        
        
        
        CGRect conditionsLabelFrame = CGRectMake(inset+iconViewHeight, self.iconView.frame.origin.y
                                                 , self.frame.size.width-2*inset-iconViewHeight, conditionsLabelHeight);
        
        self.conditionsLabel =[Layout labelWithFrame:conditionsLabelFrame];
        self.conditionsLabel.textColor = [UIColor whiteColor];
        self.conditionsLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:self.conditionsLabel];


    }
    return self;
}
@end
