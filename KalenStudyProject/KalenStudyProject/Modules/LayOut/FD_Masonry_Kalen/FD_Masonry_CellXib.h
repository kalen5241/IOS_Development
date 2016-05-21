//
//  FD_Masonry_CellXib.h
//  KalenStudyProject
//
//  Created by kalen on 16/5/21.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KalenDataModel.h"

@interface FD_Masonry_CellXib : UITableViewCell

@property (nonatomic,strong) KalenDataModel *dataModel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;

@end
