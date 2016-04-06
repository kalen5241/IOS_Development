//
//  TestCell.m
//  KalenStudyProject
//
//  Created by kalen on 16/3/9.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTitleString:(NSString *)titleString {
   
    self.title = [[UILabel alloc]init];
    self.title.numberOfLines = 0;
    self.title.text = titleString;
    [self.contentView addSubview:self.title];
    UIImageView*i = [[UIImageView alloc]init];
    i.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:i];
    i.image = [UIImage imageNamed:@"car_type"];
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:btn];
    
    [i mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.right.equalTo(btn.mas_left);
    }];
    

    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom);
        make.left.equalTo(i.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.right.equalTo(self.contentView.mas_right);
    }];
    
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.bottom.equalTo(i.mas_top);
        make.right.equalTo(self.contentView.mas_right);
    }];
    

//    [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.title.mas_right);
//        make.right.equalTo(self.contentView.mas_right);
//        make.top.equalTo(self.contentView.mas_top);
//        make.bottom.equalTo(self.contentView.mas_bottom);
//    }];
//    
}

@end
