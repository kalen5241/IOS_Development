//
//  DelePassValueOtherVC.h
//  KalenStudyProject
//
//  Created by kalen on 16/5/8.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ViewController.h"
#import "DelePassValueVC.h"

@class DelePassValueOtherVC;

@protocol PassStringDelegate <NSObject>

-(void)pass:(NSString *)str;

@end

@interface DelePassValueOtherVC : ViewController

@property (weak, nonatomic) DelePassValueVC  *before;
@property (nonatomic,strong) NSString *positiveString;
@property (nonatomic, weak) id <PassStringDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *inputBox;

- (IBAction)back:(UIButton *)sender;
- (IBAction)clickDelegate:(UIButton *)sender;

@end
