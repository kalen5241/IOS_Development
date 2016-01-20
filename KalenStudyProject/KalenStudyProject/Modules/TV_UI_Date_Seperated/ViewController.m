//
//  ViewController.m
//  KalenStudyProject
//
//  Created by kalen on 16/1/16.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "ViewController.h"
#import "LayoutClass.h"
#import "CellItems.h"
#import "CustomCell.h"
#import <Masonry.h>
#import <UITableView+FDTemplateLayoutCell.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) CellItems *items;
@end

@implementation ViewController

#pragma mark --LazyLoad

-(CellItems *)items {
    if (!_items) {
        _items = [[CellItems alloc]init];
    }
    return _items;
}

-(UITableView *)tv {
    if (!_tv) {
        _tv = [[UITableView alloc]init];
        _tv.dataSource = self;
        _tv.delegate = self;
        _tv.backgroundColor = [UIColor redColor];
        _tv.tag = 1;
    }
    return _tv;
}

#pragma mark --ViewLifeCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *smsDetailCellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tv registerNib:smsDetailCellNib forCellReuseIdentifier:@"cell"];
    self.tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    self.view.tag = 0;
//    [LayoutClass view:self.view andView:self.tv];
    
}


#pragma mark --UITableViewCell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
   // return self.items.secitons;
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   // return self.items.rows;
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
//    if (!cell) {
//        cell = (CustomCell *)[[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil]lastObject];
//    }
//    
//    self.items.indexPath = indexPath;
//    
//    self.items.tv = tableView;
//    
//    self.items.cell = cell;
    
    cell.textLabel.text = @"sdfsdfsdfsdfsdfsdf";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:@"cell"  cacheByIndexPath:indexPath configuration:^(id cell) {
        
      __weak  CustomCell *myCell = (CustomCell *)cell;
//        
//        self.items.indexPath = indexPath;
//        
//        self.items.tv = tableView;
//        
//        self.items.cell = myCell;
        
            myCell.textLabel.text = @"sdfsdfsdfsdfsdfsdf";
//        
    }];
}

@end
