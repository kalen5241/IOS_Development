//
//  TestVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/23.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "DBTestVC.h"
#import "DBTool.h"
#import "FMDatabaseQueue.h"

#define DATA_TABLE_OS @"db_obd_os"

typedef NSNumber* (^ParaBlock)(NSNumber *a,NSArray *arr);

@interface DBTestVC ()
@property (nonatomic, strong) NSDictionary *os_dict;
@property (nonatomic, strong) FMDatabase *cwdb;
@property (nonatomic, strong) FMDatabaseQueue *dbQueue;
@end

@implementation DBTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *mdictData = [NSMutableDictionary dictionary];
    NSMutableDictionary *mdictType = [NSMutableDictionary dictionary];
    
    [mdictData setObject:[NSNumber numberWithFloat:0.5] forKey:@"map"];
    [mdictData setObject:[NSDate date] forKey:@"recetime"];
    [mdictType setObject:@"text" forKey:@"map"];
    [mdictType setObject:@"date" forKey:@"recetime"];
    
    [self insertData:[mdictData copy] toTable:DATA_TABLE_OS];
    [self insertData:[mdictData copy] toTable:DATA_TABLE_OS];
    [self insertData:[mdictData copy] toTable:DATA_TABLE_OS];
    
    [self checkAndInsert:[mdictType copy] andTableName:DATA_TABLE_OS andData:[mdictData copy]];
    [self changeAndInsert:[mdictType copy] andTableName:DATA_TABLE_OS andData:[mdictData copy] andBlock:^NSNumber *(NSNumber *a, NSArray *arr) {
        return a;
    }];
    
    [self showRTData:mdictType];
    
    NSArray* temps = [[DBTool tool] DataBase:self.cwdb
                     selectKeyTypes:[mdictType copy]
                          fromTable:DATA_TABLE_OS
                     whereCondition:@{@"id":@"1"}
                       andOperation:@">"];
    NSLog(@"%@",temps);
}


#pragma mark --init

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



#pragma mark --指标入库
-(void) creatTable:(FMDatabase *)db {
    
    [[DBTool tool] DataBase:db createTable:DATA_TABLE_OS keyTypes:self.os_dict];
}

//插入数据
-(void)insertData:(NSDictionary *)dict toTable:(NSString *)tableName {
    
    if ([self.cwdb open]) {
        [[DBTool tool] DataBase:self.cwdb insertKeyValues:dict intoTable:tableName];
    }
}

//存在记录修改，不存在数据新建记录
-(void)changeAndInsert:(NSDictionary *)selectType andTableName:(NSString *)tableName andData:(NSDictionary *)data andBlock:(ParaBlock)block {
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        NSArray  *arr  = [[DBTool tool] DataBase:db
                                  maxSelectKeyTypes:selectType
                                          fromTable:tableName];
        if (arr.count == 0) {
            [self  insertData:data toTable:tableName];
        }else{
            
            //NSLog(@"数据是:%@",data);
            NSNumber *dat =  block([data valueForKey:[data allKeys][0]],arr);
            NSDictionary *dic = nil;
            if (!dat) {
                dic = @{[data allKeys][0]:@"0"} ;
            }else {
                dic  = @{[data allKeys][0]:dat} ;
                
            }
            [[DBTool tool] DataBase:db
                           updateTable:tableName
                          setKeyValues:dic
                        whereCondition:@{@"id":@"1"}];
        }
    }];
}

//选择是否可插入 存在记录修改，不存在数据新建记录
- (void)checkAndInsert:(NSDictionary *)selectType andTableName:(NSString *)tableName andData:(NSDictionary *)data {
    __block NSArray* blockArr = nil;
    //找到最后插入的数据内容
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        blockArr = [[DBTool tool] DataBase:db maxSelectKeyTypes:selectType  fromTable:tableName];
        if (blockArr.count == 0) {  //表内有0条记录
            [[DBTool tool] DataBase:db insertKeyValues:data intoTable:tableName];
        }
        else{ //表内有1条以上记录//指定字段内是否有值
            if (((NSDictionary *)blockArr[0]).count > 1) { //插入新记录
                [[DBTool tool] DataBase:db insertKeyValues:data intoTable:tableName];
            }else{//向最后一条记录该字段填入值
                [[DBTool tool] DataBase:db
                               updateTable:tableName
                              setKeyValues:data
                            whereCondition:@{@"id":[NSNumber numberWithFloat:[self getLastId:tableName]]}];
            }
        }
    }];
}

