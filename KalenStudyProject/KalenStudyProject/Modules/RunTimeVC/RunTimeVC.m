//
//  RunTimeVC.m
//  KalenStudyProject
//
//  Created by kalen on 15/12/8.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "RunTimeVC.h"
#import "AnimalC.h"
#import <objc/runtime.h>

@interface RunTimeVC ()

@end

@implementation RunTimeVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self logVarName:[AnimalC class]];
    
}

- (void)logVarName :(Class)an {
    unsigned int * count = malloc(sizeof(unsigned int));
    
    Ivar * mem = class_copyIvarList(an, count);
    
    for (int i = 0; i < *count; i++) {
        Ivar var = * (mem + i);
        const char * name = ivar_getName(var);
        const char * type = ivar_getTypeEncoding(var);
        NSLog(@"%s : %s\n",name,type);
    }
    free(count);
    count = nil;
}

- (void)changeVarValue :(Class)an {
    
    unsigned int count;
    Ivar *mem = class_copyIvarList(an, &count);
    AnimalC *animal = [[AnimalC alloc]init];
    NSLog(@"before runtime operation: %@",animal);
    object_setIvar(animal,mem[0],@"哦");
    object_setIvar(animal,mem[1],@"第一个");
    object_setIvar(animal,mem[2],@"第二个");
    NSLog(@"after runtime operation: %@",animal);
}

- (void)logMathodName :(Class)an {
    //获取所有成员方法
    unsigned int count;
    Method * mem = class_copyMethodList(an, &count);
    //遍历
    for(int i=0;i<count;i++){
        SEL name = method_getName(mem[i]);
        NSString * method = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        NSLog(@"%@\n",method);
    }
}

- (void) addMethod:(Class)an {
    
    class_addMethod(an, @selector(kalen1), (IMP)kalen, "v");
    [self logMathodName:an];
    AnimalC *t = [[AnimalC alloc]init];
    [t performSelector:@selector(kalen1)];
}

- (void)changeMethod:(Class)an {
    
    AnimalC *t = [[AnimalC alloc] init];
    
    [t method1];
    
    class_replaceMethod(an, @selector(method1), (IMP)kalen, "v");
    
   [t method1];
}

void kalen () {
    NSLog(@"kkkkkkkkkkalen");
}

@end
