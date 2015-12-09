//
//  Animal.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/2.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "AnimalC.h"
#import <objc/runtime.h>

@interface AnimalC ()
{
    @private NSString *mode;
}

@end


@implementation AnimalC

- (void)setMode:(NSString *)modeA {
    
    mode = modeA;
    
}


-(instancetype)init {
    
    self = [super init];
    if (self) {
        age = @"q";
        aciton = @"ppp";
        mode = @"pl";
    }
    return self;
}


-(instancetype)initWithAge:(NSString *)ageInput andAction:(NSString *)actionInput {
    self = [super init];
    
    if (self) {
        age = ageInput;
        aciton = actionInput;
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name andSex:(NSString *)sex {
    
    self = [super init];
    if (self) {
        self.name = name;
        self.sex = sex;
    }
    return self;
}

+ (instancetype)animal {
    
    return [[AnimalC alloc]init];
}

+ (instancetype)animalWithName:(NSString *)name andSex:(NSString *)sex andWeight:(NSString *)weight{

    AnimalC *a =  [[AnimalC alloc]initWithName:name andSex:sex];
    objc_setAssociatedObject(a, @"weight", weight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return a;
}

+ (instancetype)animalWithName:(NSString *)name andSex:(NSString *)sex andWeightBlock:(void (^)(NSString *weight))block {
    
    AnimalC *a = [[AnimalC alloc]initWithName:name andSex:sex];
    objc_setAssociatedObject(a, @"block", block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return a;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"age=%@\naction=%@\nmode=%@",age,aciton,mode];
}


-(void)method1{
    NSLog(@"iii");
}
-(NSString *)method2{
    return @"method2";
}

@end
