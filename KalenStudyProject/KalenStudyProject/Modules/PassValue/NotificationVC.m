//
//  NotificationVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/10.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "NotificationVC.h"

@interface NotificationVC ()

@end

@implementation NotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receMessage:) name:@"redK" object:nil];
    
}


- (void)receMessage:(NSNotification *)notification {
    
    NSDictionary *data = notification.userInfo;
    
    self.showLabel.text = data[@"msg"];
    
}

- (IBAction)click:(id)sender {
    
    NSDictionary *message = @{@"msg":@"kalen"};
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center postNotificationName:@"redK" object:nil userInfo:message];
    
}

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
