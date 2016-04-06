//
//  CWTextFieldView.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/18.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWTextFieldView : UIView

@property (nonatomic, strong) UITextField *textField;


/**
 * 下边框 横线
 */
@property(nonatomic, assign)BOOL isDrawLine;
/**
 * 左边的线
 */
@property (nonatomic, assign) BOOL isDrawLeftLine;
/**
 * 左边线的颜色
 */
@property (nonatomic, strong) UIColor *leftLineColor;

@end
