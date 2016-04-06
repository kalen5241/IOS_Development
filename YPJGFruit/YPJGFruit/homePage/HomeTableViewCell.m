//
//  HomeTableViewCell.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/9.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "HomeTableViewCell.h"


@implementation HomeTableViewCell
{
    HomeCellView *view1 , *view2;
     __weak ShopServerModel * _model1 , *_model2;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        view1 = [HomeCellView new];
        view1.userInteractionEnabled = NO;
        [self.contentView addSubview:view1];
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(ASX(10));
            make.top.equalTo(self.contentView.mas_top).offset(2);
            make.right.equalTo(self.contentView.mas_centerX).offset(ASX(-2));
            make.bottom.equalTo(self.contentView.mas_bottom).offset(ASX(-2));
        }];
        
        view2 = [HomeCellView new];
        view2.userInteractionEnabled = NO;
        [self.contentView addSubview:view2];
        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(ASX(-10));
            make.top.equalTo(self.contentView.mas_top).offset(2);
            make.left.equalTo(self.contentView.mas_centerX).offset(ASX(2));
            make.bottom.equalTo(self.contentView.mas_bottom).offset(ASX(-2));
        }];
        
        
//        view1.layer.borderColor = cwGreyColor.CGColor;
//        view1.layer.borderWidth = 1.0f;
//        view2.layer.borderColor = cwGreyColor.CGColor;
//        view2.layer.borderWidth = 1.0f;
        
        UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self.contentView addGestureRecognizer:tap];

    }
    
    return self;
}


-(void)tap:(UITapGestureRecognizer *)recognizer{
    CGPoint point =[recognizer locationInView:recognizer.view];
  
    ShopServerModel *model;
    if(point.x<SCREEN_WIDTH/2){
        model = _model1;
    }
    else{
        model = _model2;
    }
    
    GoodsDetailVC *goodVC = [[GoodsDetailVC alloc]init];
    goodVC.shopServerM = model;
    [self.weakController.navigationController pushViewController:goodVC animated:YES];
//    if(model){
//        ProductDetailsViewController * controller =[[ProductDetailsViewController alloc]init];
//        controller.model=model;
//        [self.weakController.navigationController pushViewController:controller animated:YES];
//    }
}


-(void)bind:(ShopServerModel *)model1 andModel2:(ShopServerModel *)model2{
    if(_model1==model1 && _model2==model2){
        return;
    }
    _model1=model1;
    _model2=model2;
    
    view1.titleLabel.text=@"22222";
//    [view1.imageView setImageWithURL:[NSURL URLWithString:_model1.smallLogo] placeholderImage:[UIImage imageNamed:@"bar_myAccount_se.jpg"]];
    view1.imageView.image = [UIImage imageNamed:@"bar_home_se.jpg"];
    view1.priceLabel.text=@"1111111";
    
    if(_model2){
        view2.hidden=NO;
        view2.titleLabel.text=@"222222";
        view2.imageView.image = [UIImage imageNamed:@"bar_home_se.jpg"];
        view2.priceLabel.text=@"dddd";
    }
    else{
        view2.hidden=YES;
    }
}


@end



@implementation HomeCellView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.imageView = [UIImageView new];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self).offset(ASX(5));
            make.right.equalTo(self).offset(ASX(-5));
            make.height.equalTo(@(ASX(145)));
        }];
        
        
        self.titleLabel = [UILabel new];
        [self addSubview:self.titleLabel];
        self.titleLabel.font = cwFont(11);
        self.titleLabel.textColor = [UIColor colorWithSevenCFontColor];
        self.titleLabel.numberOfLines = 2;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(ASX(5));
            make.left.right.equalTo(self.imageView);
            make.height.equalTo(@(ASX(30)));
            
        }];
        
        
        self.priceLabel = [[UILabel alloc]init];
        [self addSubview:self.priceLabel];
        self.priceLabel.font = cwFont(10);
        self.priceLabel.textColor = [UIColor colorWithSevenCFontColor];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.titleLabel.mas_bottom).offset(ASX(0));
            make.bottom.equalTo(self).offset(ASX(-5));
            make.left.right.equalTo(self.titleLabel);
            make.height.equalTo(@(ASX(15)));
        }];
        
        self.imageView.image = [UIImage imageNamed:@"bar_myAccount_se"];
