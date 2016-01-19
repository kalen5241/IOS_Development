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
    self.view.tag = 0;
    [LayoutClass view:self.view andView:self.tv];
    
}


#pragma mark --UITableViewCell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.items.secitons;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.items.rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = (CustomCell *)[[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil]lastObject];
    }
    
    self.items.indexPath = indexPath;
    
    self.items.tv = tableView;
    
    self.items.cell = cell;
    
    return cell;
}

@end
