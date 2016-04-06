//
//  PhoneTableViewCell.m
//  CarSecretary
//
//  Created by wenjuan on 15/11/3.
//  Copyright © 2015年 Chewen. All rights reserved.
//

#import "PhoneTableViewCell.h"
#import <Masonry.h>

@implementation PhoneTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _phoneLabel = [UIButton new];
        [self.contentView addSubview:_phoneLabel];
        [_phoneLabel setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
        _phoneLabel.titleLabel.font = cwFont(14);
        
        [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-50);
            make.height.equalTo(@30);
        }];
        
        _deleButton = [UIButton new];
        [_deleButton setImage:[UIImage imageNamed:@"login_deleget"] forState:UIControlStateNormal
         ];
        [_deleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //_deleButton.backgroundColor = [UIColor orangeColor];
        
        [self.contentView addSubview:_deleButton];
        [_deleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_phoneLabel.mas_right).offset(20);
            make.top.equalTo(self.contentView).offset(5);
            make.height.equalTo(@20);
            make.width.equalTo(@20);
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = cwGreyColor;
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(1);
            make.top.equalTo(self.contentView.mas_bottom).offset(-1);
            make.height.equalTo(@1);
            make.width.equalTo(self.contentView);
        }];
    }
    
    return self;
}


-(void)setPhoneString:(NSString *)phoneString {
//    self.backgroundColor = RGBACOLOR(69, 71, 76, 1);
    self.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
    [_phoneLabel setTitle:phoneString forState:UIControlStateNormal];
}

 



@end
