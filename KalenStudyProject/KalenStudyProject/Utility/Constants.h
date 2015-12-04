//
//  Constants.h
//  KalenStudyProject
//
//  Created by kalen on 15/11/16.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject
#define UMENG_APPKEY @"5316be2d56240b343a0f61ce"

#define FRAME_LOG(u) NSLog(@"frame.x 为 %f",(u).origin.x);NSLog(@"frame.y 为 %f",(u).origin.y);NSLog(@"frame.H 为 %f",(u).size.height);NSLog(@"frame.W 为 %f",(u).size.width);

#define BOUNDS_LOG(u) NSLog(@"bounds.x 为 %f",(u).origin.x);NSLog(@"bounds.y 为 %f",(u).origin.y);NSLog(@"bounds.H 为 %f",(u).size.height);NSLog(@"bounds.W 为 %f",(u).size.width);


@end
