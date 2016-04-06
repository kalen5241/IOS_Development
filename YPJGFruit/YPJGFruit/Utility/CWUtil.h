//
//  CWUtil.h
//  CarSecretary_CS
//
//  Created by kalen on 15/11/4.
//  Copyright © 2015年 chewen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "UIColor+Hex.h"
#import "Constants.h"

//jumpToLogin
#import "BaseViewController.h"



typedef NS_ENUM(NSInteger,CWDateStringType) {
    yearLmonthLday = 0,   //本地日期：yyyy-MM-dd
    yearPmonthPday,   //本地日期：yyyy.MM.dd
    yearCmonthCday,   //本地日期：yyyy年MM月dd日
    yearLmonthLdayHourMinSeconds,   //本地日期：yyyy-MM-dd HH:mm:ss
    yearPmonthPdayHourMinSeconds,   //本地日期：yyyy.MM.dd HH:mm:ss
    yearLmonthLdayHourMin,   //本地日期：yyyy-MM-dd HH:mm
    yearMonthDayMinSeconds,  //本地日期：yyyyMMddHHmmss
    yearMonth,   //本地日期：yyyy-MM
    
};

@protocol CWDatePickerUtilDelegate <NSObject>


/**
 * 代理方法，检测datePicker数据实时的改变
 * @param  dateString     返回的选中的datePicker的数据 格式化后的字符串
 * @param  nowDateS       现在的时间 字符串
 * @param  befOrAft       0选中的时间晚于当前  1是早于当前
 */
- (void)changeDateS:(NSString *)dateString andNowDate:(NSString *)nowDateS andBeforeOrAfter:(NSInteger)befOrAft;

@end



@interface CWUtil : NSObject

/**
 * 添加自定义提示框 
 * @param  msg      提示内容   
 * @param  vc       目标是图   
 * @param  seconds  提示框显示时间（s）
 */
+(void)alertMsg:(NSString *)msg onVC:(UIViewController *)vc andTimeSecond:(float)seconds;

/**
 *  检测电话号格式
 * @param  phoneNum       电话号
 */
+(BOOL)checkPhoneNumInput:(NSString *)phoneNum;


/**
 *  检测网络请求 错误信息的提示
 * @param  error        网络请求错误的信息
 * @param  seconds      提示语句显示的时间
 * @param  vc           目标视图
 */
+(NSString *)checkError:(NSError *)error andTimeSecond:(float)seconds onVC:(UIViewController *)vc;

/**
 *  检测网络请求 返回错误信息提示语
 * @param  error        网络请求错误的信息
 * @param  seconds      提示语句显示的时间
 */
+(NSString *)checkErrorMessage:(NSError *)error;

/**
 *  自动布局平分视图
 * @param  view        待平分视图
 * @param  arr         子视图数据
 * @param  attributes  布局属性字典 letf（正值） right（负值） top（正值） bottom （负值） space （负值）
 */

+ (BOOL)divideView:(UIView *)view andSubViewArrar:(NSArray *)arr andAttribute:(NSDictionary *) attributes;



/**
 *  view动画
 * @param  srcView        添加动画的view
 */
+ (void)scaleToShow:(UIView *)srcView;

/**
 *  旋转箭头图片
 * @param  imageOrientation        图片旋转的方法
 */
+ (UIImage *)imageRotation:(UIImageOrientation)imageOrientation;

/**
 *  网络请求部分问题处理
 * @param  response        model
 * @param  error       错误信息
 */
+ (BOOL)errorResponse:(CWBaseModel *)response andError:(NSError *)error isShowErrorMsg:(BOOL)isShow;

@end



#pragma mark - CWDatePickerUtil
@interface CWDatePickerUtil : UIView
@property(nonatomic, strong) id<CWDatePickerUtilDelegate> delegate;
/**
 * datePicker 控件
 */
@property(nonatomic, strong) UIDatePicker *cwDateP;

/**
 * 返回的时间字符串的格式
 */
@property(assign) CWDateStringType dateStringType;

/**
 * 传入 显示在那个view中  和执行代理的对象  返回的date格式 
 * @param  view        目标视图
 * @param  delegate    代理
 * @param  dateSType   时间的格式  如：yyyy-MM-dd
 */
+ (void)showCWDatePickerView:(UIView *)view target:(id)delegate andDateStringType:(CWDateStringType)dataSType;

