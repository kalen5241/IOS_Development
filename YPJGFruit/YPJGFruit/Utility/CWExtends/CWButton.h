//
//  CWButton.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/4.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWButton : UIButton

/**
 * 左边线条
 */
@property (nonatomic, assign)BOOL isDrawLeftLine;
/**
 * 右边线条
 */
@property (nonatomic, assign)BOOL isDrawRightLine;
/**
 * 左边线条颜色
 */
@property (nonatomic, strong) UIColor *leftLineColor;
/**
 * 右边线条颜色
 */
@property (nonatomic, strong) UIColor *rightLineColor;
/**
 * 左边线 高度（高出字体的部分）
 */
@property (nonatomic, assign) CGFloat leftThanFontHeight;
/**
 * 右边线 高度 （高出字体的部分）
 */
@property (nonatomic, assign) CGFloat rightThanFontHeight;
/**
 * 字体下的横线
 */
@property (nonatomic, assign) BOOL isDrawBottomLine;
/**
 * 字体下方 横线的颜色
 */
@property (nonatomic, strong) UIColor *bottomLineColor;
/**
 *字体下方 横线距离字体的距离
 */
@property (nonatomic, assign) CGFloat bottomThanFontHeight;


/**
 * 下边框上的横线
 */
@property (nonatomic, assign) BOOL isDrawBorderBottomLine;
/**
 * 字体下方 横线的颜色
 */
@property (nonatomic, strong) UIColor *borderBottomLineColor;
/**
 *字体下方 横线距离字体的距离
 */
@property (nonatomic, assign) CGFloat borderBottomHeight;

@end
