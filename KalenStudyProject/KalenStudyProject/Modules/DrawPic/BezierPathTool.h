//
//  BezierPathTool.h
//  KalenStudyProject
//
//  Created by kalen on 16/9/29.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BezierPathTool : UIView
@property (nonatomic,strong) NSDictionary *dic;
@property (nonatomic,strong) NSDictionary *dic1;

@property (nonatomic,assign) CGRect tBounds;
@property (nonatomic,assign) CGPoint last;
@property (nonatomic,assign) CGPoint first;
@property (nonatomic,strong) NSArray *arr;
- (UIBezierPath *)fetchDraw;
- (UIBezierPath *)fetchDraw1;

@end
