//
//  ImageDevVC.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/3.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "ImageDevVC.h"

@interface ImageDevVC ()

@end

@implementation ImageDevVC

static int i;

- (void)viewDidLoad {
    [super viewDidLoad];
    i = 0;
    self.myImage.image = [UIImage imageNamed:@"taocan"];
    self.myImageTwo.image = [UIImage imageNamed:@"taocan"];
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(update:) userInfo:nil repeats:YES];
     [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
  //  UIEdgeInsets i = UIEdgeInsetsMake(30, 30, 30, 30);
//    UIImage *image = [[UIImage imageNamed:@"taocan"]imageWithAlignmentRectInsets:i];
//    self.myImage.image = image;

//    UIImage *image = [[UIImage imageNamed:@"taocan"]resizableImageWithCapInsets:i];
//    
//   self.myImage.image = image;

}


- (void)update:(NSTimer *)timer
{
    
    if (i%2) {
        self.myImage.image = [UIImage imageNamed:@"taocan"];
        self.myImageTwo.image = [UIImage imageNamed:@"taocan"];
    }else {
        UIEdgeInsets i = UIEdgeInsetsMake(30, 30, 30, 30);
        self.myImage.clipsToBounds = YES;
        UIImage *imageNew = [self.myImage.image imageWithAlignmentRectInsets:i];
        self.myImage.image = imageNew;
        UIImage *imageNew1 = [self.myImageTwo.image imageWithAlignmentRectInsets:i];
        self.myImageTwo.image = imageNew1;
    }
    i++;

    //[timer invalidate];
}


@end
