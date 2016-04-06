//
//  RegistrationVC.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/2.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "RegistrationVC.h"
#import "CWTextFieldView.h"
#import "CWButton.h"
#import "NSString+Util.h"

@interface RegistrationVC ()
{
    int timeNumber;
    CWButton *getPassB;
}

@property (nonatomic, strong) CWTextFieldView *password;
@property (nonatomic, strong) CWTextFieldView *phone;
@property (nonatomic, strong) CWTextFieldView *userName;
@property (nonatomic, strong) CWTextFieldView *codeTextF;
@property (nonatomic, strong) NSTimer *watingTimer;
@end

@implementation RegistrationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    timeNumber = 60;
    [self createView];
    
}

- (void)createView {
    CGFloat height1 = 80;
    CGFloat height2 = 180;
    //4s中的高度
    if (SCREEN_HEIGHT < 568) {
        height1 = 50;
        height2 = 110;
    }
    
    kWeakSelf;
    CWButton *loginB = [[CWButton alloc]init];
    [loginB setTitle:@"立即登录" forState:UIControlStateNormal];
    [loginB setTitleColor:[UIColor colorWithHexString:@"000000"] forState:UIControlStateNormal];
    [loginB.titleLabel setFont:cwFont(15)];
    loginB.isDrawBottomLine = YES;
    loginB.bottomLineColor = cwGreyColor;
    [self.view addSubview:loginB];
    [loginB addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    loginB.tag = 1;
    
    [loginB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-height1*SCREEN_SCALE);
        make.left.equalTo(weakSelf.view.mas_centerX);
        make.height.equalTo(@(20*SCREEN_SCALE));
    }];
    
    UILabel *accountLabel = [[UILabel alloc]init];
    accountLabel.text = @"已有账号 ";
    accountLabel.font = cwFont(15);
    accountLabel.textColor = [UIColor colorWithSevenCFontColor];
    [self.view addSubview:accountLabel];
    [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(loginB.mas_bottom);
        make.right.equalTo(loginB.mas_left);
        make.height.equalTo(loginB.mas_height);
    }];
    
    UIButton *agreementButton = [[UIButton alloc]init];
    [agreementButton setTitle:@"点击注册表示您同意汽车秘书《服务协议》" forState:UIControlStateNormal];
    [agreementButton setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    [agreementButton.titleLabel setFont:cwFont(12)];
    [self.view addSubview:agreementButton];
    
    [agreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@12);
        make.bottom.equalTo(loginB.mas_top).offset(-height2*SCREEN_SCALE);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
    }];
    
    UIButton *registButton = [[UIButton alloc]init];
    [self.view addSubview:registButton];
    registButton.backgroundColor = [UIColor colorWithSevenCFontColor];
    [registButton setTitle:@"注 册" forState:UIControlStateNormal];
    registButton.titleLabel.font = cwFont(18);
    [registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    registButton.tag = 2;
    
    [registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(agreementButton.mas_top).offset(-10*SCREEN_SCALE);
        make.width.equalTo(@(260));
        make.centerX.equalTo(agreementButton.mas_centerX);
        make.height.equalTo(@(44*SCREEN_SCALE));
    }];
    
    

    self.password = [[CWTextFieldView alloc]init];
    [self.view addSubview:self.password];
    self.password.textField.placeholder = @"密码";
    self.password.textField.secureTextEntry = YES;
    self.password.isDrawLine = YES;
    
    [self.password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(registButton.mas_top).offset(-44*SCREEN_SCALE);
        make.height.width.centerX.equalTo(registButton);
    }];
    
    
    //获取密码
    getPassB = [[CWButton alloc]init];
    [self.view addSubview:getPassB];
    [getPassB setTitle:@"获取密码" forState:UIControlStateNormal];
    getPassB.titleLabel.font = cwFont(15);
    [getPassB setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    getPassB.isDrawLeftLine = YES;
    getPassB.leftLineColor = cwGreyColor;
    getPassB.leftThanFontHeight = 4;
    [getPassB addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    getPassB.tag = 3;
    
    [getPassB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf.password);
        make.left.equalTo(weakSelf.password.mas_right).offset(-90);
        make.width.equalTo(@90);
    }];
    
    

    self.phone = [[CWTextFieldView alloc]init];
    [self.view addSubview:self.phone];
    self.phone.textField.placeholder = @"手机号码";
    self.phone.isDrawLine = YES;
    
    [self.phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.password.mas_top).offset(-7*SCREEN_SCALE);
        make.height.width.centerX.equalTo(registButton);
    }];
    
    //邀请码
    self.codeTextF = [[CWTextFieldView alloc]init];
    self.codeTextF.textField.placeholder = @"邀请码";
    self.codeTextF.isDrawLeftLine = YES;
    self.codeTextF.textField.font = cwFont(13);
    self.codeTextF.leftLineColor = cwGreyColor;
    [self.view addSubview:self.codeTextF];
    [self.codeTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.phone).offset(-3);
        make.top.equalTo(weakSelf.phone).offset(3);
        make.left.equalTo(getPassB.mas_left);
        make.width.equalTo(@120);
    }];
    

    self.userName = [[CWTextFieldView alloc]init];
    [self.view addSubview:self.userName];
    self.userName.textField.placeholder = @"用户名：";
    self.userName.isDrawLine = YES;
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.phone.mas_top).offset(-7*SCREEN_SCALE);
        make.height.width.centerX.equalTo(registButton);
    }];
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
        {
        
        }
            break;
            
        case 1://登录
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
            
        case 2://注册
        {
            [self reginrationUser];
        }
            break;
        case 3://获取密码
        {
            if (self.phone.textField.text == nil||[self.phone.textField.text isEqualToString:@""]) {
                AlertMsg(@"请输入手机号码");
                return;
            }
            if (timeNumber == 60) {
                _watingTimer = [NSTimer  scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
                [self getUserPassword];
                
            }
            
        }
            break;
            
        default:
            break;
    }
}

