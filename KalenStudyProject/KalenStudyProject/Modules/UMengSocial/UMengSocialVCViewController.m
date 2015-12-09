//
//  UMengSocialVCViewController.m
//  KalenStudyProject
//
//  Created by kalen on 15/11/16.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "UMengSocialVCViewController.h"


@interface UMengSocialVCViewController ()<UMSocialUIDelegate>

@end

@implementation UMengSocialVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    
    [self.view addSubview:label];
    
    label.text = NSLocalizedString(@"demo", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shareButton:(UIButton *)sender {
    
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:UMENG_APPKEY
//                                      shareText:@"你要分享的文字"
//                                     shareImage:[self screenShots]
//                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToWechatTimeline,nil]
//                                       delegate:self];
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UMENG_APPKEY
                                      shareText:@"你要分享的文字"
                                     shareImage:[self screenShots]
                                shareToSnsNames:nil
                                       delegate:self];
}



//根据图层进行截图
-(UIImage *)screenShots
{
    //截图
    UIGraphicsBeginImageContext(self.shareVIew.frame.size);
    [self.shareVIew.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);//（将截图保存到相册中）
    return viewImage;
    
}

//实现回调方法（可选）：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

-(BOOL)isDirectShareInIconActionSheet
{
    return YES;
}


@end
