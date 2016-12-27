//
//  LayoutAnimationVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/12/27.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "LayoutAnimationVC.h"

@interface LayoutAnimationVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpace;
@property (weak, nonatomic) IBOutlet UIView *animationView;

@end

@implementation LayoutAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    


}
- (IBAction)start:(UIButton *)sender {
    //修改约束
    //约束的7个参数中，前6个是只读的
    //只能修改第7个contant参数
    //且不能在动画内修改，需要在动画外修改
    self.bottomSpace.constant = 100;
    [UIView animateWithDuration:2 animations:^{
        //在动画内，只需要刷新布局即可
        //因为 边距  约束是 父视图的约束
        //所以刷新self.view
        [self.view layoutIfNeeded];
        //因为 高度 约束 是子视图自身的约束
        //所以刷新子视图自己的约束
        [self.animationView layoutIfNeeded];
        
    }];
    
}

@end
