//
//  GoodsDetailCell.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/21.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "GoodsDetailCell.h"

@implementation GoodsDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
         self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createView];
    }
    return self;
}


- (void)createView {
    kWeakSelf;
    
    _titleLabel = [[CWLabel alloc]init];
    _titleLabel.font = cwFont(13);
    _titleLabel.text = @"时间的路人  事假你的路人  四十件的是路人";
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView.mas_top).offset(ASX(5));
        make.left.equalTo(weakSelf.contentView).offset(ASX(15));
        make.right.equalTo(weakSelf.contentView).offset(ASX(-15));
        make.height.equalTo(@(ASX(30)));
    }];
    
    
    _curentPriceLabel = [[CWLabel alloc]init];
    [self.contentView addSubview:_curentPriceLabel];
    _curentPriceLabel.textColor = [UIColor colorWithFFButtonColor];
    _curentPriceLabel.font = cwFont(18);
    _curentPriceLabel.text = @"￥1499.00";
    
    
    _originalPriceLabel = [[CWLabel alloc]init];
    [self.contentView addSubview:_originalPriceLabel];
    _originalPriceLabel.textColor = cwGreyColor;
    _originalPriceLabel.font = cwFont(13);
    _originalPriceLabel.isDrawCenterLine = YES;
    _originalPriceLabel.text = @"￥1499.00";
    
    
    _favourableLabel = [[CWLabel alloc]init];
    [self.contentView addSubview:_favourableLabel];
    _favourableLabel.textColor = [UIColor colorWithFFButtonColor];
    _favourableLabel.font = cwFont(13);
    _favourableLabel.textAlignment = NSTextAlignmentCenter;
    _favourableLabel.text = @"满1000减200";
    _favourableLabel.layer.borderColor = [UIColor colorWithFFButtonColor].CGColor;
    _favourableLabel.layer.borderWidth = 1.0f;
    
    
    [_curentPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.mas_bottom).offset(ASX(5));
        make.height.equalTo(@(ASX(25)));
    }];
    
    [_originalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_curentPriceLabel);
        make.left.equalTo(_curentPriceLabel.mas_right).offset(5);
        make.height.equalTo(@(ASX(20)));
    }];
    
    [_favourableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_titleLabel);
        make.bottom.equalTo(_curentPriceLabel);
        make.height.equalTo(@(ASX(20)));
        make.width.equalTo(@100);
    }];
    

    _railPriceLabel = [[CWLabel alloc]init];
    [self.contentView addSubview:_railPriceLabel];
    _railPriceLabel.font = cwFont(11);
    self.railPriceLabel.text = @"10.00";
     _railPriceLabel.textColor = cwGreyColor;
    
    [_railPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(ASX(-5));
    }];
    
    _saleCountLabel = [[CWLabel alloc]init];
    [self.contentView addSubview:_saleCountLabel];
    _saleCountLabel.font = cwFont(11);
    _saleCountLabel.text = @"1652";
    _saleCountLabel.textColor = cwGreyColor;
    [_saleCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.contentView);
        make.centerY.equalTo(_railPriceLabel);
    }];
    
    _pointsLabel = [[CWLabel alloc]init];
    [self.contentView addSubview:_pointsLabel];
    _pointsLabel.font = cwFont(11);
    _pointsLabel.text = @"149";
    _pointsLabel.textColor = cwGreyColor;
    [_pointsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_railPriceLabel);
        make.right.equalTo(_titleLabel);
    }];
    
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = cwGreyColor;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.contentView.mas_bottom);
        make.left.right.equalTo(_titleLabel);
        make.height.equalTo(@1);
    }];
    
}


@end




@implementation BuyNumber

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createView];
    }
    return  self;
}

- (void)createView {
    kWeakSelf;
    
    UIButton *subtractButton = [[UIButton alloc]init];
    [subtractButton setTitle:@"一" forState:UIControlStateNormal];
    [self.contentView addSubview:subtractButton];
    subtractButton.tag = 1;
    [subtractButton setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    [subtractButton addTarget:self action:@selector(buyCellClick:) forControlEvents:UIControlEventTouchUpInside];
    subtractButton.titleLabel.font = cwFont(13);
    
    [subtractButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.contentView).offset(ASX(-15));
        make.centerY.equalTo(weakSelf.contentView);
        make.height.width.equalTo(@(ASX(40)));
    }];
    
    _buyNumberField = [[UITextField alloc]init];
    [self.contentView addSubview:_buyNumberField];
    _buyNumberField.layer.borderColor = cwGreyColor.CGColor;
    _buyNumberField.layer.borderWidth = 1.0f;
    _buyNumberField.text = @"1";
    _buyNumberField.font = cwFont(14);
    _buyNumberField.textAlignment = NSTextAlignmentCenter;
    [_buyNumberField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(subtractButton.mas_left);
        make.centerY.equalTo(weakSelf.contentView);
        make.height.equalTo(@(ASX(25)));
        make.width.equalTo(@60);
    }];
    
    
    UIButton *addButton = [[UIButton alloc]init];
    [addButton setTitle:@"十" forState:UIControlStateNormal];
    [self.contentView addSubview:addButton];
    [addButton setTitleColor:[UIColor colorWithSevenCFontColor] forState:UIControlStateNormal];
    addButton.tag = 2;
    addButton.titleLabel.font = cwFont(13);
    [addButton addTarget:self action:@selector(buyCellClick:) forControlEvents:UIControlEventTouchUpInside];
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_buyNumberField.mas_left);
        make.centerY.equalTo(weakSelf.contentView);
        make.height.width.equalTo(@(ASX(40)));
    }];
    
    UILabel *numberLabel = [[UILabel alloc]init];
    numberLabel.text = @"购买数量";
    numberLabel.font = cwFont(13);
    [self.contentView addSubview:numberLabel];
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addButton);
        make.right.equalTo(addButton.mas_left).offset(-5);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = cwGreyColor;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.contentView.mas_bottom);
        make.left.equalTo(weakSelf.contentView).offset(ASX(15));
        make.right.equalTo(weakSelf.contentView).offset(ASX(-15));
        make.height.equalTo(@1);
    }];
}


- (void)buyCellClick:(UIButton *)sender {
    if (sender.tag == 1) {//减
        if ([_buyNumberField.text integerValue] > 0) {
            _buyNumberField.text = [NSString stringWithFormat:@"%d",[_buyNumberField.text intValue]-1];
        }else {
         _buyNumberField.text = @"0";
        }
    }else {//加
      _buyNumberField.text = [NSString stringWithFormat:@"%d",[_buyNumberField.text intValue]+1];
    }
}

@end
