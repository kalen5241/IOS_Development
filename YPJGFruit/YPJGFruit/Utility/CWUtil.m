//
//  CWUtil.m
//  CarSecretary_CS
//
//  Created by kalen on 15/11/4.
//  Copyright © 2015年 chewen. All rights reserved.
//

#import "CWUtil.h"
#import <objc/runtime.h>

//jumpToLogin
#import "LoginViewController.h"
#import <Masonry.h>




@implementation CWUtil


// 上一个月
+ (NSDate *)lastMonth:(NSDate *)date{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
    
    return newDate;
}

// 下一个月
+ (NSDate *)nextMonth:(NSDate *)date{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
    return newDate;
}



/**
 * 添加自定义提示框
 * @param  msg      提示内容
 * @param  vc       目标是图
 * @param  seconds  提示框显示时间（s）
 */

+(void)alertMsg:(NSString *)msg onVC:(UIViewController *)vc andTimeSecond:(float)seconds{
    
    __block typeof (vc) weakVC = vc;
    __block float blockSeconds;
    
    if (seconds) {
        blockSeconds = seconds;
    }else{
        blockSeconds = 2.0;
    }
    
    __block MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:weakVC.view];
    
    //    [weakVC.view addSubview:HUD];
    [[[UIApplication sharedApplication].delegate window] addSubview:HUD];
    HUD.color = BLUETEXTCOLOR;
    HUD.mode = MBProgressHUDModeCustomView;
    
    HUD.customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 230, 60)];
    //返回字符串高度值，minSize 字符串最小宽度

    UILabel * label = [[UILabel alloc] initWithFrame:HUD.customView.frame];
    label.numberOfLines = 0;
    
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14.0];
    label.backgroundColor = [UIColor clearColor];

    
    label.text = msg;
    [HUD.customView addSubview:label];
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(blockSeconds);
    } completionBlock:^{
        [HUD removeFromSuperview];HUD = nil;
        
    }];
}



/**
 *  检测电话号格式
 * @param  phoneNum       电话号
 */
+ (BOOL)checkPhoneNumInput:(NSString *)phoneNum{
    
    NSString *patternTel = @"^1[1,2,3,4,5,6,7,8,9][0-9]{9}$";
    
    NSError *err = nil;
    NSRegularExpression *TelExp = [NSRegularExpression regularExpressionWithPattern:patternTel options:NSRegularExpressionCaseInsensitive error:&err];
    
    NSTextCheckingResult * isMatchTel = [TelExp firstMatchInString:phoneNum options:0 range:NSMakeRange(0, [phoneNum length])];
    
    if (isMatchTel) {
        return TRUE;
    }else {
        return FALSE;
    }


}


/**
 *  检测网络请求 错误信息的提示
 * @param  error        网络请求错误的信息
 * @param  seconds      提示语句显示的时间
 */
+(NSString *)checkError:(NSError *)error andTimeSecond:(float)seconds onVC:(UIViewController *)vc{
   
    NSString *errorString;
    NSString *requestLongTimeOut = @"网络请求超时！";
    NSString *systemError = @"系统错误，请稍后再试！";
    NSString *noNetwork = @"您当前网络不可用，请开启网络服务！";
    if ([AFAppDotNetAPIClient sharedClient].hasNetwork) {
        if (error.code == -1001) {
            errorString = requestLongTimeOut;
            
            [CWUtil alertMsg:requestLongTimeOut onVC:vc andTimeSecond:1];
        } else {
            
            if (seconds) {
                errorString = systemError;
                
                [CWUtil alertMsg:systemError onVC:vc andTimeSecond:seconds];
            }else {
                errorString  = systemError;
                
                [CWUtil alertMsg:systemError onVC:vc andTimeSecond:1];
            }
        }

    }else {
        errorString = noNetwork;
        
        [CWUtil alertMsg:noNetwork onVC:vc andTimeSecond:1];
    }
    
    return errorString;
    
}


/**
 *  检测网络请求 返回错误信息提示语
 * @param  error        网络请求错误的信息
 * @param  seconds      提示语句显示的时间
 */
