//
//  CWTextFieldView.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/18.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWTextFieldView.h"

@implementation CWTextFieldView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.textField = [[UITextField alloc]init];
        [self addSubview:self.textField];
        self.textField.font = cwFont(16);
        self.textField.textColor = [UIColor colorWithThreeDFontColor];
  
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(1, 10, 1, 0));
        }];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGFloat linex = rect.origin.x;
    CGFloat fontSize = self.textField.font.pointSize;
    CGFloat centerX = CGRectGetMidX(rect);
    CGFloat centerY = CGRectGetMidY(rect);
    
    //画一条线
    if (_isDrawLine) {
        
        
        CGFloat lineH = rect.size.height;
        CGFloat lineW = rect.size.width;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        // 添加路径[1条点(100,100)到点(200,100)的线段]到path
        [path moveToPoint:CGPointMake(linex-5, lineH-2 )];
        [path addLineToPoint:CGPointMake(lineW+5, lineH -2)];
        [cwGreyColor set];
        // 将path绘制出来
        [path stroke];
    }
    if (_isDrawLeftLine) {
        CGFloat lineH = fontSize + 5*2;
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(1, centerY - lineH/2 )];
        [path addLineToPoint:CGPointMake(1,centerY + lineH/2)];
        [_leftLineColor set];
        [path stroke];
    }
}


@end
