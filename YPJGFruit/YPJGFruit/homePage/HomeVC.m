//
//  HomeVC.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/8.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "HomeVC.h"
#import "HomeTableViewCell.h"

@interface HomeVC ()
@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic, strong) GoodsAndServerCell *goodsCell;

//商品数组  服务数组
@property (nonatomic, strong) NSMutableArray *shopServerArray;


@end

@implementation HomeVC

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [tabBarVC.tabBarBgView setHidden:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    self.goodsCell = [[GoodsAndServerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"serverAndGoods"];
    [self.baseTableView registerClass:[self.goodsCell class] forCellReuseIdentifier:@"serverAndGoods"];
////    [self reloadData:0];
}

//初始化数据
- (NSMutableArray *)shopServerArray {
    if (!_shopServerArray) {
        
        ShopServerModel *ssm1= [[ShopServerModel alloc]init];
        ShopServerModel *ssm2= [[ShopServerModel alloc]init];
        ShopServerModel *ssm3= [[ShopServerModel alloc]init];
        ShopServerModel *ssm4= [[ShopServerModel alloc]init];
        ShopServerModel *ssm5= [[ShopServerModel alloc]init];
        ShopServerModel *ssm6= [[ShopServerModel alloc]init];
        ShopServerModel *ssm7= [[ShopServerModel alloc]init];
        _shopServerArray = [@[ssm1,ssm2,ssm3,ssm4,ssm5,ssm6,ssm7] mutableCopy];
    }
    return _shopServerArray;
}


- (void)reloadData:(NSString *)shopOrServer {
    
//  [CSDataRequest shopServer:shopOrServer compeletion:^(ShopServerResponse *response, NSError *error) {
//       LOG(@"首页 商品信息 response = %@  error = %@",response,error);
//      
//      if ([ self errorResponse:response andError:error isShowErrorMsg:YES]) {
//          return ;
//      }
//      
//      if (response.code == 0) {
//          self.shopServerArray = [response.data mutableCopy];
//          NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
//          [self.baseTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
//      }
//      
//  }];
}



#pragma mark - tableView

- (NSInteger)sections {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else {
        if ([self.shopServerArray count] > 0) {
             return [self.shopServerArray count]/2 + self.shopServerArray.count%2;
        }else {
            return 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            identifier = @"pageShow";
            PageShow * pageCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!pageCell) {
                pageCell = [[PageShow alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            pageCell.weakController = self;
            return pageCell;
            
        }else if(indexPath.row == 1) {
            identifier = @"OBDChooseCell";
            OBDChooseCell * obdChoose = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!obdChoose) {
                obdChoose = [[OBDChooseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            obdChoose.selectionStyle = UITableViewCellSelectionStyleNone;
            return obdChoose;
            
        }else {
            
            identifier = @"serverAndGoods";
            self.goodsCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            [_goodsCell addBtnsTarget:self action:@selector(goodsServer:)];
            _goodsCell.selectionStyle = UITableViewCellSelectionStyleNone;
            [self.goodsCell selectedBtn:0];
            return _goodsCell;
            
        }
    }
    
   /**/
    else {
        if (indexPath.row >= 0) {
            identifier = @"HomeTableViewCell";
            HomeTableViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!homeCell) {
                homeCell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            homeCell.weakController = self;
            
            //设置model
            ShopServerModel *model1 = [self.shopServerArray objectAtIndex:indexPath.row*2];
            ShopServerModel *model2 ;
            NSInteger index =indexPath.row*2+1;
            if (index < [self.shopServerArray count]) {
                model2 = [self.shopServerArray objectAtIndex:index];
            }
            
            [homeCell bind:model1 andModel2:model2];
            
            return  homeCell;
        }
        else {
            
            identifier = @"tableViewCell";
            UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!tableCell) {
                tableCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            tableCell.textLabel.text = @"123";
            return tableCell;
        }
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return ASX(150);
        }else if(indexPath.row == 1) {
            return  ASX(54);
        }else{
            return ASX(54);
        }
    }else {
        return ASX(210);
    }
    
}


- (void)goodsServer:(id)sender {
    UIButton * button = sender;
    [self.goodsCell selectedBtn:button.tag];
    //    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
    //    [self.baseTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    if (button.tag == 0) {
        LOG(@"商品");
        [self reloadData:@"0"];
    }else {
        LOG(@"服务");
        [self reloadData:@"1"];
        
    }
    
}

- (void)setBarItem {
    //消息
    self.messageButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    [_messageButton setBackgroundImage:[UIImage imageNamed:@"h_noMessage"] forState:UIControlStateNormal];
    [_messageButton setBackgroundImage:[UIImage imageNamed:@"h_hasMessage"] forState:UIControlStateSelected];
  
    _messageButton.tag = 1;
    [_messageButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_messageButton];
    [self.navigationItem setLeftBarButtonItem:backItem];
    
    //搜索
    UIButton *findButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [findButton setBackgroundImage:[UIImage imageNamed:@"h_find"] forState:UIControlStateNormal];
    findButton.tag = 2;
    [findButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *findItem = [[UIBarButtonItem alloc] initWithCustomView:findButton];
    [self.navigationItem setRightBarButtonItem:findItem];
}

-(void)onClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1://消息
        {
            LOG(@"消息");
        }
            break;
            
        case 2://搜索
        {
            LOG(@"搜索");
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)showGIF:(UIView *)superView {
    NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"h_loding" ofType:@"gif"]];
    UIWebView *webView = [[UIWebView alloc] init];
    webView.backgroundColor = [UIColor clearColor];
    webView.scalesPageToFit = YES;
    webView.scrollView.bounces = NO;
    //- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL;
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [superView addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@200);
        
    }];
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
