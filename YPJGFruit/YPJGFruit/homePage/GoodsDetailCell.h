//
//  GoodsDetailCell.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/21.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWLabel.h"

@interface GoodsDetailCell : UITableViewCell

@property (nonatomic, strong) CWLabel *titleLabel;
@property (nonatomic, strong) CWLabel *curentPriceLabel;
@property (nonatomic, strong) CWLabel *originalPriceLabel;

@property (nonatomic, strong) CWLabel *railPriceLabel;
@property (nonatomic, strong) CWLabel *saleCountLabel;

@property (nonatomic, strong) CWLabel *pointsLabel;

@property (nonatomic, strong) CWLabel *favourableLabel;
@end



@interface BuyNumber : UITableViewCell

@property (nonatomic, strong) UITextField *buyNumberField;

@end