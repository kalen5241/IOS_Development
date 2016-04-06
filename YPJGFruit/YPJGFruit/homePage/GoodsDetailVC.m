//
//  GoodsDetailVC.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/10.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "GoodsDetailVC.h"
#import "HomeTableViewCell.h"
#import "GoodsDetailCell.h"
//#import "PurchaseVC.h"
//#import "ReceiveWayVC.h"
//#import "ReceiveAddressVC.h"
//#import "ArrivalAddressVC.h"


@interface GoodsDetailVC ()
@property(nonatomic,strong)KDCycleBannerView * bannerView;
@end

@implementation GoodsDetailVC

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self createBottomButtonsView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    self.rows = 3;
    self.title = @"商品详情";
    // Do any additional setup after loading the view.
    [self reloadData];
}


//加载数据
- (void)reloadData {
    [CSDataRequest goodsDetail:@"1" compeletion:^(GoodsDetailResponse *response, NSError *error) {
     
        GoodsDetailModel * goodDeM = response.data;
        
         LOG(@"商品详情 信息 %@  model = %@  error = %@"  ,response,goodDeM ,error);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return ASX(150);
    }else if (indexPath.row == 1) {
        return ASX(90);
    }else {
        return 30;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier;
    if (indexPath.row == 0) {
        identifier = @"pageShow";
        UITableViewCell * pageCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!pageCell) {
            pageCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        _bannerView = [[KDCycleBannerView alloc]init];
        
        
        return pageCell;
    }else if (indexPath.row == 1) {
        identifier = @"goodMessage";
        GoodsDetailCell  * webCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!webCell) {
            webCell = [[GoodsDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        return webCell;
    }else {
//        identifier = @"webViewCell";
//        UITableViewCell  * webCell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        if (!webCell) {
//            webCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH,SCREEN_HEIGHT - 64 )];
//        [webCell.contentView addSubview:webView];
//        webView.scalesPageToFit = YES;
//        
//        NSURL* url = [NSURL URLWithString:@"http://www.chewen.com/journal/201510/845983.html"];//创建URL
//        NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
//        [webView loadRequest:request];
//        
//        
//        return webCell;
        
        identifier = @"buyNumberCell";
        BuyNumber * webCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!webCell) {
            webCell = [[BuyNumber alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        return webCell;
    }
}




#pragma mark - 设置顶部和底部的按钮
-(void)setBarItem {
    [super setBarItem];
    
    UIButton *findButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0, 30, 40)];
    [findButton setTitle:@"收藏" forState:UIControlStateNormal];
    [findButton setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    findButton.titleLabel.font = cwFont(11);
    findButton.titleEdgeInsets = UIEdgeInsetsMake(20, -40, 3, 0);
    
    [findButton setImage:[UIImage imageNamed:@"h_star"] forState:UIControlStateNormal];
    [findButton setImage:[UIImage imageNamed:@"h_star_se"] forState:UIControlStateSelected];
    findButton.imageEdgeInsets = UIEdgeInsetsMake(0,5,20,5);
    findButton.tag = 1;
    [findButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *shareButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0, 30, 40)];
    [shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    shareButton.titleLabel.font = cwFont(11);
    shareButton.titleEdgeInsets = UIEdgeInsetsMake(20, -40, 3, 0);
    [shareButton setImage:[UIImage imageNamed:@"h_share"] forState:UIControlStateNormal];
    shareButton.imageEdgeInsets = UIEdgeInsetsMake(0,5,20,5);
    shareButton.tag = 2;
    [shareButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *findItem = [[UIBarButtonItem alloc] initWithCustomView:findButton];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    [self.navigationItem setRightBarButtonItems:@[shareItem,findItem]];
    
}

- (UIView *)createBottomButtonsView {
   UIView *bottomV = [super createBottomButtonsView];
    
    UIButton *seeCar = [[UIButton alloc]init];
    [bottomV addSubview:seeCar];
    seeCar.frame = CGRectMake(5, 8, 120, 36);
    [seeCar setTitle:@"查看购物车" forState:UIControlStateNormal];
    seeCar.titleLabel.font = cwFont(13);
    seeCar.titleEdgeInsets = UIEdgeInsetsMake(0, -95, -5, -35);
    [seeCar setImage:[UIImage imageNamed:@"h_shopCar"] forState:UIControlStateNormal];
    seeCar.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5,95);
    [seeCar setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    seeCar.tag = 1;
    [seeCar addTarget:self action:@selector(bottomButtonsClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *addCar = [[UIButton alloc]init];
    [bottomV addSubview:addCar];
    [addCar setTitle:@"加入购物车" forState:UIControlStateNormal];
    addCar.titleLabel.font = cwFont(13);
    addCar.backgroundColor = [UIColor colorWithThreeCButtonColor];
    [addCar setTitleColor:[UIColor colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
    addCar.tag = 2;
    [addCar addTarget:self action:@selector(bottomButtonsClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buyGood = [[UIButton alloc]init];
    [bottomV addSubview:buyGood];
    [buyGood setTitle:@"立刻购买" forState:UIControlStateNormal];
    buyGood.titleLabel.font = cwFont(13);
    buyGood.backgroundColor = [UIColor colorWithFFButtonColor];
    [buyGood setTitleColor:[UIColor colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
    buyGood.tag = 3;
    [buyGood addTarget:self action:@selector(bottomButtonsClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [buyGood mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomV);
        make.width.equalTo(@90);
        make.height.equalTo(@35);
        make.right.equalTo(bottomV.mas_right).offset(-20);
    }];
    
    [addCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomV);
        make.width.equalTo(@90);
        make.height.equalTo(@35);
        make.right.equalTo(buyGood.mas_left).offset(-10);
    }];
    
    return bottomV;
    
}

- (void) bottomButtonsClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
        {
            LOG(@"查看购物车");
            //测试 收货方式
//            PurchaseVC *receVC = [[PurchaseVC alloc]init];
//            [self.navigationController pushViewController:receVC animated:YES];
            
//            [CSDataRequest lookGoodsCarCompeletion:^(CWBaseModel *response, NSError *error) {
//                
//            }];
        }
            break;
        case 2:
        {
            LOG(@"加入购物车");
//            ReceiveAddressVC *receVC = [[ReceiveAddressVC alloc]init];
//            [self.navigationController pushViewController:receVC animated:YES];
            NSMutableDictionary * param = [@{@"count":@"3",@"diliverMode":_shopServerM.type}mutableCopy];
            
            [CSDataRequest addGoodsCar:_shopServerM.id andParam:param Compeletion:^(CWBaseModel *response, NSError *error) {
                
            }];
            
        }
            break;
        case 3:
        {
//            LOG(@"立刻购买");
//            ArrivalAddressVC *receVC = [[ArrivalAddressVC alloc]init];
//            [self.navigationController pushViewController:receVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(void)rightClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    
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
