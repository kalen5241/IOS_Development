//
//  TRNavLeftView.h
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRNavLeftView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *categoryButton;

//加载自定义的xib文件
+(id)view;

-(id)initWithCoder:(NSCoder *)aDecoder;
//点击导航栏左边的自定义的view
-(void)addTarget:(id)target action:(SEL)action;
@end
