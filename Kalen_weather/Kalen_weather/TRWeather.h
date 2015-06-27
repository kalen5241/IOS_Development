//
//  TRWeather.h
//  Kalen_weather
//
//  Created by tarena on 15/6/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRWeather : NSObject
@property (nonatomic, strong) NSString *cityName;//城市名称
@property (nonatomic, strong) NSURL *iconURL;//天气图标的URL地址
@property (nonatomic ,strong) NSString *iconName;
@property (nonatomic, strong) NSString *weatherDesc;//天气描述

@property (nonatomic, assign) float temp;//当前温度
@property (nonatomic, assign) float maxTemp;//最高温
@property (nonatomic, assign) float minTemp;//最低温
@property (nonatomic, strong) NSString *hourly;//小时点数
@property (nonatomic, strong) NSDate *date;//日期-字符串
@property (nonatomic, assign) float time;

@property (nonatomic,strong) NSArray *dailyArray;
@property (nonatomic,strong) NSArray *hourlyArray;

+(instancetype)sharedWeatherData;
+(NSDictionary *)imageMap;

@end
