//
//  Animal.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/2.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "AnimalC.h"
#import <objc/runtime.h>

@implementation AnimalC


//-(instancetype)init {
//    
//    self = [super init];
//    if (self) {
//        
//    }
//    return self;
//}

-(instancetype)initWithName:(NSString *)name andSex:(NSString *)sex {
    
    self = [super init];
    if (self) {
        self.name = name;
        self.sex = sex;
    }
    return self;
}

+(instancetype)animal {
    
    return [[AnimalC alloc]init];
}

+(instancetype)animalWithName:(NSString *)name andSex:(NSString *)sex andWeight:(NSString *)weight{

    AnimalC *a =  [[AnimalC alloc]initWithName:name andSex:sex];
    objc_setAssociatedObject(a, @"weight", weight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return a;
}

+(instancetype)animalWithName:(NSString *)name andSex:(NSString *)sex andWeightBlock:(void (^)(NSString *weight))block {
    
    AnimalC *a = [[AnimalC alloc]initWithName:name andSex:sex];
    objc_setAssociatedObject(a, @"block", block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return a;
}


@end
