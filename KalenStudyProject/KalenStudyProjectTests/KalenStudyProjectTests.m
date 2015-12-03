//
//  KalenStudyProjectTests.m
//  KalenStudyProjectTests
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ErrorDepositeViewController.h"
#import "AnimalC.h"
#import "DataUtil.h"
#import "FMDatabase.h"



@interface KalenStudyProjectTests : XCTestCase

@end

@implementation KalenStudyProjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testDictionaryNullDeposite {

//获取测试数据
//读文件方法1:
    /*

    */
    
//读文件方法2:
/**/
    NSString *sortPath = [[NSBundle mainBundle] pathForResource:@"Data.plist" ofType:nil];
    NSLog(@"文件路径为%@",sortPath);
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:sortPath];
    NSLog(@"数组数据为:%@",dataArray);
 
    ErrorDepositeViewController *VC = [[ErrorDepositeViewController alloc]init];
    
    for (NSDictionary *dic in dataArray) {
        NSDictionary *disResult = [VC dictionaryNullDeposit:dic];
        NSLog(@"返回的字典为%@ ",disResult);
    }
}

- (void)testWriteFile {
    
    NSString *pathDic = @"dataDic.plist";
    NSString *pathArr = @"dataArr.plist";
    
    NSArray *array = @[@"1",@"2",@"3"];
    NSArray *array2 = @[@"one",@"two",@"three"];
    NSArray *array3 = @[array,array2];
    NSDictionary *dic = @{@"1": array,@"2":array2};
    [dic writeToFile:[DataUtil getFullPath:pathDic] atomically:YES];
    [array3 writeToFile:[DataUtil getFullPath:pathArr] atomically:YES];
    NSLog(@"dicPath is %@",[DataUtil getFullPath:pathDic]);
    NSLog(@"arrPath is %@",[DataUtil getFullPath:pathArr]);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * plistPath = [paths objectAtIndex:0];
    NSString * fileName = [plistPath stringByAppendingPathComponent:@"dataArr.plist"];
    NSLog(@"文件路径为%@",fileName);
    NSArray *dataArray1 = [NSArray arrayWithContentsOfFile:fileName];
    NSLog(@"数组数据为:%@",dataArray1);
    
    
}

- (void)testFMDB {
    FMDatabase *db = [FMDatabase databaseWithPath: [DataUtil getFullPath:@"kalen.db"]];
    if (!db) {
        NSLog(@"创建数据库失败");
    }
    
    [db open];
    
    
    NSString *createTable = @"create table product (p_id,p_type,f_id,s_id,s_desc,num,p_low,p_sell,p_now,p_active,active_id,is_on)";
    
    [db executeUpdate:createTable];
    
    NSString *insertTable = @"insert into product (p_id,p_type,f_id,s_id,s_desc,num,p_low,p_sell,p_now,p_active,active_id,is_on) values(?,?,?,?,?,?,?,?,?,?,?,?)";
    
    [db executeUpdate:insertTable,
     @"20001",@"201	",@"10001",@"101",@"15个左右",@"2",@"10",@"10",@"10",@"10",@"0",@"1"];
    
    FMResultSet *rs = [db executeQuery:@"SELECT p_id,p_type,f_id,s_id,s_desc,num,p_low,p_sell,p_now,p_active,active_id,is_on FROM product"];
    
    while ([rs next]) {
        
        NSString *p_id = [rs stringForColumn:@"p_id"];
        NSString *p_type = [rs stringForColumn:@"p_type"];
        NSString *f_id = [rs stringForColumn:@"f_id"];
        NSString *s_id = [rs stringForColumn:@"s_id"];
        NSString *s_desc = [rs stringForColumn:@"s_desc"];
        NSString *num = [rs stringForColumn:@"num"];
        NSString *p_low = [rs stringForColumn:@"p_low"];
        NSString *p_sell = [rs stringForColumn:@"p_sell"];
        NSString *p_now = [rs stringForColumn:@"p_now"];
        NSString *p_active = [rs stringForColumn:@"p_active"];
        NSString *active_id = [rs stringForColumn:@"active_id"];
        NSString *is_on = [rs stringForColumn:@"is_on"];
        
        NSArray *arr = @[p_id,p_type,f_id,s_id,s_desc,num,p_low,p_sell,p_now,p_active,active_id,is_on];
        
        for (NSString *str in arr) {
            NSLog(@"%@",str);
        }
        
    }
    
    [rs close];
    
    
    [db close];//关闭数据库

    
}

- (void)testFileOperation {
    NSLog(@"kalen的User目录是%@",[DataUtil fetchKalenWorkPath:AppTypeUser]);
    NSLog(@"kalen的CS目录是%@",[DataUtil fetchKalenWorkPath:AppTypeCS]);
}

