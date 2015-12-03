//
//  MutilDataSource.m
//  KalenStudyProject
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "MutilDataSource.h"
#import "CustomCellOne.h"

@interface MutilDataSource ()

@end

@implementation MutilDataSource

- (void)viewDidLoad {
    [super viewDidLoad];
    self.after = [[After alloc]init];
    self.before = [[Before alloc]init];
    self.before.destData = self.after;
    self.tableView.dataSource = self.before;
    self.tableView.delegate = self.before;
}



@end