//        self.imageView.backgroundColor = [UIColor orangeColor];
        self.titleLabel.text = @"时间的路人 时间的路人  时间的路人 时间的路人 时间的路人 ";
        self.priceLabel.text = @"￥ 4000";
    }
    return self;
}
@end




@interface PageShow()<KDCycleBannerViewDataource,KDCycleBannerViewDelegate>

@end
@implementation PageShow

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _bannerView = [KDCycleBannerView new];
        _bannerView.datasource = self;
        _bannerView.delegate = self;
        _bannerView.continuous = YES;
        _bannerView.autoPlayTimeInterval = 4;
        [self.contentView addSubview:_bannerView];
        [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.contentView);
        }];
    }
    return self;
}

//默认的图片
- (UIImage *)placeHolderImageOfBannerView:(KDCycleBannerView *)bannerView atIndex:(NSUInteger)index{
    return [UIImage imageNamed:@"bar_home"];
}

//返回添加图片数组
-(NSArray *)numberOfKDCycleBannerView:(KDCycleBannerView *)bannerView{
    NSMutableArray * imageArray = [@[[UIImage imageNamed:@"bar_home_se.jpg"],
                                     [UIImage imageNamed:@"bar_home_se.jpg"],
                                     [UIImage imageNamed:@"bar_home_se.jpg"],
                                     [UIImage imageNamed:@"bar_home_se.jpg"],
                                     [UIImage imageNamed:@"bar_home_se.jpg"]]mutableCopy];
    

    return imageArray;
   
}

//点击事件
- (void)cycleBannerView:(KDCycleBannerView *)bannerView didSelectedAtIndex:(NSUInteger)index{
    GoodsDetailVC *goodVC = [[GoodsDetailVC alloc]init];
    [self.weakController.navigationController pushViewController:goodVC animated:YES];
}

//图片模式
- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index{
    return UIViewContentModeScaleAspectFill;
}
-(void)setActivityItemArray:(NSMutableArray *)activityItemArray{
    if(activityItemArray==_activityItemArray){
        return;
    }
    _activityItemArray=activityItemArray;
    
    [self.bannerView reloadDataWithCompleteBlock:nil];
}
@end



@implementation OBDChooseCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
        
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = [UIColor whiteColor];
//        bgView.layer.borderColor = cwGreyColor.CGColor;
//        bgView.layer.borderWidth = 1.0f;
        [self.contentView addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self.contentView).offset(ASX(5));
            make.bottom.equalTo(self.contentView).offset(ASX(-5));
        }];
        
        UIImageView *leftImageV = [[UIImageView alloc]init];
        leftImageV.image = [UIImage imageNamed:@"bar_home_se.jpg"];
        [self.contentView addSubview:leftImageV];
        [leftImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(ASX(15));
            make.centerY.equalTo(bgView.mas_centerY);
            make.height.width.equalTo(@35);
        }];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"按车主OBD数据推荐";
        titleLabel.font = cwFont(15);
        titleLabel.textColor = [UIColor colorWithThreeDFontColor];
        [self.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leftImageV.mas_right).offset(ASX(5));
            make.centerY.equalTo(leftImageV.mas_centerY);
            make.height.equalTo(@35);
            make.width.equalTo(@200);
        }];
        
        UIImageView *rightImageV = [[UIImageView alloc]init];
        rightImageV.image = [CWUtil imageRotation:UIImageOrientationLeft];
        [self.contentView addSubview:rightImageV];
        [rightImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgView.mas_right).offset(ASX(-15));
            make.height.width.equalTo(@20);
            make.centerY.equalTo(bgView.mas_centerY);
        }];
    }
    return self;
}