+(NSString *)checkErrorMessage:(NSError *)error {
    
    NSString *errorString;
    NSString *requestLongTimeOut = @"网络请求超时！";
    NSString *systemError = @"系统错误，请稍后再试！";
    NSString *noNetwork = @"您当前网络不可用，请开启网络服务！";
    if ([AFAppDotNetAPIClient sharedClient].hasNetwork) {
        if (error.code == -1001) {
            errorString = requestLongTimeOut;
        } else {
            
            errorString = systemError;
        }
        
    }else {
        errorString = noNetwork;
    }
    
    return errorString;
}

+ (BOOL)divideView:(UIView *)view andSubViewArrar:(NSArray *)arr andAttribute:(NSDictionary *) attributes {
    
    __block NSDictionary * weakAttributes = attributes;
    
    __block float top = [weakAttributes[@"top"] floatValue];
    __block float bottom = [weakAttributes[@"bottom"] floatValue];
    __block float left = [weakAttributes[@"left"] floatValue];
    __block float right = [weakAttributes[@"right"] floatValue];
    __block float space = [weakAttributes[@"space"] floatValue];
    
    //上 下 左 右 间隔
    if (arr.count < 2) {
        //NSLog(@"数组元素过少");
        return false;
    }else {
        
        UIView *last = nil;
        UIView *first = nil;
        UIView *temp = nil;
        //__block int space = -5;
        
        for (int i = 0; i < arr.count; i++) {
            
            last  = (UIView *)arr[arr.count - 1];
            first = (UIView *)arr[0];
            
            if (i == 0) {
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(view.mas_bottom).offset(bottom);
                    make.left.equalTo(view.mas_left).offset(left);
                    make.right.equalTo(((UIView *)arr[1]).mas_left).offset(space);
 
                    make.width.equalTo(last);
                }];
            }else if (i == arr.count-1) {
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(view.mas_bottom).offset(bottom);
                    make.right.equalTo(view.mas_right).offset(right);
                    make.width.equalTo(first);
                }];
            }else {
                temp = (UIView *)arr[i+1];
                [(UIView *)arr[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(view.mas_top).offset(top);
                    make.bottom.equalTo(view.mas_bottom).offset(bottom);
                    make.right.equalTo(temp.mas_left).offset(space);
                    make.width.equalTo(first);
                }];
            }
        }
       // NSLog(@"将视图平分为%lu份",(unsigned long)arr.count);
        return true;
    }
}


/**
 *  view动画
 * @param  srcView        添加动画的view
 */
+ (void)scaleToShow:(UIView *)srcView {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 1;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [srcView.layer addAnimation:animation forKey:nil];
}



/**
 *  旋转箭头图片
 * @param  imageOrientation        图片旋转的方法
 */
+ (UIImage *)imageRotation:(UIImageOrientation)imageOrientation {
    UIImage *image1 = [UIImage imageWithCGImage:[UIImage imageNamed:@"bottomArrow"].CGImage
                                          scale:1
                                    orientation:imageOrientation];
    
    return image1;
}



/**
 *  网络请求部分问题处理
 * @param  response        model
 * @param  error       错误信息
 */
- (BOOL)errorResponse:(CWBaseModel *)response andError:(NSError *)error isShowErrorMsg:(BOOL)isShow {
    
    if (error || response == nil) {
        if (isShow) {
            ErrorMsg(error,0);
        }
        return YES;
    }
    
    if (response.code == 403) {//环信
        return YES;
    }
    
    if (response.code != 0) {
        if (isShow) {
            AlertMsg(response.msg);
        }
        return YES;
    }
    return NO;
}


@end



static UIView * cwView;
@interface CWDatePickerUtil()
@property (nonatomic, strong) CWDatePickerUtil *datePi;

@end

@implementation CWDatePickerUtil
{
    NSDateFormatter *dateFormatter;
}

@synthesize dateStringType;


/**
 * 使用block回调传值  这里用到关联
 * @param  view         目标视图
 * @param  block        block回调，返回选中的时间
 * @param  dataSType    时间的格式  如：yyyy-MM-dd
 */
+ (void)showCWDatePickerView:(UIView *)view completionBlock:(void (^)(NSString * dateString,NSString *nowDateS,NSInteger befOrAft))block andDateStringType:(CWDateStringType)dataSType {
    
    CWDatePickerUtil *dateP = [[self alloc]initWithView:view
                                        completionBlock:block];
    [dateP setDatePi:dateP];
    dateP.dateStringType = dataSType;
    [dateP dateFormatter];
    [[[UIApplication sharedApplication].delegate window] addSubview:dateP];
    cwView = view;
    
}


