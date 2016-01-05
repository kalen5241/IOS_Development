//
//  DrawPic.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/4.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "DrawPic.h"
#import "DisplayView.h"
#import <Masonry.h>
typedef NS_ENUM(NSUInteger, ShapeType) {
    ShapeTypeCir,
    ShapeTypeTri,
    ShapeTypeSqu,
    ShapeTypedia,
};
@interface DrawPic ()

@end




@implementation DrawPic

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    //l.backgroundColor = [UIColor redColor];
    l.numberOfLines = 0;
    l.text = @"您好我是您的";
    
//    for (int i = 0;i < 5; i++) {
//        l.transform=CGAffineTransformMakeRotation(M_PI/2* i);
//        NSLog(@"%f,%f",l.center.x,l.center.y);
//        FRAME_LOG(l.frame);
//    }
        l.transform=CGAffineTransformMakeRotation(M_PI/2* 3);
        NSLog(@"%f,%f",l.center.x,l.center.y);
        FRAME_LOG(l.frame);

    
    l.textColor = [UIColor redColor];
    [self.view addSubview:l];
    
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
       // make.width.equalTo(@100);
    }];
    
    
    
    
//    DisplayView *d = [DisplayView new];
//    d.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:d];
//    [d mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64,0,0,0));
//    }];
//    UIImageView *de = [self getCustomImageViewWithShapeType:(ShapeTypeTri) andWetherLine:YES];
//    [self.view addSubview:de];
//    [de mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(200);
//        make.left.equalTo(self.view).offset(200);
//        make.height.equalTo(@5);
//        make.width.equalTo(@5);
//    }];
}

- (UIImageView *)getCustomImageViewWithShapeType:(ShapeType)type andWetherLine:(BOOL)lineType {
    
    UIImageView *d1 = [[UIImageView alloc]init];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 100), NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    switch (type) {
        case ShapeTypeCir:
            //圆形
            /**/
            path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 80, 80)];
            break;
        
        case ShapeTypeTri:
            //三角形
            /**/
             [path moveToPoint:CGPointMake(0, 0)];
             [path addLineToPoint:CGPointMake(80, 0)];
             [path addLineToPoint:CGPointMake(40, 80)];
            break;
        case ShapeTypeSqu:
            //正方形
            /**/
             [path moveToPoint:CGPointMake(0, 0)];
             [path addLineToPoint:CGPointMake(80, 0)];
             [path addLineToPoint:CGPointMake(80, 80)];
             [path addLineToPoint:CGPointMake(0, 80)];
            break;
        case ShapeTypedia:
            //菱形
            /**/
             [path moveToPoint:CGPointMake(40, 0)];
             [path addLineToPoint:CGPointMake(80, 40)];
             [path addLineToPoint:CGPointMake(40, 80)];
             [path addLineToPoint:CGPointMake(0, 40)];
            break;
        default:
            break;
    }
    //横线
    /**/
    if (lineType) {
        UIBezierPath *path1 = [UIBezierPath bezierPath];
        [path1 moveToPoint:CGPointMake(0, 40)];
        [path1 addLineToPoint:CGPointMake(100, 40)];
        [path1 addLineToPoint:CGPointMake(100, 60)];
        [path1 addLineToPoint:CGPointMake(0, 60)];
        [[UIColor greenColor] setFill];
        [path1 closePath];
        [path1 fill];
    }
    
    [[UIColor greenColor] setFill];
    [path closePath];
    [path fill];
    
    //就将刚刚在内存中临时绘制的视图保存成了一张图片
    UIImage *tempImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    d1.image = tempImg;
    
    return d1;
}
@end
