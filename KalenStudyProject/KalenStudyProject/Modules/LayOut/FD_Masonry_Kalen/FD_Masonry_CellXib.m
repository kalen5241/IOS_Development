//
//  FD_Masonry_CellXib.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/21.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "FD_Masonry_CellXib.h"

@implementation FD_Masonry_CellXib

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataModel:(KalenDataModel *)dataModel {
    
    _dataModel = dataModel;
    self.titleLabel.text = dataModel.title;
    self.contentLabel.text = dataModel.content;
    self.leftImageView.image = [UIImage imageNamed:dataModel.imageName];
}

@end
