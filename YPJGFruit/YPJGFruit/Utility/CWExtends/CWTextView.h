//
//  CWTextView.h
//  CarSecretary
//
//  Created by wenjuan on 15/11/16.
//  Copyright © 2015年 Chewen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"

@interface CWTextView : UITextView

/**
 * 占位符文本  与textField的placeholder功能一致
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 *占位符 颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

/**
 *placeholder 字体的大小
 */
@property (nonatomic, strong) UIFont *placeholderFont;

@end
