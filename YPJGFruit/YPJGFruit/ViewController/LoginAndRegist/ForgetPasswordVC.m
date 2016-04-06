//
//  ForgetPasswordVC.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/3.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "ForgetPasswordVC.h"
#import "CWTextFieldView.h"
#import "CWButton.h"

@interface ForgetPasswordVC ()
{
    int timeNumber;
    CWButton *getPassB;
 
}


@property (nonatomic, strong) CWTextFieldView *userName;
@property (nonatomic, strong) CWTextFieldView *verification;
@property (nonatomic, strong) CWTextFieldView *password;
@property (nonatomic, strong) CWTextFieldView *dupPassword;

@property (nonatomic, strong) UILabel *getVerifLabel;
@property (nonatomic, strong) NSTimer *watingTimer;

@end

@implementation ForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"找回密码";
    timeNumber = 60;
    [self createView];
}

- (void)createView {
    
    kWeakSelf;
    CGFloat height1 = 290;
   
    //4s中的高度
    if (SCREEN_HEIGHT < 568) {
        height1 = 200;
    }
    
    UIButton *submit = [[UIButton alloc]init];
    [self.view addSubview:submit];
    submit.backgroundColor = [UIColor colorWithFourTwoButtonColor];
    [submit setTitle:@"提 交" forState:UIControlStateNormal];
    submit.titleLabel.font = cwFont(18);
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    submit.tag = 0;
    
    [submit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-height1*SCREEN_SCALE);
        make.width.equalTo(@(260));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.height.equalTo(@(44*SCREEN_SCALE));
    }];
    
    self.dupPassword = [[CWTextFieldView alloc]init];
    [self.view addSubview:self.dupPassword];
    self.dupPassword.textField.placeholder = @"再次输新密码";
    self.dupPassword.textField.secureTextEntry = YES;
    self.dupPassword.isDrawLine = YES;
    [self.dupPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(submit.mas_top).offset(-44*SCREEN_SCALE);
        make.centerX.height.width.equalTo(submit);
    }];
    
    self.password = [[CWTextFieldView alloc]init];
    [self.view addSubview:self.password];
    self.password.textField.placeholder = @"输入新密码";
    self.password.textField.secureTextEntry = YES;
    self.password.isDrawLine = YES;
    [self.password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_dupPassword.mas_top).offset(-5*SCREEN_SCALE);
        make.centerX.height.width.equalTo(submit);
    }];
    
    self.verification = [[CWTextFieldView alloc]init];
    [self.view addSubview:self.verification];
    self.verification.textField.placeholder = @"验证码";
    self.verification.isDrawLine = YES;
    [self.verification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_password.mas_top).offset(-5*SCREEN_SCALE);
        make.centerX.height.width.equalTo(submit);
    }];
    
    //验证码
    getPassB = [[CWButton alloc]init];
    [self.view addSubview:getPassB];
    [getPassB setTitle:@"获取验证码" forState:UIControlStateNormal];
    getPassB.titleLabel.font = cwFont(15);
    [getPassB setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    getPassB.isDrawLeftLine = YES;
    getPassB.leftLineColor = cwGreyColor;
    getPassB.leftThanFontHeight = 4;
    [getPassB addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    getPassB.tag = 1;
    
    [getPassB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf.verification);
        make.left.equalTo(weakSelf.verification.mas_right).offset(-90);
        make.width.equalTo(@90);
    }];
    
    self.userName = [[CWTextFieldView alloc]init];
    [self.view addSubview:self.userName];
    self.userName.textField.placeholder = @"用户姓名";
    self.userName.isDrawLine = YES;
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_verification.mas_top).offset(-5*SCREEN_SCALE);
        make.centerX.height.width.equalTo(submit);
    }];
    
    //获取验证码
    
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0://提交
        {
            [self userSubmit];
        }
            break;
        case 1://验证码
        {
            if (self.userName.textField.text == nil||[self.userName.textField.text isEqualToString:@""]) {
                AlertMsg(@"请输入手机号码");
                return;
            }
    
            if (timeNumber == 60) {
                _watingTimer = [NSTimer  scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
                [self getUserVerfication];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)userSubmit {
    if (![self.password.textField.text isEqualToString:self.dupPassword.textField.text]) {
        AlertMsg(@"您输入的密码不一致，请您重新输入！");
    }else if ([self.password.textField.text isEqualToString:@""]||[self.dupPassword.textField.text isEqualToString:@""]
              ||[self.userName.textField.text isEqualToString:@""]||[self.verification.textField.text isEqualToString:@""]) {
        AlertMsg(@"输入信息不能为空，请您重新输入");
    }else if(self.dupPassword.textField.text.length < 6 ){
        AlertMsg(@"密码位数设置不能少于6位，请重新输入！");
    }else{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
        [CSDataRequest fetchForgetWord:self.userName.textField.text vcode:self.verification.textField.text password:self.password.textField.text confirmpassword:self.dupPassword.textField.text compeletion:^(CWBaseModel *response, NSError *error) {
             LOG(@"找回密码 response = %@  error = %@",response,error);
            if (error) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                ErrorMsg(error,0);
                return;
            }
            if (response.code==0 && error == nil)
            {
                AlertMsg(@"修改密码成功！");
                //关闭烽火轮
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
            else
            {
                AlertMsg(response.msg);
                //关闭烽火轮
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
        }];
    }


}

-(void)getUserVerfication {
    [CSDataRequest fetchVerifyCode:self.userName.textField.text compeletion:^(CWBaseModel *response, NSError *error) {
        LOG(@"找回密码获取验证码 response = %@  error = %@",response,error);
        if (error || response == nil) {
            ErrorMsg(error,0);
            return;
        }
        if (response.code == 0) {
            AlertMsg(@"发送验证码成功！");
            //            [MBProgressHUD hideHUDForView:self.view animated:YES];
        } else {
            AlertMsg(response.msg);
            //            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];

}


- (void)timerClick {
    timeNumber--;
    [getPassB setTitle:[NSString stringWithFormat:@"%ds后获取",timeNumber] forState:UIControlStateNormal];
    if (timeNumber <= 0) {
        timeNumber = 60;
        [getPassB setTitle:@"获取验证码" forState:UIControlStateNormal];
        
        [self.watingTimer invalidate];
        self.watingTimer = nil;
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
