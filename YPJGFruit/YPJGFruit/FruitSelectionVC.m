//
//  FruitSelectionVC.m
//  YPJGFruit
//
//  Created by kalen on 15/7/18.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import "FruitSelectionVC.h"
#import "BasicHeader.h"
#import "FruitSelectView.h"
#import "YPDataRequest.h"
#import "YPResponse.h"

@interface FruitSelectionVC()
//@property (nonatomic,strong) FruitCategoriesTV *fruitCategories;
//@property (nonatomic,strong) FruitProductsTV *fruitProducts;
//
//@property (nonatomic,strong) NSMutableArray *categoryArray;
//@property (nonatomic,strong) NSMutableArray *productArray;
//@property (nonatomic,strong) UILabel *totalPrice;
//@property (nonatomic,strong) PurchaseLabel *bottomLabel;
//@property (nonatomic,assign) NSInteger quantityInt;
//@property (nonatomic,strong) NSMutableDictionary *dic;
//@property (nonatomic,strong) NSMutableArray *key;
//@property (nonatomic,strong) UILabel *totalSingular;
//@property (nonatomic,strong) UIImageView *cartImage;


@end


@implementation FruitSelectionVC
-(void)viewDidLoad{
    self.title = @"优派佳果";
    self.view = [FruitSelectView view];
    NSDictionary *params = @{@"c":@"product", @"m":@"show_type"};
    
    [YPDataRequest fetchProductType:params Compeletion:^(YPResponse *response, NSError *error) {
        NSLog(@"类别%@",response);
    }];
    
    NSDictionary *params1 = @{@"c":@"product", @"m":@"show_list",@"type_id":@"201"};

    [YPDataRequest fetchFruitList:params1 Compeletion:^(ProductListResponse *response, NSError *error) {
        NSLog(@"列表%@",response);
    }];
    
}
@end
