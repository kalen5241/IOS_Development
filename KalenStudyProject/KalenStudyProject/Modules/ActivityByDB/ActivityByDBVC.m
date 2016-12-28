//
//  ActivityByDBVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/12/28.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ActivityByDBVC.h"
#import "DBTool.h"
#import "FMDatabaseQueue.h"

#define DB_CAR_STORE @"db_car_store"
#define DB_CAR_TYPE @"db_car_type"

typedef NSNumber* (^ParaBlock)(NSNumber *a,NSArray *arr);

@interface ActivityByDBVC ()
@property (nonatomic, strong) NSDictionary *db_car_store;
@property (nonatomic, strong) NSDictionary *db_car_type;

@property (nonatomic, strong) FMDatabase *cwdb;
@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

@end

@implementation ActivityByDBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self type_Operate];
    [self store_Operate];
}


- (void)store_Operate {
    
    NSMutableDictionary *mdictData = [NSMutableDictionary dictionary];
    NSMutableDictionary *mdictType = [NSMutableDictionary dictionary];
    
    [mdictData setObject:@"首汽腾鹏" forKey:@"car_store_name"];
    [mdictData setObject:@"北京" forKey:@"car_store_address"];
    [mdictData setObject:@"13260480543" forKey:@"car_store_phone"];
    [mdictType setObject:@"text" forKey:@"car_store_name"];
    [mdictType setObject:@"text" forKey:@"car_store_address"];
    [mdictType setObject:@"text" forKey:@"car_store_phone"];
    
    [self insertData:[mdictData copy] toTable:DB_CAR_STORE];
    [self insertData:[mdictData copy] toTable:DB_CAR_STORE];
    [self insertData:[mdictData copy] toTable:DB_CAR_STORE];
    
    [self showTableName:DB_CAR_STORE colum:@"car_store_id" dataType:mdictType];
    
    NSArray* temps = [[DBTool tool] DataBase:self.cwdb
                              selectKeyTypes:[mdictType copy]
                                   fromTable:DB_CAR_STORE
                              whereCondition:@{@"car_store_id":@"1"}
                                andOperation:@">"];
    NSLog(@"%@",temps);
}


- (void)type_Operate {
    
    NSMutableDictionary *mdictData = [NSMutableDictionary dictionary];
    NSMutableDictionary *mdictType = [NSMutableDictionary dictionary];
    
    [mdictData setObject:@"大众" forKey:@"car_firm"];
    [mdictData setObject:@"一汽大众" forKey:@"car_brand"];
    [mdictData setObject:@"速腾" forKey:@"car_type_name"];
    [mdictData setObject:@"1.4T" forKey:@"car_displacement"];
    
    [mdictType setObject:@"text" forKey:@"car_firm"];
    [mdictType setObject:@"text" forKey:@"car_brand"];
    [mdictType setObject:@"text" forKey:@"car_type_name"];
    [mdictType setObject:@"text" forKey:@"car_displacement"];
    
    
    [self insertData:[mdictData copy] toTable:DB_CAR_TYPE];
    [self insertData:[mdictData copy] toTable:DB_CAR_TYPE];
    [self insertData:[mdictData copy] toTable:DB_CAR_TYPE];
    
    [self showTableName:DB_CAR_TYPE colum:@"car_id" dataType:mdictType];
    
    NSArray* temps = [[DBTool tool] DataBase:self.cwdb
                              selectKeyTypes:[mdictType copy]
                                   fromTable:DB_CAR_TYPE
                              whereCondition:@{@"car_id":@"1"}
                                andOperation:@">"];
    NSLog(@"%@",temps);
}

#pragma mark --创建数据库
-(id)init {
    
    self = [super init];
    if (self) {
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *fullPath =  [path stringByAppendingPathComponent:@"CWDB.db"];
        self.dbQueue = [FMDatabaseQueue databaseQueueWithPath:fullPath];
        [self creatTable:self.cwdb];
    }
    return self;
}

#pragma mark --创建表
-(void) creatTable:(FMDatabase *)db {
    
    [[DBTool tool] DataBase:db createTable:DB_CAR_STORE keyTypes:self.db_car_store];
    [[DBTool tool] DataBase:db createTable:DB_CAR_TYPE keyTypes:self.db_car_type];
    
}

#pragma mark --插入数据
-(void)insertData:(NSDictionary *)dict toTable:(NSString *)tableName {
    
    if ([self.cwdb open]) {
        [[DBTool tool] DataBase:self.cwdb insertKeyValues:dict intoTable:tableName];
    }
}


#pragma mark --LazyLoad
- (NSDictionary *)db_car_store {
    
    if (!_db_car_store) {
        _db_car_store = @{
                          @"car_store_name":@"text",                 //经销商名称
                          @"car_store_address":@"text",              //经销商地址
                          @"car_store_phone":@"text",                //经销商电话
                          @"car_store_id":@"integer Primary key"     //经销商编号
                          };
    }
    return _db_car_store;
}

- (NSDictionary *)db_car_type {
    
    if (!_db_car_type) {
        _db_car_type = @{
                         @"car_firm":@"text",                   //厂商
                         @"car_brand":@"text",                  //品牌
                         @"car_type_name":@"text",              //车型
                         @"car_displacement":@"text",           //排量
                         @"car_id":@"integer Primary key"       //车辆编号
                         };
    }
    
    return _db_car_type;
}

- (FMDatabase *)cwdb {
    
    if (!_cwdb) {
        _cwdb = [[DBTool tool] getDBWithDBName:@"CWDB.db"];
    }
    return _cwdb;
}

-(void)showTableName:(NSString *)tableName colum:(NSString *)columName dataType:(NSDictionary *)dict {
    
    __block NSArray *temps = nil;
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        temps = [[DBTool tool] DataBase:db
                         selectKeyTypes:dict
                              fromTable:tableName
                         whereCondition:@{columName:@"1"}
                           andOperation:@"="];
    }];
    if (temps.count == 0 ) {
        return;
    }
    
    NSDictionary *temp = (NSDictionary *)temps[0];
    if (dict.count > 0) {
        NSLog(@"数据库内容:%@",temp);
    }else {
        return;
    }
}

@end