/**
 * 使用block回调传值  这里用到关联
 * @param  view         目标视图
 * @param  block        block回调，返回选中的时间
 * @param  dataSType    时间的格式  如：yyyy-MM-dd
 */
+ (void)showCWDatePickerView:(UIView *)view completionBlock:(void (^)(NSString * dateString,NSString *nowDateS,NSInteger befOrAft))block andDateStringType:(CWDateStringType)dataSType;

@end



#pragma mark - jumpToLogin
@interface JumpToLogin : BaseViewController
+(void)jumpToLogin:(UINavigationController *)nav andVC:(UIViewController *)vc;
@end


#pragma mark - jumpUtil
@interface JumpUtil : NSObject

+ (void)jump: (UIViewController *)srcViewController andId: (NSString *)idendtifier andBackTitle:(NSString *)backTitle andTitle: (NSString *) title;


@end


#pragma mark - SandBoxImageUtil
@interface SandBoxImageUtil : NSObject{
    
}
//@property(strong,atomic) NSNumber* CAR_TYPE;
//@property(strong,atomic) NSNumber* ADMIN_TYPE;

+(UIImage*)getImage:(NSInteger)userType typeId:(NSInteger)typeId imageType:(NSInteger)imageType;

+(UIImage*)getImageByPath:(NSString*)path;
+(NSData*)getImageDataByUrl:(NSString*)urlStr;
+(NSString*)getPath:(NSInteger)userType typeId:(NSInteger)typeId imageType:(NSInteger)imageType;
+(NSString*)getUrl:(NSInteger)userType typeId:(NSInteger)typeId imageType:(NSInteger)imageType;
+(void)saveImageData:(NSData*)data toPath:(NSString*)path;
+(void)saveImageForAllSize:(NSData*)data userType:(NSInteger)userType typeId:(NSInteger)typeId;
+(void)removeAllHeadImage;
@end



#pragma mark - AFAppDotNetAPIClient
@interface AFAppDotNetAPIClient : AFHTTPSessionManager

@property (nonatomic, assign) BOOL hasNetwork;
+ (instancetype)sharedClient;

/**
 *  post请求
 * @param  URLString        url
 * @param  parameters       请求参数
 * @param  block            回调函数
 */
- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters compeletion:(void(^)(NSURLSessionDataTask *task,id responseObject, NSError *error))block;

/**
 *  get请求
 * @param  URLString        url
 * @param  parameters       请求参数
 * @param  block            回调函数
 */
- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters compeletion:(void(^)(NSURLSessionDataTask *task,id responseObject, NSError *error))block ;

@end



#pragma mark - PCodeUtil
static NSDictionary *PCODE_DATA;

@interface PCodeUtil : NSObject

+ (void)init;

+ (NSDictionary*)getPCodeData;

@end


#import "LoginResponse.h"
#pragma mark - UserInfo
@interface UserInfo : NSObject
//获取登录时储存的用户信息
+(LoginInfo *)getUserInfoFromApp;
//设置属性字符串
+(NSMutableAttributedString*)attributedStringWithString:(NSString*)string;
//返回字符串高度值，minSize 字符串最小宽度
+(CGFloat)calculateHeightWithString:(NSString*)string andMinSize:(CGFloat)minSize;
//返回字符串size
+ (CGSize)calculateWidthString:(NSString *)str andFont:(UIFont *)font;

@end

@interface ShareUtil : NSObject

/**
 * 友盟分享组件截屏函数
 * @param  sender   视图控制器
 */
+(UIImage *)screenShots:(id)sender;
@end

@interface LoginUtil : NSObject

/**
 *  将用户登录时返回的模型写入到NSUserDefault中
 *
 *  @param loginInfo 登录请求后返回的数据
 */
+ (void)createLoginInfo:(LoginInfo *)loginInfo;
@end



#pragma mark - 游客登录信息解析
@interface VisitorJsonData : NSObject

+ (instancetype)shareVisitorData;
- (NSMutableDictionary *)getVisitorDic:(NSString *)dicKey;

@end

@interface TimeSelectTool : NSObject

+ (NSDate *)nextWeek:(NSDate *)date;
+ (NSDate *)lastWeek:(NSDate *)date;
+ (NSDate *)nextDay:(NSDate *)date;
+ (NSDate *)lastDay:(NSDate *)date;
+ (NSDate *)nextMonth:(NSDate *)date;
+ (NSDate *)lastMonth:(NSDate *)date;
@end


@interface LayoutClass : UIView

+(void)view:(UIView *)superView andView:(UIView *)subView;

@end


