//
//  LoginViewController.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/2.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistrationVC.h"
#import "CWTextFieldView.h"
#import "ForgetPasswordVC.h"
#import "CWButton.h"
#import "RemindedTableView.h"



@interface LoginViewController ()
{
    //手机号和密码列表
    NSMutableArray * phonePasswordArray;
    
    //tableView的高度
    CGFloat phoneTableViewH;
    
    //错误信息提示语
    UILabel *desLabel;
    
    
}
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registButton;

@property (nonatomic, strong) CWTextFieldView *userName;
@property (nonatomic, strong) CWTextFieldView *userPassword;


@property (nonatomic, strong) UIImageView *arrowIV;

@property (nonatomic, strong) RemindedTableView *remindTableView;
@end

@implementation LoginViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    desLabel.hidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *phones = [[NSUserDefaults standardUserDefaults]objectForKey:@"savePhoneAndPassword"];
    if (phones) {
        phonePasswordArray = [phones mutableCopy];
    }else {
        phonePasswordArray = [NSMutableArray array];
    }
    
    
//    //使用代理的时候没有调用代理方法，改用系统的通知
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textBegin:) name:UITextFieldTextDidBeginEditingNotification object:self.userName];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textEnd:) name:UITextFieldTextDidEndEditingNotification object:self.userPassword];
    
  
    [self createView];
    if ([phonePasswordArray count] >=1 ) {
        NSDictionary * ppD = [phonePasswordArray lastObject];
        self.userName.textField.text = [ppD objectForKey:@"phone"];
        self.userPassword.textField.text = [ppD objectForKey:@"password"];
        
    } else {
        
        self.userName.textField.text = @"";
        self.userPassword.textField.text = @"";
    }
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView {
    kWeakSelf;
    CWButton *forgetPassword = [[CWButton alloc]init];
    [forgetPassword setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPassword setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    forgetPassword.isDrawBottomLine = YES;
    forgetPassword.bottomLineColor = cwGreyColor;
    forgetPassword.titleLabel.font = cwFont(15);
    [self.view addSubview:forgetPassword];
    forgetPassword.tag = 1;
    [forgetPassword addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [forgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-37*SCREEN_SCALE);
        make.height.equalTo(@(20*SCREEN_SCALE));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
    }];
    
    
    self.registButton = [[UIButton alloc]init];
    [self.view addSubview:self.registButton];
    self.registButton.layer.borderColor = cwGreyColor.CGColor;
    self.registButton.layer.borderWidth = 1.0f;
    [self.registButton setTitle:@"注 册" forState:UIControlStateNormal];
    self.registButton.titleLabel.font = cwFont(18);
    [self.registButton setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    [self.registButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    self.registButton.tag = 2;
    
    [self.registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(forgetPassword.mas_top).offset(-20*SCREEN_SCALE);
        make.width.equalTo(@(260));
        make.centerX.equalTo(forgetPassword.mas_centerX);
        make.height.equalTo(@(44*SCREEN_SCALE));
    }];
    
    
    self.loginButton = [[UIButton alloc]init];
    [self.view addSubview:self.loginButton];
    self.loginButton.backgroundColor = [UIColor colorWithFourTwoButtonColor];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = cwFont(18);
    [self.loginButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.tag = 3;
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_registButton.mas_top).offset(-10*SCREEN_SCALE);
        make.height.left.right.centerX.equalTo(_registButton);
    }];
    
    desLabel = [[UILabel alloc]init];
    [self.view addSubview:desLabel];
    desLabel.font = cwFont(12);
    desLabel.textColor = [UIColor colorWithFFButtonColor];
    desLabel.text = @"请输入正确的手机号或密码！";
    desLabel.hidden = YES;
    
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_loginButton.mas_top).offset(-25*SCREEN_SCALE);
        make.centerX.equalTo(_loginButton.mas_centerX);
    }];
    
    self.userPassword = [CWTextFieldView new];
    [self.view addSubview:self.userPassword];
    self.userPassword.textField.secureTextEntry = YES;
    self.userPassword.textField.placeholder = @"请输入密码";
    self.userPassword.isDrawLine = YES;
    
    [self.userPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desLabel.mas_top).offset(-7*SCREEN_SCALE);
        make.height.width.centerX.equalTo(weakSelf.loginButton);
    }];
    

    self.userName = [[CWTextFieldView alloc]init];
    [self.view addSubview:self.userName];
    self.userName.textField.placeholder = @"用户名";
    self.userName.isDrawLine = YES;
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.userPassword.mas_top).offset(-5*SCREEN_SCALE);
        make.height.width.centerX.equalTo(weakSelf.loginButton);
    }];
    
    
    //箭头按钮
    UIButton *arrowButton = [[UIButton alloc]init];
    [arrowButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    arrowButton.tag = 4;
    [self.view addSubview:arrowButton];
    [arrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf.userName);
        make.right.equalTo(weakSelf.userName.mas_right);
        make.width.equalTo(@50);
    }];
    
    self.arrowIV = [[UIImageView alloc]init];
    self.arrowIV.image = [CWUtil imageRotation:UIImageOrientationUp];
    [self.view addSubview:self.arrowIV];
    [self.arrowIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(arrowButton);
        make.width.height.equalTo(@20);
    }];
    
    
    _remindTableView = [RemindedTableView phonePasswordTableView:phonePasswordArray andView:self.userName compeletion:^(RemindedTableView *remindPPArray) {
        phonePasswordArray = remindPPArray.phonePasswordArray;
        
        if ([remindPPArray.selectOrDeleget isEqualToString:@"1"]) {
            
            [_userName resignFirstResponder];
            
            weakSelf.userName.textField.text = remindPPArray.phone;
            weakSelf.userPassword.textField.text = remindPPArray.password;
            
            //箭头按钮的方向
            self.arrowIV.image = [CWUtil imageRotation:UIImageOrientationUp];
            
        } else {
            phoneTableViewH = remindPPArray.frame.size.height;
        }
        
    }];
    
    [self.view addSubview:_remindTableView];
}