@end


@implementation GoodsAndServerCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         self.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];

       
        
        for (int i = 0; i < 2; i ++) {
            CWButton*button = [[CWButton alloc]init];
            [self.contentView addSubview:button];
            button.tag = i;
            button.backgroundColor = [UIColor whiteColor];
            button.isDrawBorderBottomLine = YES;
            [self.buttons addObject:button];
            
            
            UIImageView *imageV = [UIImageView new];
            imageV.image = [UIImage imageNamed:[self.imageNames objectAtIndex:i ]];
            imageV.contentMode = UIViewContentModeScaleAspectFit;
            [button addSubview:imageV];
            [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(button.mas_centerX);
                make.centerY.equalTo(button);
                make.height.width.equalTo(@30);
            }];
            [self.imageViews addObject:imageV];
            
            
            
            UILabel * label = [UILabel new];
            label.text = [self.titleNmaes objectAtIndex:i];
            label.textColor = [UIColor colorWithThreeDFontColor];
            label.font = cwFont(16);
            [button addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(button.mas_centerX);
                make.centerY.equalTo(button);
                make.right.equalTo(button);
            }];
            [self.titleLabels addObject:label];
            
        }
        
            NSDictionary *dic =@{
                                      @"space":@0,
                                      @"top":@2,
                                      @"bottom":@-2,
                                      @"left":@0,
                                      @"right":@-0
                                      };
        [CWUtil divideView:self.contentView andSubViewArrar:self.buttons andAttribute:dic];
        
        
        //line
        UIView * lineV = [UIView new];
        lineV.backgroundColor = cwGreyColor;
        [self.contentView addSubview:lineV];
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
            make.height.equalTo(@35);
            make.width.equalTo(@2);
        }];
    }
    return self;
}

- (void)addBtnsTarget:(id)aTarget action:(SEL)aAction {
    for (int i =0; i < [self.buttons count]; i ++) {
        UIButton *bigButton = [self.buttons objectAtIndex:i];
        [bigButton addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)selectedBtn:(NSInteger)aIndex {
    for (int i = 0; i < [self.buttons count]; i++) {
        
        UILabel *lab = [self.titleLabels objectAtIndex:i];
        UIImageView *imageV = [self.imageViews objectAtIndex:i];
        CWButton *button = [self.buttons objectAtIndex:i];
        
        if (i == aIndex) {
            lab.textColor = [UIColor colorWithFourTwoButtonColor];
            imageV.image = [UIImage imageNamed:[self.imageSedName objectAtIndex:i]];
            button.borderBottomLineColor =  [UIColor colorWithFourTwoButtonColor];
          
            
        }else {
            lab.textColor = [UIColor colorWithSevenCFontColor];
            imageV.image = [UIImage imageNamed:[self.imageNames objectAtIndex:i]];
            button.borderBottomLineColor =  [UIColor colorWithHexString:@"ffffff"];
            
        }
    }
}

- (NSMutableArray *)titleLabels {
    if (!_titleLabels) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}

- (NSMutableArray *)titleNmaes {
    if (!_titleNmaes) {
        _titleNmaes = [@[@"商品",@"服务"]mutableCopy];
    }
    return _titleNmaes;
}


-(NSMutableArray *)imageSedName {
    if (!_imageSedName) {
        _imageSedName = [@[@"bar_home_se.jpg",@"bar_home_se.jpg"]mutableCopy];
    }
    return _imageSedName;
}

-(NSMutableArray *)imageNames {
    if (!_imageNames) {
        _imageNames = [@[@"bar_home_se.jpg",@"bar_home_se.jpg"]mutableCopy];
    }
    return _imageNames;
}

- (NSMutableArray *)imageViews {
    if (!_imageViews) {
        _imageViews = [NSMutableArray array];
    }
    return _imageViews;
}

-(NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

@end


