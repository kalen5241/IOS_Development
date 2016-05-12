//
//  MutThreadVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/10.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "MutThreadVC.h"

@interface MutThreadVC ()

@end

@implementation MutThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSTimer *time1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time1:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSTimer *time2 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time2:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)time1:(id)sender {
    
    static int count = 0;
    
    
    
    NSLog(@"time1");
}

- (void)time2:(id)sender {
    
    NSLog(@"time2");
}

@end
