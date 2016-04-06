//
//  CWTextView.m
//  CarSecretary
//
//  Created by wenjuan on 15/11/16.
//  Copyright © 2015年 Chewen. All rights reserved.
//

#import "CWTextView.h"

@implementation CWTextView


/**
 * 重写init方法  同时初始化一个通知，用来检测textView内容的改变
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setNeedsDisplay) name:UITextViewTextDidChangeNotification object:nil];
        
        self.placeholder = @"";
        self.placeholderColor = [UIColor colorWithHexString:@"acacac"];
        self.placeholderFont = [UIFont systemFontOfSize:16];
        
        
    }
    return self;
}

//绘制 placeholder的位置
-(void)drawRect:(CGRect)rect {
    
    //    if ([self.text isEqualToString:@""]) {
    if (!self.hasText) {
        
        CGRect placeholderRect;
        
        //设置placeholder的位置
        placeholderRect.origin.y = 8;
        placeholderRect.size.height = CGRectGetHeight(self.frame) - 8;
        
        placeholderRect.origin.x = 5;
        placeholderRect.size.width = CGRectGetWidth(self.frame) - 10;
        
        [self.placeholderColor set];
        
        //绘制placeholder
        [self.placeholder drawInRect:placeholderRect withAttributes:@{NSFontAttributeName:_placeholderFont,NSForegroundColorAttributeName: _placeholderColor}];
    }
}

//如果设置了为本内容  就重新绘制placeholder的内容
- (void)setText:(NSString *)text {
    [super setText:text];
    [self setNeedsDisplay];
}


@end
