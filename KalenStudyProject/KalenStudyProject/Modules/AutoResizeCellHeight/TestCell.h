//
//  TestCell.h
//  KalenStudyProject
//
//  Created by kalen on 16/3/9.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell

@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) NSString *titleString;

@property (strong, nonatomic)  UILabel *detail;
@property (strong, nonatomic)  NSString *detailString;

@property (strong, nonatomic)  UIImageView *arrowImage;
@property (strong, nonatomic)  NSString *imageName;
@end
