//
//  FruitSelectView.m
//  YPJGFruit
//
//  Created by kalen on 15/7/18.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import "FruitSelectView.h"
#import "FruitCategoryCell.h"
#import "FruitProductCell.h"
#import "BasicHeader.h"
@interface FruitSelectView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSIndexPath *selectedCategoryIndexPath;
@property (nonatomic,strong) NSIndexPath *selectedProductIndexPath;
@end

@implementation FruitSelectView

+(UIView *)view{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"FruitSelectView" owner:nil options:nil] lastObject];
    
}


-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == self.fruitCategoriesTV) {
        return 4;
    }else{
        return 8;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.fruitCategoriesTV) {
        FruitCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = (FruitCategoryCell *)[[[NSBundle mainBundle] loadNibNamed:@"FruitCategoryCell" owner:nil options:nil] lastObject];
        }
        
        if (indexPath.row == 0) {
            cell.categoryLabel.text = @"宝宝最爱";
        }
        if (indexPath.row == 1) {
            cell.categoryLabel.text = @"孕妇精选";
        }
        if (indexPath.row == 2) {
            cell.categoryLabel.text = @"老年养生";
        }
        if (indexPath.row == 3) {
            cell.categoryLabel.text = @"全城热恋";
        }
        
        cell.backgroundColor=[UIColor whiteColor];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        FruitProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = (FruitProductCell *)[[[NSBundle mainBundle] loadNibNamed:@"FruitProductCell" owner:nil options:nil] lastObject];
        }
        //cell.categoryLabel.text = @"特价商品";
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=UIColorRGBA(246, 246, 246, 1);
        return cell;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.fruitCategoriesTV) {
        if (self.selectedCategoryIndexPath!=nil) {
            FruitCategoryCell *cell = (FruitCategoryCell *)[tableView cellForRowAtIndexPath:self.selectedCategoryIndexPath];
            cell.backgroundColor=[UIColor whiteColor];
            cell.categoryLabel.textColor=[UIColor blackColor];
            cell.highLightView.hidden=YES;

        }

        //取消选中颜色
        FruitCategoryCell *cell = (FruitCategoryCell *)[tableView cellForRowAtIndexPath:indexPath];
        cell.categoryLabel.textColor=UIColorRGBA(255, 127, 0, 1);
        cell.backgroundColor=UIColorRGBA(246, 246, 246, 1);
        //cell.backgroundColor=[UIColor blackColor];
        cell.highLightView.backgroundColor = UIColorRGBA(255, 127, 0, 1);
        cell.highLightView.hidden=NO;
        self.selectedCategoryIndexPath=indexPath;

    }//else{
        //if (self.selectedProductIndexPath!=nil) {
            //FruitProductCell *cell = (FruitProductCell *)[tableView cellForRowAtIndexPath:self.selectedProductIndexPath];
           // FruitProductCell *cell = (FruitProductCell *)[tableView cellForRowAtIndexPath:indexPath];
            //cell.backgroundColor=[UIColor whiteColor];
//            cell.categoryLabel.textColor=[UIColor blackColor];
//            cell.highLightView.hidden=YES;
            
        //}
        
        //取消选中颜色
        //FruitCategoryCell *cell = (FruitCategoryCell *)[tableView cellForRowAtIndexPath:indexPath];
        //cell.categoryLabel.textColor=UIColorRGBA(255, 127, 0, 1);
        //cell.backgroundColor=UIColorRGBA(246, 246, 246, 1);
        //cell.highLightView.backgroundColor = UIColorRGBA(255, 127, 0, 1);
        //cell.highLightView.hidden=NO;
        //self.selectedProductIndexPath=indexPath;
        
    //}
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.fruitCategoriesTV) {
        return 50;
    }else{
        return 90;
    }
}


@end
