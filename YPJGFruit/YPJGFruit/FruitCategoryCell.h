//
//  FruitCategoryCell.h
//  YPJGFruit
//
//  Created by kalen on 15/7/18.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FruitCategoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *cellSeperateView;
@property (weak, nonatomic) IBOutlet UIView *highLightView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end
