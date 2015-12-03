//
//  DataUtil.h
//  KalenStudyProject
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataUtil : NSObject

typedef NS_ENUM(NSUInteger, AppType) {
    AppTypeUser,
    AppTypeCS,
};

@property (nonatomic,strong) NSArray *guideArray;
- (NSArray *)fetchGuideArray;
+ (NSArray *)fetchArray;
+ (NSString *)fetchKalenWorkPath:(AppType)appType;
+ (NSString*)getFullPath:(NSString*)fileName;

@end
