//
//  TRMeataTool.m
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMeataTool.h"
#import "TRCategory.h"
#import "TRCities.h"
#import "TRSorts.h"
#import "TRCityGroup.h"
static NSArray *categories = nil;
static NSArray *cities = nil;
static NSArray *sorts =nil;
static NSArray *cityGroup = nil;
@implementation TRMeataTool
//返回分类数组
+(NSArray *)categories{
    if (!categories) {
        categories = [[self alloc]getAndParseCategoryFile:@"categories.plist"];
    }
    return categories;
}

+(NSArray *)cities{
    if (!cities) {
        cities = [[self alloc] getAndParseCityFile:@"cities.plist"];
    }
    return cities;
}

+(NSArray *)sorts{
    if (!sorts) {
        sorts = [[self alloc] getAndParseSortFile:@"sorts.plist"];
    }
    return sorts;
}

+(NSArray *)cityGroup{
    if (!cityGroup) {
        cityGroup = [[self alloc] getAndParseCityGroupFile:@"cityGroups.plist"];
    }
    return cityGroup;
}

-(NSArray *)getAndParseCategoryFile:(NSString *)name{
    NSString *categoriesPath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:categoriesPath];
    NSMutableArray *mutArray = [[NSMutableArray alloc]init];
    for (NSDictionary * dic in dataArray) {
        TRCategory *categorie = [TRCategory parseCategoryData:dic];
        [mutArray addObject:categorie];
    }
    return [mutArray copy];
}

-(NSArray *)getAndParseCityFile:(NSString *)name{
    NSString *cityPath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:cityPath];
    NSMutableArray *mutArray = [[NSMutableArray alloc]init];
    for (NSDictionary * dic in dataArray) {
        TRCities *city = [TRCities parseCityData:dic];
        [mutArray addObject:city];
    }
    return [mutArray copy];
}

-(NSArray *)getAndParseSortFile:(NSString *)name{
    NSString *sortPath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:sortPath];
    NSMutableArray *mutArray = [[NSMutableArray alloc]init];
    for (NSDictionary * dic in dataArray) {
        TRSorts *sort = [TRSorts parseSortData:dic];
        [mutArray addObject:sort];
    }
    return [mutArray copy];
}

-(NSArray *)getAndParseCityGroupFile:(NSString *)name{
    NSString *cityGroupPath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:cityGroupPath];
    NSMutableArray *mutArray = [[NSMutableArray alloc]init];
    for (NSDictionary * dic in dataArray) {
        TRCityGroup *group = [TRCityGroup parseCityGroupData:dic];
        [mutArray addObject:group];
    }
    return [mutArray copy];
}

@end
