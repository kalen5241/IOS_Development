//
//  CWLabel.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/21.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWLabel.h"

@implementation CWLabel


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    CGFloat centerY = CGRectGetMidY(rect);
    CGFloat with = CGRectGetWidth(rect);
    
    if (_isDrawCenterLine) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, centerY)];
        [path addLineToPoint:CGPointMake(with, centerY)];
        [self.textColor set];
        [path stroke];
    }
}
 
- (void)setSpaceLines:(CGFloat)spaceLines {
    if (spaceLines) {
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:self.text];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:spaceLines];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [self.text length])];
        [self setAttributedText:attributedString1];
        [self sizeToFit];
    }
}


@end
