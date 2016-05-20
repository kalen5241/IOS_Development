//
//  KalenTableViewCellCode.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/20.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "KalenTableViewCellCode.h"

@interface KalenTableViewCellCode()

@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *contentLabel;
@property (strong,nonatomic) UIImageView *leftImageView;

@end


@implementation KalenTableViewCellCode

#pragma mark --init

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initView];
    }
    
    return self;
}

#pragma mark --Views

-(void)initView {
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.leftImageView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.right.equalTo(self.leftImageView.mas_right);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.right.equalTo(self.leftImageView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
        make.width.equalTo(@20);
    }];
}


#pragma mark --Getters

-(UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

-(UILabel *)contentLabel {
    
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

-(UIImageView *)leftImageView {
    
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
    }
    return _leftImageView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
