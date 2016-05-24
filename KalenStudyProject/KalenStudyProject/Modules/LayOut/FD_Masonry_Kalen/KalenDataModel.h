//
//  KalenDataModel.h
//  KalenStudyProject
//
//  Created by kalen on 16/5/20.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KalenDataModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *imageName;

+(instancetype)initDataModelWithTitle:(NSString *)title andContent:(NSString *)content andImageView:(NSString *)imageView;


@end
