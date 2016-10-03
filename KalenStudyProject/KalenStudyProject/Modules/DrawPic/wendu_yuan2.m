//
//  wendu_yuan2.m
//  2014621
//
//  Created by 孔凡群 on 14-6-30.
//  Copyright (c) 2014年 孔凡群. All rights reserved.
//

#import "wendu_yuan2.h"
#import "yuan2_zj.h"
@implementation wendu_yuan2

//代码创建初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setchushihua];

    }
    return self;
}

- (instancetype) initWithArray:(NSArray *)array {
    
    self = [super init];
    if (self) {
        [self setchushihuaWithArray:array];
        
    }
    return self;
}
-(void)setchushihuaWithArray:(NSArray *)array{
    _zj = [[yuan2_zj alloc]initWithArray:array];
    _zj.bPath = self.bPath;
    _zj.backgroundColor = [UIColor clearColor];
    [self insertSubview:_zj atIndex:0];
}


-(void)setchushihua{
    _zj = [[yuan2_zj alloc]init];
     _zj.bPath = self.bPath;
    _zj.backgroundColor = [UIColor clearColor];
    [self insertSubview:_zj atIndex:0];
}

//重绘方法
-(void)drawRect:(CGRect)rect{
    _zj.frame = rect;
    //宽度，值，宽度
    _zj.z = 50;
    _zj.zj_kd = 2;
}



@end