//注册用户
- (void)reginrationUser {
    RegistrationParam *param = [[RegistrationParam alloc] init];
    
    if ([NSString isBlank:self.userName.textField.text]) {
        AlertMsg(@"姓名不能为空");
        return;
    }
    param.userName = [NSString trim:self.userName.textField.text];
    
    if ([NSString isBlank:self.phone.textField.text]) {
        AlertMsg(@"手机号码不能为空");
        return;
    }
    if (![NSString isPhoneNum:self.phone.textField.text]) {
        AlertMsg(@"手机号码格式不正确");
        return;
    }
    param.phoneNum = [NSString trim:self.phone.textField.text];
    
    if ([NSString isBlank:self.password.textField.text]) {
        AlertMsg(@"密码不能为空");
        return;
    }
    param.vcode = [NSString trim:self.password.textField.text];
    param.inviteCode = _codeTextF.textField.text;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [CSDataRequest doRegistration:param completion:^(RegistrationResponse *response, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        LOG(@"用户注册 response = %@  error = %@",response,error);
        if (error || response == nil) {
            ErrorMsg(error,0);
            return;
        }
        
        if (response.code != 0) {
            if ([NSString isBlank:response.msg]) {
                NSString *msg = [NSString stringWithFormat:@"请求错误，异常码:%@", @(response.code)];
                AlertMsg(msg);
            } else {
                AlertMsg(response.msg);
            }
            return;
        }
        AlertMsg(@"恭喜您已注册成功");
        [[NSUserDefaults standardUserDefaults] setObject:self.phone.textField.text forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:self.password.textField.text forKey:@"password"];
        [self.navigationController popViewControllerAnimated:YES];
    }];

    
    
}


//获取密码
- (void)getUserPassword {
  [CSDataRequest fetchPassword:[NSString trim:self.phone.textField.text] completion:^(CWBaseModel *response, NSError *error) {
      LOG(@"获取密码 response = %@  error = %@",response,error);
      if (error || response == nil) {
          ErrorMsg(error,0);
          return;
      }
      
      if (response.code != 0) {
          if ([NSString isBlank:response.msg]) {
              NSString *msg = [NSString stringWithFormat:@"请求错误，异常码:%@", @(response.code)];
              AlertMsg(msg);
          } else {
              AlertMsg(response.msg);
          }
          return;
      }
      
      AlertMsg(@"获取密码成功，请注意查收短信");
  }];
}


- (void)timerClick {
    timeNumber--;
    
    
    [getPassB setTitle:[NSString stringWithFormat:@"%ds后获取",timeNumber] forState:UIControlStateNormal];
    if (timeNumber <= 0) {
        timeNumber = 60;
        [getPassB setTitle:@"获取密码" forState:UIControlStateNormal];
        
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
