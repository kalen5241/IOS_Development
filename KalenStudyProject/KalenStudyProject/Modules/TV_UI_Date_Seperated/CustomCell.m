//
//  CustomCell.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/16.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "CustomCell.h"
#import "LayoutClass.h"

@implementation CustomCell

- (void)awakeFromNib {
    
    UILabel *label = [[UILabel alloc]init];
    
    label.text = self.str;
    
    label.tag = 3;
    
    self.contentView.tag = 2;
    
    [LayoutClass view:self.contentView andView:label];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
