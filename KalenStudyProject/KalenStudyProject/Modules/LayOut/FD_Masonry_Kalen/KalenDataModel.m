//
//  KalenDataModel.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/20.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "KalenDataModel.h"

@implementation KalenDataModel

+(instancetype)initDataModelWithTitle:(NSString *)title andContent:(NSString *)content andImageView:(NSString *)imageName {
    
    KalenDataModel *data = [[self alloc]init];
    
    data.title = title;
    data.content = content;
    data.imageName = imageName;
    
    return data;
}

@end
