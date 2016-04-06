//
//  HomeTableViewCell.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/9.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDCycleBannerView.h"
#import "CWButton.h"
#import "GoodsDetailVC.h"

#pragma mark - 商品信息
@interface HomeTableViewCell : UITableViewCell
@property (nonatomic, strong) UIViewController *weakController;
-(void)bind:(ShopServerModel *)model1 andModel2:(ShopServerModel *)model2;

@end


@interface HomeCellView : UIView
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@end

#pragma mark - 轮播图
@interface PageShow : UITableViewCell
@property(nonatomic,strong)KDCycleBannerView * bannerView;
@property(nonatomic,weak)NSMutableArray * activityItemArray;
@property (nonatomic, strong) UIViewController *weakController;
@end

#pragma mark - OBD数据推荐

@interface OBDChooseCell : UITableViewCell

@end

#pragma mark - 商品 服务

@interface GoodsAndServerCell : UITableViewCell
@property (nonatomic, strong) NSMutableArray *titleNmaes;
@property (nonatomic, strong) NSMutableArray *titleLabels;
@property (nonatomic, strong) NSMutableArray *imageNames;
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSMutableArray *imageSedName;
@property (nonatomic, strong) NSMutableArray *buttons;

- (void)addBtnsTarget:(id)aTarget action:(SEL)aAction;
- (void)selectedBtn:(NSInteger)aIndex;

@end