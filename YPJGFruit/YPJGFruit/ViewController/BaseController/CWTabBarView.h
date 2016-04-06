//
//  CWTabBarView.h
//  CWCarStore
//
//  Created by wenjuan on 16/3/2.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NSTABBARITEMS) {
    kTABBARDetect = 0,
    kTABBARService,
    kTABBARCommon,
    kTABBARSetting
};

@interface CWTabBarView : UIView

@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;
@property (nonatomic, strong) UIButton *button5;
@property (nonatomic, strong) NSArray *btns;
@property (nonatomic, strong) NSMutableArray *labelS;
@property (nonatomic, strong) NSMutableArray *bigButtonS;

- (void)addBtnsTarget:(id)aTarget action:(SEL)aAction;
- (void)selectedBtn:(NSInteger)aIndex;

@end
