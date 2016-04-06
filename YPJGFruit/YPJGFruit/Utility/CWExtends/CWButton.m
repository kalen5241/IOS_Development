//
//  CWButton.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/4.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWButton.h"

@implementation CWButton


- (void)drawRect:(CGRect)rect {
    CGFloat fontSize = self.titleLabel.font.pointSize;
    CGFloat lineWithBotton = self.titleLabel.frame.size.width;
    CGFloat lineHeightLeft = fontSize + _leftThanFontHeight * 2;
    CGFloat lineHeightRight = fontSize + _rightThanFontHeight * 2;
    CGFloat centerY = CGRectGetMidY(rect);
    CGFloat centerX = CGRectGetMidX(rect);
    CGFloat with = CGRectGetWidth(rect);
    
    
    
    
    if (_isDrawRightLine) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(with-1 , centerY - lineHeightRight/2)];
        [path addLineToPoint:CGPointMake(with-1 , centerY + lineHeightRight/2)];
        [_rightLineColor set];
        [path stroke];
    }
    
    if (_isDrawLeftLine) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(1,centerY - lineHeightLeft/2)];
        [path addLineToPoint:CGPointMake(1, centerY + lineHeightLeft/2)];
        [_leftLineColor set];
        [path stroke];
    }
    
    if (_isDrawBottomLine) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 2.0f;
        [path moveToPoint:CGPointMake(centerX - lineWithBotton/2,centerY + fontSize/2 +_bottomThanFontHeight +1 )];
        [path addLineToPoint:CGPointMake(centerX + lineWithBotton/2, centerY + fontSize/2 + _bottomThanFontHeight +1)];
        [_bottomLineColor set];
        [path stroke];
    }
    
    if (_isDrawBorderBottomLine) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = self.borderBottomHeight;
        [path moveToPoint:CGPointMake(0,CGRectGetHeight(rect) )];
        [path addLineToPoint:CGPointMake(with , CGRectGetHeight(rect))];
        [self.borderBottomLineColor set];
        [path stroke];
    }

    LOG(@"按钮 draw");
}

-(BOOL)isDrawLeftLine {
    if (!_isDrawLeftLine) {
        _isDrawLeftLine = NO;
    }
    return _isDrawLeftLine;
}

-(BOOL)isDrawRightLine {
    if (!_isDrawRightLine) {
        _isDrawRightLine = NO;
    }
    return _isDrawRightLine;
}
- (UIColor *)leftLineColor {
    if (!_leftLineColor) {
        _leftLineColor = [UIColor colorWithSevenCFontColor];
    }
    return _leftLineColor;
}
-(UIColor *)rightLineColor {
    if (!_rightLineColor) {
        _rightLineColor = [UIColor colorWithSevenCFontColor];
    }
    return _rightLineColor;
}
-(CGFloat)leftThanFontHeight {
    if (!_leftThanFontHeight) {
        _leftThanFontHeight = 0;
    }
    return _leftThanFontHeight;
}
-(CGFloat)rightThanFontHeight {
    if (!_rightThanFontHeight) {
        _rightThanFontHeight = 0;
    }
    return _rightThanFontHeight;
}
-(UIColor *)bottomLineColor {
    if (!_bottomLineColor) {
        _bottomLineColor = [UIColor colorWithSevenCFontColor];
    }
    return _bottomLineColor;
}
-(CGFloat)bottomThanFontHeight {
    if (!_bottomThanFontHeight) {
        
        _bottomThanFontHeight = 0;
    }
    return _bottomThanFontHeight;
}

- (BOOL)isDrawBorderBottomLine {
    
    if (!_isDrawBorderBottomLine) {
        _isDrawBorderBottomLine = NO;
    }
    return _isDrawBorderBottomLine;
}


- (void)setBorderBottomLineColor:(UIColor *)borderBottomLineColor {
    _borderBottomLineColor = borderBottomLineColor;
    [self setNeedsDisplay];
 }


- (CGFloat)borderBottomHeight {
    if (!_borderBottomHeight) {
        _borderBottomHeight = 3;
    }
    return _borderBottomHeight;
}


@end
