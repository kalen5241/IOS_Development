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

#pragma mark --View

-(void)initView {
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.leftImageView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0).key(@"tlc1");
        make.top.equalTo(@0).key(@"tlc2");
        make.right.equalTo(self.leftImageView.mas_right).key(@"tlc3");
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0).key(@"tlc4");
        make.top.equalTo(self.titleLabel.mas_bottom).key(@"tlc5");
        make.right.equalTo(self.leftImageView.mas_right).key(@"tlc6");
        make.bottom.equalTo(self.contentView.mas_bottom).key(@"tlc7");
    }];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0).key(@"tlc8");
        make.bottom.equalTo(@0).key(@"tlc9");
        make.right.equalTo(@0).key(@"tlc10");
        make.width.equalTo(@70).key(@"tlc11");
        make.height.equalTo(@80).key(@"tlc12");
    }];
}

#pragma mark --Setters
- (void)setDataModel:(KalenDataModel *)dataModel {
    
    _dataModel = dataModel;
    self.titleLabel.text = dataModel.title;
    self.contentLabel.text = dataModel.content;
    self.leftImageView.image = [UIImage imageNamed:dataModel.imageName];
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
