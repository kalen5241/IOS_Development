//
//  TableViewCell.m
//  TestAutoCell
//
//  Created by Huashen on 11/13/15.
//  Copyright © 2015 csc. All rights reserved.
//

#import "TableViewCellCode.h"
#import "Masonry.h"
#import "DataModel.h"

@interface TableViewCellCode()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *contentLabel;
@end

@implementation TableViewCellCode

#pragma mark - Inits

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - View

-(void)initView
{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.right.equalTo(@0);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.bottom.equalTo(@-10);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
    }];
}

#pragma mark - Getters

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

-(void)setDataModel:(DataModel *)dataModel
{
    _dataModel = dataModel;
    self.titleLabel.text = dataModel.title;
    self.contentLabel.text = dataModel.content;
}

@end
