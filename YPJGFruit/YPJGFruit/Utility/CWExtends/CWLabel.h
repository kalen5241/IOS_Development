//
//  CWLabel.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/21.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWLabel : UILabel

@property (nonatomic ,assign) BOOL isDrawCenterLine;


/**
 *行间距  label中有内容后在设置行间距
 */
@property (nonatomic ,assign) CGFloat spaceLines;

@end
