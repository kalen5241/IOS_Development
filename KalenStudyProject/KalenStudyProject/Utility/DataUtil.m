//
//  DataUtil.m
//  KalenStudyProject
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "DataUtil.h"
#import "GuideDataItem.h"
#import "MutilDataSource.h"
#import "UITestingVC.h"
#import "ErrorDepositeViewController.h"
#import "AutoResizeCellHeightVC.h"
#import "UMengSocialVCViewController.h"
#import "ConnectionVC.h"
#import "ImageDevVC.h"
#import "DrawPic.h"

@implementation DataUtil

-(NSArray *)guideArray {
    
    if (!_guideArray) {
        
        GuideDataItem *item1 = [[GuideDataItem alloc]init];
        item1.title = @"多张表公用一个UITableView";
        item1.destVC = [[MutilDataSource alloc]init];
        item1.detail = @"独立数据于UITableView-MutilDataSource";
        
        GuideDataItem *item2 = [[GuideDataItem alloc]init];
        item2.title = @"UI测试";
        item2.destVC = [[MutilDataSource alloc]init];
        item2.detail = @"UI自动化测试-UITestingVC";
        
        GuideDataItem *item3 = [[GuideDataItem alloc]init];
        item3.title = @"错误处理";
        item3.destVC = [[ErrorDepositeViewController alloc]init];
        item3.detail = @"错误处理机制-ErrorDepositeViewController";
        
        GuideDataItem *item4 = [[GuideDataItem alloc]init];
        item4.title = @"UITableView根据内容自适应高度";
        item4.destVC = [[AutoResizeCellHeightVC alloc]init];
        item4.detail = @"为解决每次都根据内容调整单元格高度的问题-AutoResizeCellHeightVC";

        GuideDataItem *item5 = [[GuideDataItem alloc]init];
        item5.title = @"UMeng分享";
        item5.destVC = [[UMengSocialVCViewController alloc]init];
        item5.detail = @"用于友盟分享测试-UMengSocialVCViewController";
        
        GuideDataItem *item6 = [[GuideDataItem alloc]init];
        item6.title = @"初始化方法、工厂方法、关联";
        item6.destVC = [[ConnectionVC alloc]init];
        item6.detail = @"通过工厂方法调用初始化方法给对象添加关联属性-ConnectionVC";
        
        GuideDataItem *item7 = [[GuideDataItem alloc]init];
        item7.title = @"图片开法";
        item7.destVC = [[ImageDevVC alloc]init];
        item7.detail = @"图片开发的多种方法-ImageDevVC";
        
        GuideDataItem *item8 = [[GuideDataItem alloc]init];
        item8.title = @"绘制曲线";
        item8.destVC = [[DrawPic alloc]init];
        item8.detail = @"用于测试绘制曲线-DrawPic";
        

        _guideArray = @[item1,item2,item3,item4,item5,item6,item7,item8];
    }
    return _guideArray;
}


- (NSArray *)fetchGuideArray{
    
    return self.guideArray;
}


+ (NSArray *)fetchArray {
    return [[[DataUtil alloc]init] fetchGuideArray];
}

+ (NSString *)fetchKalenWorkPath:(AppType)appType {
    /*
     rootPath
     /Users/kalen/Library/Developer/CoreSimulator/Devices/7F46A5AE-EA32-41B3-A29A-602881D7E60B/data/Containers/Data/Application/B7AF7366-7BD6-411D-B9F1-EB973495B7E2/Documents/
     
     kalen
     apps
     User
     images
     requestData
     CS
     images
     requestData
     */
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *rootPath = [paths objectAtIndex:0];
    NSString *kalenWorkPath = [rootPath stringByAppendingPathComponent:@"kalen"];
    if ([fileManager fileExistsAtPath:kalenWorkPath]) {
        NSLog(@"kalen路径存在");
        
        BOOL isFolder = NO;
        if ([fileManager fileExistsAtPath:kalenWorkPath isDirectory:&isFolder]) {
            NSLog(@"kalen是%@",isFolder?@"是文件夹":@"是文件");
        }
        
        NSArray *contents = [fileManager contentsOfDirectoryAtPath:[rootPath stringByAppendingPathComponent:@"kalen"] error:nil];
        for (NSString *content in contents) {
            NSLog(@"目录文件:%@",content);
        }
        
    }else {
        NSLog(@"kalen路径不存在");
        NSString *userFolder = @"kalen";
        NSArray *apps = @[@"User",@"CS"];
        NSArray *otherFolders = @[@"image",@"requestData"];
        NSString *usersPath = [rootPath stringByAppendingPathComponent:userFolder];
        for (NSString *app in apps) {
            for (NSString *folder in otherFolders) {
                //拼接每一个用户的路径
                NSString *folderPath = [usersPath stringByAppendingPathComponent:app];
                //拼接具体的文件夹 images/cache...
                folderPath = [folderPath stringByAppendingPathComponent:folder];
                //NSLog(@"folderPath:%@",folderPath);
                //创建相应的文件夹
                [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
            }
        }
    }
    
    switch (appType) {
        case AppTypeUser:
            return [kalenWorkPath stringByAppendingPathComponent:@"User"];
        case AppTypeCS:
            return [kalenWorkPath stringByAppendingPathComponent:@"CS"];
        default:
            return @"未知错误";
    }
    
}


+ (NSString*)getFullPath:(NSString*)fileName {
    //文件路径 单例模式
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSString *docPath = [(NSURL*)urls[0] path];
    //创建一个文件名
    //NSString *fileName = @"data.dat";
    NSString *fullPath = [docPath stringByAppendingPathComponent:fileName];
    return fullPath;
}

@end