- (void)testObjectPropertyAndValue {
    
    ErrorDepositeViewController *VC = [[ErrorDepositeViewController alloc]init];
    
    AnimalC *animal = [[AnimalC alloc]init];
    
    NSDictionary *dic = [NSDictionary dictionary];
    
    dic = [VC properties_aps:animal];
    
    NSLog(@"返回的字典为%@ ",dic);
    
}

- (void)btnDown:(UIButton*)btn{
    /*
     任何数据库的操作都要有以下流程
     1、找到沙盒路径
     2、打开数据库（建立数据库）
     3、打开表（建立表）
     4、对表的内容的（增删改查）操作
     5、操作完了记得关闭数据库
     */
 /*   
    //1、路径
    NSString *document = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    //2、建数据库
    FMDatabase *db = [FMDatabase databaseWithPath:[document stringByAppendingString:@"/myFirstDb.db"]];//参数是建一个数据库的完整路径
    if(!db)
    {
        NSLog(@"我没建数据库");
        return;
    }
    
    [db open];//打开数据库
    
    //任何数据库操作的时候都要有两步组成，一步是写sql语句，一步是调用sql语句
    switch (btn.tag) {
        case 1000:
        {//建表
            //1、sql建表语句
            NSString *createTable = @"create table peopleList (name,age)";//create是建表关键字，table引导后面的表名，peopleList是表名，(里是这个表的字段名)
            //2、调用sql语句
            BOOL isCreate = [db executeUpdate:createTable];
            if(isCreate == NO)
            {
                NSLog(@"建表失败");
                return;
            }
            break;
        }
        case 1001:
        {//插入
            //1、sql插入语句
            NSString *insertTable = @"insert into peopleList(name,age) values(?,?)";//insert into 是插入关键字 into后面就是表名 peopleList就是表名，表名后面的（里是这个表的字段名），要写全写对，values是引导字段内容值的关键字，value后的（里有几个字段就写几个？，？表示通配符相当于%@）
            //2、调用插入语句，要在插入语句后，写参数，参数个数等于插入语句里？的个数
            BOOL isInsertOk = [db executeUpdate:insertTable,@"pp",@"18"];
            if(isInsertOk == NO)
            {
                NSLog(@"插入失败");
                return;
            }
            isInsertOk = [db executeUpdate:insertTable,@"qq",@"16"];
            if(isInsertOk == NO)
            {
                NSLog(@"插入失败");
                return;
            }
            isInsertOk = [db executeUpdate:insertTable,@"oo",@"18"];
            if(isInsertOk == NO)
            {
                NSLog(@"插入失败");
                return;
            }
            isInsertOk = [db executeUpdate:insertTable,@"kk",@"18"];
            if(isInsertOk == NO)
            {
                NSLog(@"插入失败");
                return;
            }
            isInsertOk = [db executeUpdate:insertTable,@"ll",@"15"];
            if(isInsertOk == NO)
            {
                NSLog(@"插入失败");
                return;
            }
            break;
        }
        case 1002:
        {//修改
            //1、sql修改语句
            NSString *updateTable = @"update peopleList set name = ? where age = ?";//update是修改的关键字，后面是peopleList表名，set表示修改动作的关键字，set后面跟着被改的字段名及其要改的内容(要改的内容也可以是?)，再后面可以加where限制，也可以不加，where后面是字段=内容的结构，内容同样可以为?
            //2、调用修改语句
            BOOL isUpdate = [db executeUpdate:updateTable,@"zzzzz",@"18"];
            if(isUpdate == NO)
            {
                NSLog(@"修改失败");
                return;
            }
            break;
        }
        case 1003:
        {//删除
            //1、sql删除语句
            NSString *delTableCharactor = @"delete from peopleList where age = ?";//delete from是删除关键字，后面是要删的表名，然后可以选择跟一个where限制，限制参考修改
            //2、调用删除语句
            BOOL isDelCharactor = [db executeUpdate:delTableCharactor,@"18"];
            if(isDelCharactor == NO)
            {
                NSLog(@"插入失败");
                return;
            }
            break;
        }
        case 1004:
        {//毁表
            //1、sql毁表语句
            NSString *dropTable = @"drop table peopleList";//drop是毁表关键字，然后跟table引导表名，表名就是要被毁的那个表
            //2、调用毁表语句
            BOOL isDrop = [db executeUpdate:dropTable];
            if(isDrop == NO)
            {
                NSLog(@"插入失败");
                return;
            }
            break;
        }
        default:
            break;
    }
    
    [db close];//关闭数据库
    
    //任何按钮按过之后，都可以push到下个页面，展示表的内容
    TableViewController *table = [[TableViewController alloc] init];
    [self.navigationController pushViewController:table animated:YES];
    [table release];
  */
}

@end
