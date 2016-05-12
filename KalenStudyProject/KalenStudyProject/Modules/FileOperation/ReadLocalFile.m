//
//  ReadLocalFile.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/9.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ReadLocalFile.h"

@interface ReadLocalFile ()

@end

@implementation ReadLocalFile

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *filePath = @"/Users/kalen/Desktop/1.txt";
    
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
//    [fileHandle seekToFileOffset:1000];
//    NSData *data = [fileHandle readDataOfLength:2000];
    
//  NSData *data = [fileHandle readDataToEndOfFile];
    
    [self readFileToArray:filePath];
    
}

-(NSArray *)readFileToArray:(NSString *)filePath {
    
    NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *arr = [str componentsSeparatedByString:@"\n"];
    
    NSLog(@"文件内容是：%@",arr);
    
    return arr;
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

- (void)ReadLogToFile:(NSString *)str {
    
    //第一：读取documents路径的方法：
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) ; //得到documents的路径，为当前应用程序独享
    
    NSString *documentD = [paths objectAtIndex:0];
    
    
    NSString *configFile = [documentD stringByAppendingPathComponent:@"blueDBLog.txt"]; //得到documents目录下blueLog.txt 文件的路径
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:configFile]) {
//        [str writeToFile:configFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"file not exist!");
    }else {
        NSFileHandle  *outFile;
        NSData *buffer;
        
        outFile = [NSFileHandle fileHandleForWritingAtPath:configFile];
        
        if(outFile == nil)
        {
            NSLog(@"Open of file for writing failed");
        }
        
        [outFile seekToEndOfFile];

        buffer = [outFile readDataToEndOfFile];
        
        NSString *strTemp = [[NSString alloc] initWithData:buffer encoding:NSUTF8StringEncoding];
        
        NSArray *arr = [strTemp componentsSeparatedByString:@"\r"];
        
        //关闭读写文件
        [outFile closeFile];
        
    }
    
}

-(int)readAndWriteFile
{
    
    @autoreleasepool {
        
        NSFileHandle *inFile, *outFile;
        NSData *buffer;
        //[[NSFileManager defaultManager] createFileAtPath:@"test.txt" contents:@"sdfjdsfdf" attributes:nil];
        
        //打开testfile.txt文件用于读取操作
        inFile = [NSFileHandle fileHandleForReadingAtPath:@"1.txt"];
        
        if(inFile == nil)
        {
            NSLog(@"Open of testfile.txt for reading failed!");
            return 1;
        }
        
        //创建一个文件用于写数据（第一次是必要的）
        [[NSFileManager defaultManager] createFileAtPath:@"testout.txt" contents:nil attributes:nil] ;
        
        //打开testout.txt文件用于写入操作
        outFile = [NSFileHandle fileHandleForWritingAtPath:@"testout.txt"];
        
        if(outFile == nil)
        {
            NSLog(@"Open of testout.txt for writing failed!");
            return 2;
        }
        
        //
        [outFile truncateFileAtOffset:0];
        
        //从inFile中读取数据，并将其写入到outFile中
        buffer = [inFile readDataToEndOfFile];
        
        [outFile writeData:buffer];
        
        //关闭两个文件
        [inFile closeFile];
        [outFile closeFile];
        
        //验证文件的内容是否写入
        NSLog(@"%@",[NSString stringWithContentsOfFile:@"testout.txt" encoding:NSUTF8StringEncoding error:nil]);
    }
    return 0;
}

@end
