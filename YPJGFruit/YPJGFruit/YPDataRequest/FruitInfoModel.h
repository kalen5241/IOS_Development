//
//  FruitInfoModel.h
//  YPJGFruit
//
//  Created by kalen on 15/11/20.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
@interface FruitInfoModel : Jastor
@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *pic;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *desc;
@property (nonatomic,strong) NSString *place;
@property (nonatomic,strong) NSString *channel;
@property (nonatomic,strong) NSString *day;
@property (nonatomic,strong) NSString *save_path;
@property (nonatomic,strong) NSString *method;
@property (nonatomic,strong) NSString *nutritive;
@property (nonatomic,strong) NSString *people;
@property (nonatomic,strong) NSString *unable;
@property (nonatomic,strong) NSString *selection;
@property (nonatomic,strong) NSString *details;
@end
