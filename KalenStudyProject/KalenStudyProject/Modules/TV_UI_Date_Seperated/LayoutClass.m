//
//  LayoutClass.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/16.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "LayoutClass.h"
#import <Masonry.h>
#import "CustomCell.h"

@interface LayoutClass()


@end

@implementation LayoutClass

+ (void)view:(UIView *)superView andView:(UIView *)subView {
    
    __block UIView  *weakSuperView = superView;
    __block UIView  *weakSubView = subView;
    
    [weakSuperView addSubview:weakSubView];
    
    /* 
     tag = 0 viewController的view
     tag = 1 tableview 
     tag = 2 contentView
     tag = 3 label
    */
    
    if (weakSuperView.tag == 0 && weakSubView.tag == 1) {
        [weakSubView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSuperView).with.insets(UIEdgeInsetsMake(64,0,0,0));
        }];
    }
    

    if (weakSuperView.tag == 2 && weakSubView.tag == 3) {
        weakSubView.backgroundColor = [UIColor redColor];
        [weakSubView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSuperView).with.insets(UIEdgeInsetsMake(20,0,0,0));
        }];
    }
}

@end
