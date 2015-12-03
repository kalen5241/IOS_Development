//
//  MutilDataSource.h
//  KalenStudyProject
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "After.h"
#import "Before.h"

@interface MutilDataSource : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) After *after;
@property (strong,nonatomic) Before *before;

@end
