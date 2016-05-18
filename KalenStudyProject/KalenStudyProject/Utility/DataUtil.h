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
+ (void)showJSON;


/**
 * 以字典形式返回NSUserDefault中的数据
 */
+ (NSDictionary *)fetchUserDefaultContent;

/**
 * 缩放图像，并根据imageview的宽高进行图片裁剪，图片没有被拉伸和变形
 * @param  image        原始图像文件
 * @param  width        目标imageview的宽
 * @param  height     目标imageview的高
 */
+ (UIImage *)compressImageWith:(UIImage *)image width:(float)width height:(float)height;
@end
