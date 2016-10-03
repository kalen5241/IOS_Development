//
//  DrawPic.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "DrawPic.h"

@interface DrawPic ()

@end

@implementation DrawPic

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tempArr = @[@(0.1),@(0.6),@(0.3),@(0.7),@(1)];
    [self addView:_tempArr];
    [self addTimer];
}


- (void)addView:(NSArray *)arr{
    NSLog(@"%s",__FUNCTION__);
    
    if (self.lineO) {
        [self.lineO removeFromSuperview];
    }
    
    if (self.arcView){
        [self.arcView removeFromSuperview];
    }
    if (self.lineView){
        [self.lineView removeFromSuperview];
    }
    
    ArcView *arcView = [ArcView new];
    self.arcView = arcView;
    arcView.currentValue = [[arr lastObject] floatValue];

    [self.view addSubview:arcView];
    
        [arcView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view);
            make.width.height.equalTo(@142);
        }];
    
    DisplayView *line = [[DisplayView alloc]initWithArray:arr] ;
    
    line.backgroundColor = [UIColor clearColor];
    
    self.lineView = line;
    
    self.lineView.arr = arr;
    
    [self.view addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];
    
    wendu_yuan2 *line1 = [[wendu_yuan2 alloc]initWithArray:arr];
    line1.backgroundColor = [UIColor clearColor];
    self.lineO = line1;
    line1.arr = arr;
    [self.view addSubview:line1];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.height.equalTo(@100);
    }];
}



- (void)addTimer {
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(doSomething:) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)doSomething:(id)sender {
    
    [self changeData];
    [self addView:self.tempArr];
    
}

-(void) changeData {
    
    NSMutableArray *marr =[self.tempArr mutableCopy];
    [marr addObject:[marr firstObject]];
    [marr removeObjectAtIndex:0];
    self.tempArr = marr;
}

@end