/**
 * 传入 显示在那个view中  和执行代理的对象  返回的date格式
 * @param  view        目标视图
 * @param  delegate    代理
 * @param  dateSType   时间的格式  如：yyyy-MM-dd
 */
+ (void)showCWDatePickerView:(UIView *)view target:(id)delegate andDateStringType:(CWDateStringType)dataSType
{
    CWDatePickerUtil *dateP = [[self alloc]initWithView:view];
    [dateP setDatePi:dateP];
    //[view addSubview:dateP];
    dateP.delegate = delegate;
    dateP.dateStringType = dataSType;
    [dateP dateFormatter];
    
    [[[UIApplication sharedApplication].delegate window] addSubview:dateP];
    cwView = view;
}

//block 关联
- (id)initWithView:(UIView *)view  completionBlock:(void (^)(NSString * dateString,NSString *nowDateS,NSInteger befOrAft))block{
    self = [self initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    objc_setAssociatedObject(_cwDateP, @"assAndBlockForKey", block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return self;
}


- (id)initWithView:(UIView *)view {
    return [self initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
        //设置datePicker
        _cwDateP = [[UIDatePicker alloc] init];
        [self addSubview:_cwDateP];
        _cwDateP.layer.cornerRadius = 10.0;
        _cwDateP.clipsToBounds = YES;
        _cwDateP.alpha = 0.9;
        
        _cwDateP.frame = CGRectMake((frame.size.width-300)/2, (frame.size.height - 200)/2, 300, 200);
        //NSArray * arr = [_datePicker subviews];//获得picker上的view的个数
        UIView *view = [[_cwDateP subviews]firstObject];//09D0FF
        view.backgroundColor = [UIColor colorWithRed:9.0/255.0 green:208.0/255.0 blue:255.0/255.0 alpha:0.9];
        [_cwDateP setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
        _cwDateP.datePickerMode = UIDatePickerModeDate;
        
        [_cwDateP addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        //返回的时间字符串的格式
        self.dateStringType = yearLmonthLday;
        
    }
    return self;
}

//时间格式的转换
- (void)dateFormatter {
    //时间格式
    dateFormatter = [[NSDateFormatter alloc]init];
    //有else if  改为 switch case
    switch (self.dateStringType) {
        case yearLmonthLday:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case yearLmonthLdayHourMinSeconds:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            _cwDateP.datePickerMode = UIDatePickerModeDateAndTime;
            break;
        case yearCmonthCday:
            [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
            break;
        case yearPmonthPday:
            [dateFormatter setDateFormat:@"yyyy.MM.dd"];
            break;
        case yearPmonthPdayHourMinSeconds:
            [dateFormatter setDateFormat:@"yyyy.MM.dd HH:mm:ss"];
            _cwDateP.datePickerMode = UIDatePickerModeDateAndTime;
            break;
        case yearLmonthLdayHourMin:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            _cwDateP.datePickerMode = UIDatePickerModeDateAndTime;
            break;
        case yearMonthDayMinSeconds:
            [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
            _cwDateP.datePickerMode = UIDatePickerModeDateAndTime;
            break;
        case yearMonth:
            [dateFormatter setDateFormat:@"yyyy-MM"];
            break;
        default:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
    }
    
}


- (void)dateChanged:(UIDatePicker *)sender {
    if ([sender isKindOfClass:[UIDatePicker class]]) {
        _cwDateP = sender;
        /**
         * 相对当前时间  0晚于当前时间   1早于当前时间
         */
        NSInteger beOrAf;
        if (!([[NSDate date] compare:_cwDateP.date] == NSOrderedAscending)) {
            beOrAf = 1;
        }else{
            beOrAf = 0;
        }
        
        NSString *dateString = [dateFormatter stringFromDate:_cwDateP.date];
        NSString *nowDateS = [dateFormatter stringFromDate:[NSDate date]];
        
        void (^block)(NSString * dateString,NSString *nowDateS,NSInteger befOrAft) = objc_getAssociatedObject(_cwDateP,  @"assAndBlockForKey");
        //判断使用的是block回调 还是使用的代理方法
        if (block) {
            block(dateString,nowDateS,beOrAf);
        }else {
            [_delegate changeDateS:dateString andNowDate:nowDateS andBeforeOrAfter:beOrAf];
        }
    }
}

//将datePicker移除
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //NSLog(@"=======date view = %@",touches);
//    NSEnumerator *suberViewsEnum = [cwView.subviews reverseObjectEnumerator];
//    CWDatePickerUtil * dateP = nil;
//    for (UIView *subview in suberViewsEnum) {
//        if ([subview isKindOfClass:[self class]]) {
//            dateP = (CWDatePickerUtil *)subview;
//        }
//    }
//    if(dateP) {
//        [dateP removeFromSuperview];
//    }
    
    [self.datePi removeFromSuperview];
}

@end



@implementation LoginUtil
+ (void)createLoginInfo:(LoginInfo *)loginInfo {
    
    SET_USERINFO(loginInfo.passport,USERINFO_PASSPORT);
    SET_USERINFO(loginInfo.hasCarType,USERINFO_HAS_CAR_TYPE);
    SET_USERINFO(loginInfo.logo,USERINFO_LOGO);
    SET_USERINFO(loginInfo.adminId,USERINFO_ADMIN_ID);
    SET_USERINFO(loginInfo.carId,USERINFO_CAR_ID);
    SET_USERINFO(loginInfo.phoneNum,USERINFO_PHONENUM);
    SET_USERINFO(loginInfo.licenseNum,USERINFO_LICENSE_NUM);
    SET_USERINFO(loginInfo.obdNum,USERINFO_OBDNUM);
    SET_USERINFO(loginInfo.adminName,USERINFO_ADMIN_NAME);
    SET_USERINFO(loginInfo.nickName,USERINFO_NICK_NAME);
    SET_USERINFO(loginInfo.obdStatus,USERINFO_OBD_STATUS);
    SET_USERINFO(loginInfo.adminPhone,USERINFO_ADMINPHONE);
    SET_USERINFO(loginInfo.hasOBD,USERINFO_HAS_OBD);
    SET_USERINFO(loginInfo.needUpdateHead,USERINFO_NEED_UPDATE_HEAD);
    SET_USERINFO(loginInfo.zxTel,USERINFO_ZX_TEL);
    SET_USERINFO(loginInfo.jyTel,USERINFO_JY_TEL);
    SET_USERINFO(loginInfo.bxTel,USERINFO_BX_TEL);
    
}
@end

#pragma mark - jumpUtil
@implementation JumpUtil

+ (void)jump: (UIViewController *)srcViewController andId: (NSString *)idendtifier andBackTitle:(NSString *)backTitle andTitle: (NSString *) title {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = backTitle;
    srcViewController.navigationItem.backBarButtonItem = backItem;
    UIViewController *destViewController = [srcViewController.storyboard instantiateViewControllerWithIdentifier:idendtifier];
    destViewController.title = title;
    [srcViewController.navigationController pushViewController:destViewController animated:YES];
}

@end


#pragma mark - SandBoxImageUtil
@implementation SandBoxImageUtil

+(UIImage*)getImage:(NSInteger)userType typeId:(NSInteger)typeId imageType:(NSInteger)imageType{
    NSString* path = [self getPath:userType typeId:typeId imageType:imageType];
    UIImage* image = [self getImageByPath:path];
    if (image==nil) {
        NSString* url = [self getUrl:userType typeId:typeId imageType:imageType];
        NSData* data = [self getImageDataByUrl:url];
        image = [UIImage imageWithData:data];
        [self saveImageData:data toPath:path];
    }
    return image;
}

+(UIImage*)getImageByPath:(NSString*)path{
    
    UIImage *img = [UIImage imageWithContentsOfFile:path];
    return img;
}

+(NSData*)getImageDataByUrl:(NSString*)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];
    return [NSData dataWithContentsOfURL:url];
}

+(NSString*)getPath:(NSInteger)userType typeId:(NSInteger)typeId imageType:(NSInteger)imageType{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"headImage"];   // 保存文件的名
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"headImage"];   // 保存文件的名称
    NSString* suf = @"";
    
    if (imageType == IMAGE_TYPE_M) {
        suf = IMAGE_TYPE_SUF_M;
    }else if (imageType == IMAGE_TYPE_S){
        suf = IMAGE_TYPE_SUF_S;
    }else if (imageType == IMAGE_TYPE_O){
        suf = IMAGE_TYPE_SUF_O;
    }else{
        suf = @"";
    }
    
    if (userType==CAR_TYPE) {
        return  [filePath stringByAppendingPathComponent:[NSString stringWithFormat:CAR_IMAGE_PATH,(int)typeId,suf]];
    }else if (userType==ADMIN_TYPE){
        return  [filePath stringByAppendingPathComponent:[NSString stringWithFormat:ADMIN_IMAGE_PATH,(int)typeId,suf]];
    }else{
        return @"";
    }
}

+(NSString*)getUrl:(NSInteger)userType typeId:(NSInteger)typeId imageType:(NSInteger)imageType{
    
    NSString* suf = @"";
    
    if (imageType == IMAGE_TYPE_M) {
        suf = IMAGE_TYPE_SUF_M;
    }else if (imageType == IMAGE_TYPE_S){
        suf = IMAGE_TYPE_SUF_S;
    }else if (imageType == IMAGE_TYPE_O){
        suf = IMAGE_TYPE_SUF_O;
    }else{
        suf = @"";
    }
    
    if (userType==CAR_TYPE) {
        return [NSString stringWithFormat:CAR_IMAGE_URL,(int)typeId%1000,(int)typeId,(int)typeId,suf];
    }else if (userType==ADMIN_TYPE){
        return [NSString stringWithFormat:ADMIN_IMAGE_URL,(int)typeId%1000,(int)typeId,(int)typeId,suf];
    }else{
        return @"";
    }
}

+(void)saveImageData:(NSData*)data toPath:(NSString*)path{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *headImageDirectory = [documentsDirectory stringByAppendingPathComponent:@"headImage"];
    
    if (![fileManager fileExistsAtPath:headImageDirectory]) {
        [fileManager createDirectoryAtPath:headImageDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
}

+(void)saveImageForAllSize:(NSData*)data userType:(NSInteger)userType typeId:(NSInteger)typeId{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *headImageDirectory = [documentsDirectory stringByAppendingPathComponent:@"headImage"];
    if (![fileManager fileExistsAtPath:headImageDirectory]) {
        [fileManager createDirectoryAtPath:headImageDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString* path = [self getPath:userType typeId:typeId imageType:IMAGE_TYPE_S];
    [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
    path = [self getPath:userType typeId:typeId imageType:IMAGE_TYPE_M];
    [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
    path = [self getPath:userType typeId:typeId imageType:IMAGE_TYPE_O];
    [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
}

+(void)removeAllHeadImage{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *headImageDirectory = [documentsDirectory stringByAppendingPathComponent:@"headImage"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:headImageDirectory error:nil];
}

@end


#pragma mark - AFAppDotNetAPIClient
@implementation AFAppDotNetAPIClient

//+ (instancetype)sharedClient {
//    static AFAppDotNetAPIClient *_sharedClient = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:URL_PREFIX]];
//        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        // 设置10秒超时 改为15秒
//        _sharedClient.requestSerializer.timeoutInterval = 15;
//        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//        [_sharedClient.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//            switch (status) {
//                case AFNetworkReachabilityStatusReachableViaWWAN:
//                    LOG(@"123123-------AFNetworkReachabilityStatusReachableViaWWAN------");
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWiFi:
//                    LOG(@"123123-------AFNetworkReachabilityStatusReachableViaWiFi------");
//                    break;
//                case AFNetworkReachabilityStatusNotReachable:
//                    LOG(@"123123-------AFNetworkReachabilityStatusNotReachable------");
//                    break;
//                default:
//                    break;
//            }
//        }];
//        [_sharedClient.reachabilityManager startMonitoring];
//    });
//    return _sharedClient;
//}


+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:URL_PREFIX]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        //_sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [_sharedClient.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    NSLog(@"-------AFNetworkReachabilityStatusReachableViaWWAN------");
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    NSLog(@"-------AFNetworkReachabilityStatusReachableViaWiFi------");
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    NSLog(@"-------AFNetworkReachabilityStatusNotReachable------");
                    break;
                default:
                    break;
            }
        }];
        [_sharedClient.reachabilityManager startMonitoring];
    });
    return _sharedClient;
}



/**
 *  post请求
 * @param  URLString        url
 * @param  parameters       请求参数
 * @param  block            回调函数
 */
- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters compeletion:(void(^)(NSURLSessionDataTask *task,id responseObject, NSError *error))block {
    
//    if ([GET_USERINFO(USERINFO_PASSPORT) isEqualToString:@"visitorLogin_chewen"]) {
//        
//        [self visitorRequest:URLString parameters:parameters and:block];
//        
//        return nil;
//    }else {
        return  [self POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            LOG(@"URL = %@ ,=== post请求 = %@",URLString,responseObject);
            block(task,responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
               LOG(@"错误信息error =  %@",error);
            block(task,nil,error);
        }];
//    }

}


/**
 *  get请求
 * @param  URLString        url
 * @param  parameters       请求参数
 * @param  block            回调函数
 */
- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters compeletion:(void(^)(NSURLSessionDataTask *task,id responseObject, NSError *error))block {
    
    
//    if ([GET_USERINFO(USERINFO_PASSPORT) isEqualToString:@"visitorLogin_chewen"]) {
//        
//        [self visitorRequest:URLString parameters:parameters and:block];
//        return nil;
//        
//    }else {
    
        return [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            LOG(@"URL = %@ ,=== get请求 = %@",URLString,responseObject);
            
            block(task,responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            block(task,nil,error);
        }];
//    }
}


/**
 * 游客登录的网络请求
 */
- (void)visitorRequest:(NSString *)URLString parameters:(id)parameters and:(void(^)(NSURLSessionDataTask *task,id responseObject, NSError *error))block{
    
    //小秘请求 游客登录
    if ([URLString isEqualToString:@"messageList"]) {
        
        [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            block(task,responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            block(task,nil,error);
        }];
        return;
    }
    
    
    //判断优惠劵的状态 ：全部0 未使用1  已使用2  过期3   pageNo>1 加载更多
    if ([[parameters objectForKey:@"status"]intValue] == 2 ||[[parameters objectForKey:@"status"]intValue] == 3 || [[parameters objectForKey:@"pageNo"]intValue] >1) {
        URLString = @"coupons/all23";
    }
    
    //月数据
    if ([[parameters objectForKey:@"type"]intValue] == 2) {
         URLString = @"tripStatisticsWith4jMonth";
    }
    //周数据
    if ([[parameters objectForKey:@"type"]intValue] == 1) {
        URLString = @"tripStatisticsWith4jWeek";
    }
    
    //游客登录是  下面的这几种情况不进行数据请求
    if ([URLString isEqualToString:@"noticeUnRead"] || [URLString isEqualToString:@"insuranceStatus"] || [URLString isEqualToString:@"serveDealer"] || [URLString isEqualToString:@"showJifenRenwu"]) {
        
    }else{
        NSMutableDictionary * repon = [[VisitorJsonData shareVisitorData]getVisitorDic:URLString];
        if (repon) {
            
            block(nil,repon,nil);
            
        }else {
            repon = [[NSMutableDictionary alloc]init];
            [repon setObject:@"1" forKey:@"code"];
            [repon setObject:@"模拟账号" forKey:@"msg"];
            block(nil,repon,nil);
        }
        
    }
}


@end



@implementation ShareUtil

//根据图层进行截图
+(UIImage *)screenShots:(id)sender
{
    UIViewController *vc = (UIViewController *) sender;
    //截图
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(CGRectGetWidth(vc.view.frame), CGRectGetHeight(vc.view.frame)), NO, 2.0);
    [vc.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    return image;
    
}

@end

#pragma mark - PCodeUtil
@implementation PCodeUtil

+ (void)init {
    NSString *resource = [[NSBundle mainBundle] pathForResource:@"pcode" ofType:@"plist"];
    PCODE_DATA = [NSDictionary dictionaryWithContentsOfFile:resource];
}

+ (NSDictionary*)getPCodeData {
    return PCODE_DATA;
}

@end



#pragma mark - UserInfo
@implementation UserInfo
+(LoginInfo*)getUserInfoFromApp
{
    NSDictionary * dic =  [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    LoginInfo * loginInfo = [[LoginInfo alloc] initWithDictionary:dic];
    return  loginInfo;
}

+(NSMutableAttributedString*)attributedStringWithString:(NSString*)string
{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]
                                                    initWithString:string];
    //段落
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0];
    // 富文本显示
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [string length])];
    return attributedString;
}

