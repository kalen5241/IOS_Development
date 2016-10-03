//
//  DisplayView.h
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayView : UIView

@property (nonatomic,strong) NSDictionary *dic;
@property (nonatomic,strong) NSArray *arr;
@property (nonatomic,assign) CGPoint last;
@property (nonatomic,assign) CGPoint first;
- (instancetype)initWithArray:(NSArray *)array;

//- (UIBezierPath *)fetchDraw;
//- (void)drawLineChart;

@end
