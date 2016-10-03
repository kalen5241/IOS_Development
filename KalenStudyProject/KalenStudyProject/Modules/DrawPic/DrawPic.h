//
//  DrawPic.h
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayView.h"
#import <Masonry.h>
#import "ArcView.h"
#import "wendu_yuan2.h"
#import "BezierPathTool.h"

@interface DrawPic : UIViewController
@property (nonatomic,strong) NSArray *tempArr;
@property(nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong) DisplayView *lineView;
@property (nonatomic,strong)  wendu_yuan2 *lineO;
@property (nonatomic,strong)  ArcView *arcView;
@end
