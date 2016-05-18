//
//  UIImage+Additions.m
//  XMLPaserManager
//
//  Created by Lee on 14-3-27.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import "UIImage+Additions.h"
@interface TDCountedColor : NSObject

@property (assign) NSUInteger count;
@property (strong) UIColor *color;

- (id)initWithColor:(UIColor *)color count:(NSUInteger)count;

@end

@implementation TDCountedColor

- (id)initWithColor:(UIColor *)color count:(NSUInteger)count {
	if ((self = [super init])) {
		self.color = color;
		self.count = count;
	}
	return self;
}

- (NSComparisonResult)compare:(TDCountedColor *)object {
	if ([object isKindOfClass:[TDCountedColor class]]) {
		if (self.count < object.count)
			return NSOrderedDescending;
		else if (self.count == object.count)
			return NSOrderedSame;
	}
	return NSOrderedAscending;
}


@end
@implementation UIColor(Additions)
- (BOOL)isBlackOrWhite {
    if (!self)
        return NO;
    
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    if (r > 0.91f && g > 0.91f && b > 0.91f)
        return YES;
    if (r < 0.09f && g < 0.09f && b < 0.09f)
        return YES;
    return NO;
}
@end
@implementation UIImage(Additions)
+ (UIColor *)colorFromImage:(UIImage *)image atX:(int)x andY:(int)y {
    
    // Put image in buffer
    CGImageRef imageRef = image.CGImage;
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height, bitsPerComponent, bytesPerRow,
                                                 colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    // rawDara now contains the image data in RGBA8888
    int byteIndex = (bytesPerRow * y) + (x * bytesPerPixel);
    
    CGFloat red = (rawData[byteIndex] * 1.f) / 255.f;
    CGFloat green = (rawData[byteIndex + 1] * 1.f) / 255.f;
    CGFloat blue = (rawData[byteIndex + 2] * 1.f) / 255.f;
    CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.f;
    free(rawData);
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
- (UIColor *)imageBgColor
{
    size_t width = CGImageGetWidth(self.CGImage);
    size_t height = CGImageGetHeight(self.CGImage);
    
    NSCountedSet *imageColors = [[NSCountedSet alloc] initWithCapacity:width * height];
    NSCountedSet *leftEdgeColors = [[NSCountedSet  alloc] initWithCapacity:height];
    
    for (NSUInteger x = 0; x < width; x++) {
        for (NSUInteger y = 0; y < height; y++) {
            UIColor *color = [UIImage colorFromImage:self atX:x andY:y];
            if (x == 0)
                [leftEdgeColors addObject:color];
            [imageColors addObject:color];
        }
    }
    

    
    NSEnumerator *enumerator = [leftEdgeColors objectEnumerator];
    UIColor *curColor = nil;
    NSMutableArray *sortedColors = [NSMutableArray arrayWithCapacity:leftEdgeColors.count];
    
    while ((curColor = [enumerator nextObject]) != nil) {
        NSUInteger colorCount = [leftEdgeColors countForObject:curColor];
        NSInteger randomColorsThreshold = (NSInteger)(height * 0.01);
        if (colorCount < randomColorsThreshold)
            continue;
        
        [sortedColors addObject:[[TDCountedColor alloc] initWithColor:curColor count:colorCount]];

    }
    
    [sortedColors sortUsingSelector:@selector(compare:)];
    
    TDCountedColor *proposedBackgroundColor = nil;
    
    if (sortedColors.count > 0) {
        proposedBackgroundColor = sortedColors[0];
        if ([proposedBackgroundColor.color isBlackOrWhite]) {
            for (NSInteger i = 1; i < sortedColors.count; i++) {
                TDCountedColor *nextProposed = sortedColors[i];
                if (((double)nextProposed.count / (double)proposedBackgroundColor.count) > 0.3f) {
                    if (![nextProposed.color isBlackOrWhite]) {
                        proposedBackgroundColor = nextProposed;
                        break;
                    }
                } else {
                    break;
                }
            }
        }
    }
    return proposedBackgroundColor.color;
}

+ (CGContextRef)createContextRef:(CGSize)size bgColor:(CGColorRef)colorRef{
    CGFloat scaleFactor = [[UIScreen mainScreen] scale];
    CGFloat width = size.width * scaleFactor;
    CGFloat height = size.height * scaleFactor;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef bgColorRef = (colorRef==nil) ? [[UIColor whiteColor] CGColor] : colorRef;
    CGContextRef contextRef;
    contextRef = CGBitmapContextCreate(NULL, width, height, 8, width * 4, colorSpaceRef,
                                       kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Big);
    
    CFRelease(colorSpaceRef);
    CGContextScaleCTM(contextRef, scaleFactor, scaleFactor);
    CGContextSetFillColorWithColor(contextRef, bgColorRef);
    CGContextFillRect(contextRef, CGRectMake(0.f, 0.f,size.width, size.height));
    return contextRef;
}


+ (void)imageWithImage:(UIImage*)sourceImage
scaledToSizeWithSameAspectRatio:(CGSize)targetSize
               Success:(void (^)(UIImage *image))success
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // something
    UIColor *bgColor = [sourceImage imageBgColor];
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    NSInteger targetWidth = targetSize.width;
    NSInteger targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointZero;
    
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor) {
            scaleFactor = heightFactor;
        }
        else {
            scaleFactor = widthFactor;
        }
        
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor) {
            thumbnailPoint.x = (int)(targetWidth - scaledWidth) * 0.5;
        }
        else if (widthFactor < heightFactor) {
            thumbnailPoint.y = (int)(targetHeight - scaledHeight) * 0.5;
        }
    }
    
    
    // 图片信息
    CGImageRef imageRef = [sourceImage CGImage];
    CGContextRef bitmap;
    
    //    data                 指向要渲染的绘制内存的地址。这个内存块的大小至少是（bytesPerRow*height）个字节
    //    width                bitmap的宽度,单位为像素
    //    height               bitmap的高度,单位为像素
    //    bitsPerComponent     内存中像素的每个组件的位数.例如，对于32位像素格式和RGB 颜色空间，你应该将这个值设为8.
    //    bytesPerRow          bitmap的每一行在内存所占的比特数
    //    colorspace           bitmap上下文使用的颜色空间。
    //    bitmapInfo           指定bitmap是否包含alpha通道，像素中alpha通道的相对位置，像素组件是整形还是浮点型等信息的字符串。
    
    bitmap = [self createContextRef:targetSize bgColor:[bgColor CGColor]];
    
    
    // In the right or left cases, we need to switch scaledWidth and scaledHeight,
    // and also the thumbnail point
    if (sourceImage.imageOrientation == UIImageOrientationLeft) {
        thumbnailPoint = CGPointMake(thumbnailPoint.y, thumbnailPoint.x);
        CGFloat oldScaledWidth = scaledWidth;
        scaledWidth = scaledHeight;
        scaledHeight = oldScaledWidth;
        CGFloat angle = M_PI_2; //
        CGContextRotateCTM (bitmap, angle);
        CGContextTranslateCTM (bitmap, 0, -targetHeight);
        
    } else if (sourceImage.imageOrientation ==UIImageOrientationRight) {
        thumbnailPoint = CGPointMake(thumbnailPoint.y, thumbnailPoint.x);
        CGFloat oldScaledWidth = scaledWidth;
        scaledWidth = scaledHeight;
        scaledHeight = oldScaledWidth;
        CGContextRotateCTM (bitmap, -M_PI_2);
        CGContextTranslateCTM (bitmap, -targetWidth, 0);
        
    } else if (sourceImage.imageOrientation == UIImageOrientationUp) {
        // NOTHING
    } else if (sourceImage.imageOrientation == UIImageOrientationDown){
        CGContextTranslateCTM (bitmap, targetWidth, targetHeight);
        CGContextRotateCTM (bitmap, M_PI);
    }
    
    CGContextDrawImage(bitmap, CGRectMake(thumbnailPoint.x,thumbnailPoint.y, scaledWidth, scaledHeight), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage* newImage = [UIImage imageWithCGImage:ref];
    
    
    CGImageRelease(ref);
    CGContextRelease(bitmap);

        dispatch_async(dispatch_get_main_queue(), ^{
            success(newImage);
        });
    });
}


@end



