//
//  TRCategory.h
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRCategory : NSObject
@property (nonatomic,strong) NSString* highlighted_icon;
@property (nonatomic,strong) NSString* small_highlighted_icon;
@property (nonatomic,strong) NSString* small_icon;
@property (nonatomic,strong) NSString* icon;
@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSArray* subcategories;

+(id)parseCategoryData:(NSDictionary *)dic;
@end