+(CGFloat)calculateHeightWithString:(NSString*)contentStr andMinSize:(CGFloat)minSize
{
    CGSize textBlockMinSize = {minSize, CGFLOAT_MAX};
    CGSize retSize;
    //绘制文本 根据系统匹配方法
    if (IS_ABOVE_IOS7) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:0];//调整行间距
        
        retSize = [contentStr boundingRectWithSize:textBlockMinSize options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{
                                                     NSFontAttributeName:[UIFont systemFontOfSize:14],
                                                     NSParagraphStyleAttributeName:paragraphStyle
                                                     }
                                           context:nil].size;
    }else{
        retSize = [contentStr sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:textBlockMinSize lineBreakMode:NSLineBreakByCharWrapping];
    }
    
    
    return retSize.height;
}

+ (CGSize)calculateWidthString:(NSString *)str andFont:(UIFont *)font
{
    CGSize baseSize = {MAXFLOAT, MAXFLOAT};
    CGSize retSize;
    if (IS_ABOVE_IOS7) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        retSize = [str boundingRectWithSize:baseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    } else {
        retSize = [str sizeWithFont:font constrainedToSize:baseSize lineBreakMode:NSLineBreakByCharWrapping];
    }
    return retSize;
}



@end


#pragma mark - 游客登录

