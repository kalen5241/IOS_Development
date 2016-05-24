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
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    i = 0;
//    self.myImage.image = [UIImage imageNamed:@"taocan"];
//    self.myImageTwo.image = [UIImage imageNamed:@"taocan"];
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(update:) userInfo:nil repeats:YES];
//     [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//  //  UIEdgeInsets i = UIEdgeInsetsMake(30, 30, 30, 30);
////    UIImage *image = [[UIImage imageNamed:@"taocan"]imageWithAlignmentRectInsets:i];
////    self.myImage.image = image;
//
////    UIImage *image = [[UIImage imageNamed:@"taocan"]resizableImageWithCapInsets:i];
////    
////   self.myImage.image = image;
//
//}


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


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
    UIImage *image = [UIImage imageNamed:@"taocan.png"];
    
    CGFloat width = image.size.width;
    
    CGFloat height = image.size.height;
    
    
    
    //加图片水印
    
    UIImage *image01 = [self addToImage:image image:image withRect:CGRectMake(0, 20, 30, 30)];
    
    UIImageView *imag = [[UIImageView alloc] initWithImage:image01];
    
    imag.frame = CGRectMake(10, 100, width,height);
    
    [self.view addSubview:imag];
    
    
    
    //剪切图片
    
    UIImage *image1 =[self cutImage:image withRect:CGRectMake(10, 20, 60, 100)];//
    
    int w = image1.size.width;
    
    int h = image1.size.height;
    
    UIImage *image11 = [self addText:image1 text:@"剪切" withRect:CGRectMake(10,(h-30)/2, w, 30) ];
    
    UIImageView *imag1 = [[UIImageView alloc] initWithImage:image11];
    
    imag1.frame = CGRectMake(10, 210, image1.size.width,image1.size.height);
    
    [self.view addSubview:imag1];
    
    
    
    //缩小图片
    
    UIImage *image2 = [self scaleToSize:image size:CGSizeMake(image1.size.width, image1.size.height)];
    
    UIImage *image22 = [self addText:image2 text:@"压缩" withRect:CGRectMake(10,(h-30)/2, w, 30) ];
    
    UIImageView *imag2 = [[UIImageView alloc] initWithImage:image22];
    
    imag2.frame = CGRectMake(10, 300, image2.size.width,image2.size.height);
    
    [self.view addSubview:imag2];
    
    //压缩图片大小并保存
    
    [self zipImageData:image];
    
    
    
}

//压缩图片

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    
    
    
    // 设置成为当前正在使用的context
    
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    
    return scaledImage;
    
}


//截图图片

- (UIImage *)cutImage:(UIImage *)image withRect:(CGRect )rect

{
    
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    
    UIImage * img = [UIImage imageWithCGImage:imageRef];
    
    CGImageRelease(imageRef);
    
    return img;
    
}


//压缩图片大小

- (void)zipImageData:(UIImage *)image

{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyyMMddHHSSS"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *dateStr = [NSString stringWithFormat:@"%@.jpg",currentDateStr];
    
    
    
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:dateStr];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        NSError *error;
        
        [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        
    }
    
    NSData *imgData = UIImageJPEGRepresentation(image, 1);
    
    
    
    if([imgData writeToFile:path atomically:YES])
        
    {
        
        NSLog(@"saveSuccess");
        
    }
    
}

//加文字水印

- (UIImage *) addText:(UIImage *)img text:(NSString *)mark withRect:(CGRect)rect

{
    
    int w = img.size.width;
    
    int h = img.size.height;
    
    
    UIGraphicsBeginImageContext(img.size);
    
    [[UIColor redColor] set];
    
    [img drawInRect:CGRectMake(0, 0, w, h)];
    
    
    
    if([[[UIDevice currentDevice]systemName]floatValue] >= 7.0)
        
    {
        
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20.0f], NSFontAttributeName,[UIColor blueColor] ,NSForegroundColorAttributeName,nil];
        
        [mark drawInRect:rect withAttributes:dic];
        
    }
    
    else
        
    {
        
        
        
        //该方法在7.0及其以后都废弃了
        
        [mark drawInRect:rect withFont:[UIFont systemFontOfSize:20]];
        
    }
    
    
    
    UIImage *aimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return aimg;
    
}


//加图片水印

- (UIImage *) addToImage:(UIImage *)img image:(UIImage *)newImage withRect:(CGRect)rect

{
    
    int w = img.size.width;
    
    int h = img.size.height;
    
    UIGraphicsBeginImageContext(img.size);
    
    [img drawInRect:CGRectMake(0, 0, w, h)];
    
    [newImage drawInRect:rect];
    
    
    
    UIImage *aimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    return aimg;
    
}

@end
