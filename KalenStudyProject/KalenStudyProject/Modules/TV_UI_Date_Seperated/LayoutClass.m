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
    
    [superView addSubview:subView];
    
    // tag = 0 viewController的view  tag = 1 tableview tag = 3 contentView tag = 4 label 
    
    if (superView.tag == 0 && subView.tag == 1) {
        [superView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView).with.insets(UIEdgeInsetsMake(64,0,0,0));
        }];
    }
    

    if (superView.tag == 2 && subView.tag == 3) {
        [superView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView).with.insets(UIEdgeInsetsMake(0,0,0,0));
        }];
    }
    
}




@end
