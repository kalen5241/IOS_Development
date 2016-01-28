//
//  ScreenShotVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ScreenShotVC.h"
#import "QuartzCore/QuartzCore.h"

@interface ScreenShotVC ()
@property (nonatomic,strong) UIImageView *im;
@end

@implementation ScreenShotVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.backgroundColor = [UIColor blueColor];
    imageView.image = [UIImage imageNamed:@"taocan"];
    
    [self.view addSubview:imageView];

    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64,0,0,0));
    }];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(50, 70, 60, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];

}

-(void)click:(UIButton *)sender {
    
    NSString *path = NSHomeDirectory();
    NSString *imagePath = nil;
    UIImage *image = nil;
    image = [self getSnapshotImage1];
    imagePath = [path stringByAppendingString:@"/Documents/flower1.png"];
    //[UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    [self saveToAlbum:image];
    image = [self getSnapshotImage2];
    imagePath = [path stringByAppendingString:@"/Documents/flower2.png"];
    //[UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    
    image = [self getSnapshotImage3];
    imagePath = [path stringByAppendingString:@"/Documents/flower3.png"];
    //[UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    
    image = [self getSnapshotImage4];
    imagePath = [path stringByAppendingString:@"/Documents/flower4.png"];
    //[UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    
    image = [self getSnapshotImage5];
    imagePath = [path stringByAppendingString:@"/Documents/flower5.png"];
    //[UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    
    [self saveToAlbum:image];

    
}

- (UIImage *)getSnapshotImage1 {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)), NO, 1);
    
    [self.view drawViewHierarchyInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) afterScreenUpdates:NO];
    
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return snapshot;

}


//截取高清图片
- (UIImage *)getSnapshotImage2 {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)), NO, 2.0);  //NO，YES 控制是否透明   2.0为清晰度
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIImage *)getSnapshotImage3 {
    //大图bigImage
    //定义myImageRect，截图的区域
    
    UIImage* bigImage= [UIImage imageNamed:@"taocan"];
    
    CGImageRef imageRef = bigImage.CGImage;
    
    CGRect myImageRect = CGRectMake(70, 10, 150, 150);
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    
    return smallImage;
}

-(UIImage *)getSnapshotImage4 {
    //大图bigImage
    //定义myImageRect，截图的区域
    
    UIImage* bigImage= [UIImage imageNamed:@"taocan"];
    
    CGImageRef imageRef = bigImage.CGImage;
    
    CGSize size;
    size.width = 150;
    size.height = 150;
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, CGRectMake(0, 0, 150, 150), imageRef);
    
    UIImage *image =nil;
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextDrawImage(context, CGRectMake(0, 0, 150, 150), image.CGImage);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

-(UIImage *)getSnapshotImage5 {
    
    UIImage* bigImage= [UIImage imageNamed:@"taocan"];
    
    CGSize size;
    size.width = 150;
    size.height = 150;
    
    UIGraphicsBeginImageContext(size);
    
    [bigImage drawInRect:CGRectMake(0, 0, 150, 150)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


//同比例缩放
- (UIImage *) scaleImage:(UIImage *)image toScale:(float)scaleSize {

    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
                                
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
                                
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
   
    UIGraphicsEndImageContext();
    
    return scaledImage;
}


//自定义大小
- (UIImage *) reSizeImage:(UIImage *)image toSize:(CGSize)reSize {
    
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

//获取指定View的截图
-(UIImage*) captureView:(UIView *)theView {
    
    CGRect rect = theView.frame;
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [theView.layer renderInContext:context];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}


//保存至相册
-(void) saveToAlbum : (UIImage *)image {
    
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
}


@end
