//
//  TaskManagerVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/2/7.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "TaskManagerVC.h"
#import "iCarousel.h"

@interface TaskManagerVC () <iCarouselDataSource,iCarouselDelegate>
@property (nonatomic ,strong) iCarousel *carousel;
@property (nonatomic ,assign) CGSize taskSize;
@end

@implementation TaskManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.carousel = [[iCarousel alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    CGFloat taskWidth = [UIScreen mainScreen].bounds.size.width * 5.0f / 7.0f;
    
    self.taskSize = CGSizeMake(taskWidth, taskWidth / 9.0f * 16.0f);
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.carousel setDelegate:self];
    [self.carousel setDataSource:self];
    [self.carousel setType:(iCarouselTypeCustom)];
    [self.carousel setBounceDistance:0.1f];
    
    [self.view addSubview:self.carousel];
    
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    
    return 7;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    UIView *tv = view;
    
    if (!tv) {
        tv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.taskSize.width,self.taskSize.height)];
        tv.backgroundColor = [UIColor grayColor];
    }
    
//    tv.layer.cornerRadius = 5.0;
//    
//    tv.tag = index;
//    
//    [tv.layer setShadowRadius:3.0f];
//    
//    [tv.layer setShadowColor:[UIColor grayColor].CGColor];
//    
//    [tv.layer setShadowOffset:CGSizeZero];
//    
    

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:tv.bounds];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
//    [layer setFrame:imageView.bounds];
//    
//    layer.cornerRadius = 5.0f;
//    
//    [imageView.layer setMask:layer];
//    
//    [imageView setContentMode:UIViewContentModeScaleAspectFill];
//    
//    imageView.backgroundColor = [UIColor yellowColor];
    
    imageView.image = [UIImage imageNamed:@"taocan"];
    
    [tv addSubview:imageView];
    
//    UILabel *l = [[UILabel alloc] initWithFrame:tv.frame];
//    
//    [l setText:[@(index) stringValue]];
//    
//    [l setBackgroundColor:[UIColor blueColor]];
//     
//    [tv addSubview:l];
    
    return tv;
}


- (CGFloat) calcScaleWithOffset:(CGFloat)offset {
    
    return offset * 0.02f + 1.0f;
}

- (CGFloat) calcTranslationWithOffset:(CGFloat)offset {
    
    CGFloat z = 5.0f/4.0f;
    CGFloat a = 5.0f/8.0f;
    
    if (offset >= z/a) {
        return 2.0f;
    }
    
    return 1/(z-a*offset)-1/z;
}

- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform {
    CGFloat scale = [self calcScaleWithOffset:offset];
    
    CGFloat translation = [self calcTranslationWithOffset:offset];
    
//    return CATransform3DTranslate(transform, offset * self.taskSize.width, 0, 0);
      return CATransform3DScale(CATransform3DTranslate(transform,translation * self.taskSize.width, 0, offset),scale,scale,0);
}


@end
