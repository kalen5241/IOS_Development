//
//  FruitProductCell.h
//  YPJGFruit
//
//  Created by kalen on 15/7/18.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FruitProductCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productDescription;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIButton *numberSub;
@property (weak, nonatomic) IBOutlet UIButton *numberPlus;
@property (weak, nonatomic) IBOutlet UILabel *productNum;
@property (weak, nonatomic) IBOutlet UILabel *discountPrice;

@end
