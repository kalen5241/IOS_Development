//
//  ProductListInType.h
//  YPJGFruit
//
//  Created by kalen on 15/11/20.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
#import "FruitInfoModel.h"
@interface ProductListInType : Jastor

@property (nonatomic,strong) NSString *p_id;
@property (nonatomic,strong) NSString *p_type;
@property (nonatomic,strong) NSString *f_id;
@property (nonatomic,strong) NSString *s_id;
@property (nonatomic,strong) NSString *s_desc;
@property (nonatomic,strong) NSString *num;
@property (nonatomic,strong) NSString *p_sell;
@property (nonatomic,strong) NSString *p_now;
@property (nonatomic,strong) NSString *p_active;
@property (nonatomic,strong) NSString *active_id;
@property (nonatomic,strong) FruitInfoModel *fruit_info;
@end
