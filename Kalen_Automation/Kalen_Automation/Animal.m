//
//  Animal.m
//  Kalen_Automation
//
//  Created by kalen on 15/6/4.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import "Animal.h"

@implementation Animal
-(BOOL)isMale{
    
    if ([self.sex isEqualToString:@"Male"]) {
        return YES;
    }else{
        return NO;
    }
}
@end
