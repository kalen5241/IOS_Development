//
//  FruitSelectView.h
//  YPJGFruit
//
//  Created by kalen on 15/7/18.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FruitSelectView : UIView
@property (weak, nonatomic) IBOutlet UITableView *fruitCategoriesTV;
@property (weak, nonatomic) IBOutlet UITableView *fruitProductsTV;
+(UIView *)view;
@end
