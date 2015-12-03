//
//  LeftMenuVCViewController.m
//  InstallAssistant
//
//  Created by Robin on 15/11/12.
//  Copyright © 2015年 汽车秘书. All rights reserved.
//

#import "LeftMenuVCViewController.h"
#import "Constants.h"
#import "UIViewController+MMDrawerController.h"


@interface LeftMenuVCViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *items;
}

@end

@implementation LeftMenuVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    items = @[@"新增车辆", @"查询短信", @"退出"];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.textLabel setText:[items objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self)weakself = self;
    switch (indexPath.row) {
        case 0:
        {
            [self.mm_drawerController
             setMaximumLeftDrawerWidth:[[UIScreen mainScreen] bounds].size.width - 50
             animated:YES
             completion:^(BOOL finished) {
                 UIViewController *discoveryView = [weakself.storyboard instantiateViewControllerWithIdentifier:@"centerVC"];
                 [weakself.mm_drawerController setCenterViewController:discoveryView];
                 [weakself.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                     
                 }];
             }];
        }
            break;
            
        case 1:
        {
            [self.mm_drawerController
             setMaximumLeftDrawerWidth:[[UIScreen mainScreen] bounds].size.width - 50
             animated:YES
             completion:^(BOOL finished) {
                 UIViewController *discoveryView = [weakself.storyboard instantiateViewControllerWithIdentifier:@"SmsQueryVC"];
                 [weakself.mm_drawerController setCenterViewController:discoveryView];
                 [weakself.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                     
                 }];
             }];
        }
            break;
            
        case 2:
        {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userInfo"];
            UIViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
            [self presentViewController:loginVC animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

@end