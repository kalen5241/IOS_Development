//
//  ThreedPassVC.h
//  KalenStudyProject
//
//  Created by kalen on 16/5/10.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ViewController.h"

@interface ThreedPassVC : ViewController
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
- (IBAction)downLoad:(UIButton *)sender;
- (IBAction)done:(UIButton *)sender;

@end
