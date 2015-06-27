//
//  TRHeaderView.h
//  Kalen_weather
//
//  Created by tarena on 15/6/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TRHeaderView : UIView
@property(nonatomic,strong) UILabel *cityLabel;
@property(nonatomic,strong) UILabel *temperatureLabel;
@property(nonatomic,strong) UILabel *hiloLabel;
@property(nonatomic,strong) UILabel *conditionsLabel;
@property(nonatomic,strong) UIImageView *iconView;

@end
