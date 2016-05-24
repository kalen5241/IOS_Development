//
//  ScreenShotVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ScreenShotVC.h"
#import "QuartzCore/QuartzCore.h"
#import "UIImage+Additions.h"
#import "UIImage+Resize.h"

@interface ScreenShotVC ()
@property (nonatomic,strong) UIImageView *bgImgView;
@end

@implementation ScreenShotVC

- (void)viewDidLoad {
    [super viewDidLoad];


//
//    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    btn.backgroundColor = [UIColor redColor];
//    btn.frame = CGRectMake(50, 70, 60, 40);
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    
    // Use display size to constrain resizing
    // 120 is the logical display size
    
    
//    UIImage *pickerImage = [UIImage imageNamed:@"3.jpg"];
//    UIImage *resizedImage = [pickerImage resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(180, 180) interpolationQuality:kCGInterpolationDefault];
    
//    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 98, 80)];
//    imageView.backgroundColor = [UIColor blueColor];
//    self.bgImgView = imageView;
//    imageView.image = [self reSizeImage:[UIImage imageNamed:@"default_mealImage"] toSize:CGSizeMake(98, 80)];
//    
//    [self.view addSubview:imageView];
//    
//    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 98, 80)];
//    imageView2.image = [UIImage imageNamed:@"default_mealImage"];
//    
//    [self.view addSubview:imageView2];
//    

    
    
    

    
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 98, 80)];
//    imageView1.backgroundColor = [UIColor blueColor];
//    imageView1.image = resizedImage1;
    self.bgImgView = imageView1;
    [self.view addSubview:imageView1];
    
    UIImage *pickerImage1 = [UIImage imageNamed:@"taocan.png"];
    UIImage *resizedImage1 = [pickerImage1 resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake(100, 100) interpolationQuality:kCGInterpolationHigh];
    
    self.bgImgView.image = [self cutImage:resizedImage1];
    
    
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64,0,0,0));
//        
//        
//    }];
    
//    [self.view addSubview:imageView];
    
    // Use uncompressed size to constrain resizing
    //            UIImage *resizedImage = [pickerImage resizedImageWithUncompressedSizeInMB:1.0 interpolationQuality:kCGInterpolationDefault];
    
//    NSLog(@"logical size is %f:%f scale %f", resizedImage.size.width, resizedImage.size.height, resizedImage.scale);
    
    
//    //320 * 100
//    UIImage *image = [UIImage imageNamed:@"default_mealImage"];
//    CGRect rect = CGRectMake(0.0f, 100.0f, 80.0f, 80.0f);
//    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:rect];
//    imageView4.image = image;
//    
//    [UIImage imageWithImage:image
//scaledToSizeWithSameAspectRatio:rect.size
//                    Success:^(UIImage *newImage)
//     {
//         imageView.image = image;
//     }];
//    [self.view addSubview:imageView4];
//
//    //100 * 320
//    UIImage *image1 = [UIImage imageNamed:@"2.jpg"];
//    CGRect rect1 = CGRectMake(10.0f, 120.0f, 130.0f, 320.0f);
//    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:rect1];
//    imageView1.image = image1;
//    [UIImage imageWithImage:image1
//scaledToSizeWithSameAspectRatio:rect1.size
//                    Success:^(UIImage *newImage)
//     {
//         imageView1.image = newImage;
//     }];
//    [self.view addSubview:imageView1];
//    
//    //100 * 320
//    UIImage *image2 = [UIImage imageNamed:@"3.JPG"];
//    CGRect rect2 = CGRectMake(150.0f, 120.0f, 160.0f, 320.0f);
//    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:rect2];
//    imageView2.image = image2;
//    [UIImage imageWithImage:image2
//scaledToSizeWithSameAspectRatio:rect2.size
//                    Success:^(UIImage *newImage)
//     {
//         imageView2.image = newImage;
//     }];
//    [self.view addSubview:imageView2];

}

- (UIImage *)cutImage:(UIImage*)oldimage
{
    float sc1 =  self.bgImgView.bounds.size.height / oldimage.size.height;
    
    float sc2 =  self.bgImgView.bounds.size.width / oldimage.size.width;
    
    UIImage *image = [self scaleImage:oldimage toScale:sc1<sc2?sc1:sc2];
    
    CGSize newSize;
    CGImageRef imageRef = nil;
    
    if ((image.size.width / image.size.height) < (self.bgImgView.bounds.size.width / self.bgImgView.bounds.size.height)) {
        newSize.width = image.size.width;
        newSize.height = image.size.width * self.bgImgView.bounds.size.height / self.bgImgView.bounds.size.width;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, fabs(image.size.height - newSize.height) / 2, newSize.width, newSize.height));
        
    } else {
        newSize.height = image.size.height;
        newSize.width = image.size.height * self.bgImgView.bounds.size.width / self.bgImgView.bounds.size.height;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(fabs(image.size.width - newSize.width) / 2, 0, newSize.width, newSize.height));
        
    }
    
    return [UIImage imageWithCGImage:imageRef];
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
    
    UIImage* bigImage= [UIImage imageNamed:@"bb"];
    
    float height = bigImage.size.height;
    
    float width = bigImage.size.width;
    
//    NSLog(@"宽高比：%f",width/height);
    
    float targetWidth = 80;
    
    float targetHeight =  targetWidth / width * height;
    
    CGSize size;
    size.width = targetWidth;
    size.height = targetHeight;
    
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
