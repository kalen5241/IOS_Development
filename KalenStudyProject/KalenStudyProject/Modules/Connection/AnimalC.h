//
//  Animal.h
//  KalenStudyProject
//
//  Created by kalen on 15/12/2.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimalC : NSObject
{
    @private NSString *age;
    @private NSString *aciton;
}

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *sex;

-(void)method1;
-(NSString *)method2;

-(instancetype)init;

- (void)setMode:(NSString *)modeA;

-(instancetype)initWithName:(NSString *)name andSex:(NSString *)sex;

-(instancetype)initWithAge:(NSString *)ageInput andAction:(NSString *)actionInput;

+(instancetype)animal;

+(instancetype)animalWithName:(NSString *)name andSex:(NSString *)sex andWeight:(NSString *)weight;

+(instancetype)animalWithName:(NSString *)name andSex:(NSString *)sex andWeightBlock:(void (^)(NSString *weight))block;

@end
