//
//  Block.h
//  KalenStudyProject
//
//  Created by kalen on 16/1/14.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NSString *(^myBlock) (NSString *temp);

@interface Block : UIViewController

- (void)click:(myBlock)block;

@end