- (void)setBarItem {
    [super setBarItem];
    //设置右侧注册按钮
 
    CWButton *backButton = [[CWButton alloc]initWithFrame:CGRectMake(0, 0, 80, 33)];
    backButton.isDrawRightLine = YES;
    backButton.isDrawLeftLine = YES;
    [backButton setTitle:@"游客登录" forState:UIControlStateNormal];
    [backButton.titleLabel setFont:cwFont(16)];
 
 
    [backButton setTitleColor:[UIColor colorWithThreeDFontColor] forState:UIControlStateNormal];
    //设置 注册按钮的触发事件
    backButton.tag =0;
    [backButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setRightBarButtonItem:backItem];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)onClick:(UIButton *)sender {
    switch (sender.tag) {
            
        case 0://游客登录
        {
           
            
        }
            break;
            
            case 1://忘记密码
        {
            ForgetPasswordVC * forgVC =[[ForgetPasswordVC alloc]init];
            [self.navigationController pushViewController:forgVC animated:YES];
        }
            break;
            
        case 2: //注册
        {
            RegistrationVC *registrationVC = [[RegistrationVC alloc]init];
            [self.navigationController pushViewController:registrationVC animated:YES];
        }
            break;
            
        case 3: //登录
        {
            [self userLogin];
            
        }
            break;
        case 4://账号 记录
        {
            if (self.arrowIV.image.imageOrientation == UIImageOrientationUp) {
                self.arrowIV.image = [CWUtil imageRotation:UIImageOrientationDown];
                [_remindTableView changeMove];
            }else if (self.arrowIV.image.imageOrientation == UIImageOrientationDown) {
                self.arrowIV.image = [CWUtil imageRotation:UIImageOrientationUp];
                [_remindTableView downMove];
            }
        }
            break;
            
            
        default:
            break;
    }
}


- (void)userLogin{
    if (1) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        LoginParam *param = [[LoginParam alloc] init];
        param.phoneNum = self.userName.textField.text;
        param.password = self.userPassword.textField.text;
        NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
        if (!token) {
            token = @"1";
        }
        param.token = token;
        [CSDataRequest login:param compeletion:^(LoginResponse *response, NSError *error) {
            NSLog(@"end:%@", [NSDate date]);
            LOG(@"用户登录 response = %@  error = %@",response,error);
            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            if (error || response == nil) {
//                
//               NSString * errorString = [CWUtil checkErrorMessage:error];
//                [self errorMessageShow:errorString];
//                
//                
//                return;
//            }
//            if (response.code == 0 ) {
            
//                LoginInfo *loginInfo = response.data;
//                [LoginUtil createLoginInfo:loginInfo];
            
                
//                [self savePhoneAndPassword];
                [self presentViewController:[[CWTabBarController alloc] init] animated:YES completion:nil];
//            }else {
//                AlertMsg(response.msg);
//                [self errorMessageShow:response.msg];
//            }
        }];
    }
}



- (void)errorMessageShow:(NSString *)desString{
    desLabel.hidden = NO;
    desLabel.text =desString;
    
//    [CWUtil scaleToShow:desLabel];
    
}

- (BOOL)checkInput{
    if ([self.userPassword.textField.text isEqualToString:@""] || [self.userName.textField.text isEqualToString:@""]) {
       
        [self errorMessageShow:@"账号或密码不能为空，请您重新输入!"];
 
        return FALSE;
    } else if (self.userPassword.textField.text.length < 6 ){
        
        [self errorMessageShow:@"密码位数设置不能少于6位，请重新输入！"];
 
        return FALSE;
    } else {
        return TRUE;
    }
    
}


// 保存用户填写的账号和密码   在登录成功的时候 保存
- (void)savePhoneAndPassword {
    NSDictionary *phonePassword = nil;
    
    //保存 手机号  和 密码
    phonePassword  = @{@"phone":_userName.textField.text,@"password":_userPassword.textField.text};
    
    
    //保存先判断  是否已经保存过了
    int indx = 0;
    for (int i = 0; i < [phonePasswordArray count]; i ++) {
        //NSLog(@" count =%ld   i =%d",[phonePasswordArray count],i);
        NSDictionary *oneDic = [phonePasswordArray objectAtIndex:i];
        if([[oneDic objectForKey:@"phone"] isEqualToString:[phonePassword objectForKey:@"phone"]]) {
            indx = i+1;
        }
    }
    if (indx > 0) {
        [phonePasswordArray removeObjectAtIndex:indx-1];
    }
    
    //最多保持6个数据
    if ([phonePasswordArray count] > 6) {
        [phonePasswordArray removeObjectAtIndex:0];
    }
    
    [phonePasswordArray addObject:phonePassword];
    [[NSUserDefaults standardUserDefaults]setObject:phonePasswordArray forKey:@"savePhoneAndPassword"];
}





//- (UIImage *)imageRotation:(UIImageOrientation)imageOrientation{
//   
//    UIImage *image1 = [UIImage imageWithCGImage:[UIImage imageNamed:@"bottomArrow"].CGImage
//                                          scale:1
//                                    orientation:imageOrientation];
//    
//    return image1;
//
//}

//
//- (void)textBegin:(NSNotification *)not {
//
//    [_remindTableView changeMove];
//    
//}
//
//- (void)textEnd:(NSNotification *)not {
//    
//    [_remindTableView downMove];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
