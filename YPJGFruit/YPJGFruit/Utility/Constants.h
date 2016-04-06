//
//  Constants.h
//  YPJGFruit
//
//  Created by kalen on 16/3/31.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

#ifdef __OBJC__
#define BLUETEXTCOLOR [UIColor colorWithHexString:@"09D0FF"]

#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define DEVICE_IS_ABOVE_IPHONE6 ([[UIScreen mainScreen] bounds].size.width > 320)
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define IS_ABOVE_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0000 ? YES : NO)
#define IS_BELOW_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0000 ? YES : NO)
#define SCREEN_SCALE [[UIScreen mainScreen] bounds].size.width / 375.0
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH_PIX ([[UIScreen mainScreen] bounds].size.width == 320 ? 640 : ([[UIScreen mainScreen] bounds].size.width == 375 ? 750 : 1242))

#define URL_PREFIX @"http://testapi.obd.chewen.com/V3/"

#define AlertShow(x) UIAlertView *at = [[UIAlertView alloc] initWithTitle:nil message:x delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];[at show];


#define AlertMsg(x) [CWUtil alertMsg:x onVC:self andTimeSecond:1];

//网络请求错误信息提示
#define ErrorMsg(x,y) [CWUtil checkError:x andTimeSecond:y onVC:self];

#pragma mark - SandBoxImageUtil
//=====  SandBoxImageUtil =====
#define CAR_TYPE    1
#define ADMIN_TYPE  2

#define IMAGE_TYPE_O    9
#define IMAGE_TYPE_M    5
#define IMAGE_TYPE_S    1

#define URL_PREFIX @"http://123.57.149.60:8081/"


#define ADMIN_IMAGE_URL     @"http://img.chewen.com/pics/obdDealer/adminHead/%d/%d/%dhead%@.jpg"
#define CAR_IMAGE_URL       @"http://img.chewen.com/pics/obdcar/head/%d/%d/%dhead%@.jpg"

#define ADMIN_IMAGE_PATH    @"admin%d%@.jpg"
#define CAR_IMAGE_PATH      @"car%d%@.jpg"

#define IMAGE_TYPE_SUF_O    @""
#define IMAGE_TYPE_SUF_M    @"_m"
#define IMAGE_TYPE_SUF_S    @"_s"


#pragma mark - ThirdPartKey
//===== ThirdPartKey =====

//友盟 Appkey
#define MOBCLICK__KEY_USER @"5316be2d56240b343a0f61ce"

//环信 EaseMob
#define HXPUSH_KEY_DEV_USER @"qicheyisheng#obd"
#define HXPUSH_KEY_PRO_USER @"qicheyisheng#obdcsonline"

//微信 key
#define  WX_KEY_USER @"wx5acdcfe53ab7fc9e"
#define  WX_SECRET_USER @"507f20b663a2ce32861907b2f7e0d7c1"

//QQ key
#define  QQ_APP_ID_USER @"1104407058"
#define  QQ_APP_KEY_USER @"qE71klu3kGbLBe3Y"


#define _IPHONE80_ 80000
#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define ACCESS_ID   2200036758
#define ACCESS_KEY  @"IR1DYJ7C226T"
#define APP_TYPE    2

/**
 *  用户登录信息常用宏
 */

#define USERINFO_PASSPORT @"passport"
#define USERINFO_HAS_CAR_TYPE @"hasCarType"
#define USERINFO_LOGO @"logo"

#define USERINFO_ADMIN_ID @"adminId"
#define USERINFO_CAR_ID @"carId"

#define USERINFO_PHONENUM @"phoneNum"
#define USERINFO_LICENSE_NUM @"licenseNum"
#define USERINFO_OBDNUM @"obdNum"

#define USERINFO_ADMIN_NAME @"adminName"
#define USERINFO_NICK_NAME @"nickName"
#define USERINFO_OBD_STATUS @"obdStatus"
#define USERINFO_ADMINPHONE @"adminPhone"
#define USERINFO_HAS_OBD @"hasOBD"

#define USERINFO_NEED_UPDATE_HEAD @"needUpdateHead"

#define USERINFO_ZX_TEL @"zxTel"
#define USERINFO_JY_TEL @"jyTel"
#define USERINFO_BX_TEL @"bxTel"


/**
 *  用于获取用户登录保存在NSUserDefault中的key
 *
 *  @return 包含所有key字符串的数组
 */
#define USERINFO_DELETE @[USERINFO_PASSPORT,USERINFO_HAS_CAR_TYPE,USERINFO_LOGO,USERINFO_ADMIN_ID,USERINFO_CAR_ID,USERINFO_PHONENUM,USERINFO_LICENSE_NUM,USERINFO_OBDNUM,USERINFO_ADMIN_NAME,USERINFO_NICK_NAME,USERINFO_OBD_STATUS,USERINFO_ADMINPHONE,USERINFO_HAS_OBD,USERINFO_NEED_UPDATE_HEAD,USERINFO_ZX_TEL,USERINFO_JY_TEL,USERINFO_BX_TEL];

#define SET_USERINFO(x,y) [[NSUserDefaults standardUserDefaults] setObject:x forKey:y]
#define GET_USERINFO(x) [[NSUserDefaults standardUserDefaults] objectForKey:x]

/**
 * 对self的弱引用
 */
#define kWeakSelf typeof(self) __weak weakSelf =self

/**
 * 字体样式
 */
#define cwFont(x) [UIFont systemFontOfSize:x]

/**
 *  灰色字体 和 灰色线的颜色
 */
#define cwGreyColor [UIColor colorWithLineColor]

/**
 * 判断是4s
 */
#define DEVICE_IS_IPHONE4S ([[UIScreen mainScreen] bounds].size.height == 480)

/**
 * NSLog
 */
#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__)
#else
#define LOG(...);
#endif

/**
 * 屏幕的宽度和高度
 */
#define MAutoScale /375.*SCREEN_WIDTH
#define MAS MAutoScale
#define ASX(x)  SCREEN_WIDTH <375 ? x MAS : x
#endif

@end
