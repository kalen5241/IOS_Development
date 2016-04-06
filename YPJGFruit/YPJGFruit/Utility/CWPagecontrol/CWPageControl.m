//
//  CWPageControl.m
//  CWCarStore
//
//  Created by wenjuan on 16/3/9.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "CWPageControl.h"

@implementation CWPageControl

-(void)layoutSubviews{
    [super layoutSubviews];
    if(self.subviews.count==1){
        ((UIView *)self.subviews[0]).hidden=YES;
        return;
    }
    CGSize size;
    size.height = 7;
    size.width = 7;
    
    CGFloat _width=([self.subviews count]-1)*(size.width+3) +size.width;
    float x =(SCREEN_WIDTH-_width)/2;

    for (int i=0; i<[self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        dot.hidden=NO;
        dot.layer.cornerRadius=size.width/2;
        dot.layer.borderWidth=1/[[UIScreen mainScreen]scale];
        dot.layer.borderColor=[UIColor whiteColor].CGColor;
        [dot setFrame:CGRectMake(i*(size.width+4)+x, (self.frame.size.height -size.height)/2, size.width, size.width)];
    }
}

@end
