//
//  GuideDataItem.h
//  KalenStudyProject
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GuideDataItem : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIViewController *destVC;
@property (nonatomic,strong) NSString *detail;

@end