@interface VisitorJsonData()
@property (nonatomic, strong) NSMutableDictionary *dataDicVisitor;

@end

@implementation VisitorJsonData

+ (instancetype)shareVisitorData {
    static VisitorJsonData *_visitorData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _visitorData = [[VisitorJsonData alloc]init];
        
    });
    return _visitorData;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
//        _dataDicVisitor = [[NSMutableDictionary alloc]init];
        NSString * path = [[NSBundle mainBundle]pathForResource:@"visitorAllData" ofType:@"json"];
        _dataDicVisitor = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:nil];
    }
    return self;
}


- (NSMutableDictionary *)getVisitorDic:(NSString *)dicKey {
    NSMutableDictionary * dataDic = [_dataDicVisitor objectForKey:dicKey];
    return dataDic;
}




@end


@interface TimeSelectTool()

@end

@implementation TimeSelectTool

+ (NSDate *)lastMonth:(NSDate *)date{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
    
    return newDate;
}

// 下一个月
+ (NSDate *)nextMonth:(NSDate *)date{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
    return newDate;
}

// 上一 day
+ (NSDate *)lastDay:(NSDate *)date{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
    
    return newDate;
}

// 下一 day
+ (NSDate *)nextDay:(NSDate *)date{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = 1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
    return newDate;
}


// 上一个周
+ (NSDate *)lastWeek:(NSDate *)date{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekdayOrdinal = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
    
    return newDate;
}

// 下一个月周
+ (NSDate *)nextWeek:(NSDate *)date{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekdayOrdinal = 1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
    return newDate;
}

@end


@implementation LayoutClass

+(void)view:(UIView *)superView andView:(UIView *)subView {
    
    __block UIView  *weakSuperView = superView;
    __block UIView  *weakSubView = subView;
    
    [weakSuperView addSubview:weakSubView];
    
    /*
     tag = 0 viewController的view
     tag = 1 tableview
     tag = 2 contentView
     tag = 3 label
     */
    
   // if (weakSuperView.tag == 0 && weakSubView.tag == 1) {
        [weakSubView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSuperView).with.insets(UIEdgeInsetsMake(64,0,ASX(60),0));
        }];
   // }
    
//    
//    if (weakSuperView.tag == 2 && weakSubView.tag == 3) {
//        weakSubView.backgroundColor = [UIColor redColor];
//        [weakSubView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(weakSuperView).with.insets(UIEdgeInsetsMake(20,0,0,0));
//        }];
//    }

}

@end


