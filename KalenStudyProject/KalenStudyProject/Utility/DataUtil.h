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


#pragma mark --文件操作相关

+ (NSString *)fetchKalenWorkPath:(AppType)appType;

+ (NSString*)getFullPath:(NSString*)fileName;


/**
 * 读取 工程文件中的所有 plist 文件 转成 json 输出
 */
+ (void)showJSON;

/**
 * 以字典形式返回NSUserDefault中的数据
 */
+ (NSDictionary *)fetchUserDefaultContent;

#pragma mark --图像处理相关

/**
 * 缩放图像，并根据imageview的宽高进行图片裁剪，图片没有被拉伸和变形
 * @param  image        原始图像文件
 * @param  width        目标imageview的宽
 * @param  height     目标imageview的高
 */
+ (UIImage *)compressImageWith:(UIImage *)image width:(float)width height:(float)height;


#pragma mark --字符串相关

/**
 *  检测电话号格式
 * @param  phoneNum       电话号
 */
+ (BOOL)checkPhoneNumInput:(NSString *)phoneNum;

@end