//获取表中最后一条数据的id值
-(float)getLastId:(NSString *)tableName{
    
    NSDictionary *dataDict = [self getLastItemValueDict:@{@"id":@"integer"} fromTable:tableName];
    if (dataDict.count > 0) {
        return [[dataDict valueForKey:@"id"] floatValue];
    }
    return 0;
}

//获取表中最后一条记录的类型和数据字典
-(NSDictionary *)getLastItemValueDict:(NSDictionary *)selectType fromTable:(NSString *)tableName {
    
    __block  NSArray *arr = nil;
    arr = [[DBTool tool] DataBase:self.cwdb
                   maxSelectKeyTypes:selectType
                           fromTable:tableName];
    if (arr.count == 0) {
        return nil;
    }
    NSDictionary *temp = (NSDictionary *)arr[0];
    if (temp.count == selectType.count ) {
        return temp;
    }
    return nil;
}

//获取表中某字段的数据累加值
-(float)getSum:(NSDictionary *)selectType andTable:(NSString *)tableName {
    
    __block  NSArray *temp1 = nil;
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        temp1 = [[DBTool tool] DataBase:db selectKeyTypes:selectType fromTable:tableName whereCondition:@{@"id":@"1"} andOperation:@">"];
    }];
    
    if (temp1.count == 0) {
        return 0;
    }
    
    float sum = 0;
    for (NSDictionary *temp in temp1) {
        sum += [[temp valueForKey:[selectType allKeys][0]] floatValue];
    }
    return sum;
}

#pragma mark --LazyLoad
-(NSDictionary *)os_dict {
    
    if (!_os_dict) {
        _os_dict = @{
                     @"map":@"text",                //map进气歧管绝对压力
                     @"engine_speed":@"text",       //发动机转速
                     @"speed":@"text",              //车速
                     @"voltage":@"text",            //电压
                     @"recetime":@"date",           //数据接收时间
                     @"id":@"integer Primary key"   //主键
                     };
    }
    return _os_dict;
}

-(FMDatabase *)cwdb {
    
    if (!_cwdb) {
        _cwdb = [[DBTool tool] getDBWithDBName:@"CWDB.db"];
    }
    return _cwdb;
}



-(void)showRTData:(NSDictionary *)dict {
    
    __block NSArray *temps = nil;
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        temps = [[DBTool tool] DataBase:db
                            selectKeyTypes:dict
                                 fromTable:DATA_TABLE_OS
                            whereCondition:@{@"id":@"1"}
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

- (void)writeLogToFile:(NSString *)str {
    
    //第一：读取documents路径的方法：
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) ; //得到documents的路径，为当前应用程序独享
    NSString *documentD = [paths objectAtIndex:0];
    NSString *configFile = [documentD stringByAppendingPathComponent:@"blueDBLog.txt"]; //得到documents目录下blueLog.txt 文件的路径
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:configFile]) {
        [str writeToFile:configFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }else {
        NSFileHandle  *outFile;
        NSData *buffer;
        outFile = [NSFileHandle fileHandleForWritingAtPath:configFile];
        if(outFile == nil)
        {
            NSLog(@"Open of file for writing failed");
        }
        [outFile seekToEndOfFile];
        NSString *bs = [NSString stringWithFormat:@"%@\n",str];
        buffer = [bs dataUsingEncoding:NSUTF8StringEncoding];
        [outFile writeData:buffer];
        //关闭读写文件
        [outFile closeFile];
    }
}

-(void)clearTable {
    
    [[DBTool tool] clearDatabase:self.cwdb from:DATA_TABLE_OS];
    [self.cwdb close];
}

@end
