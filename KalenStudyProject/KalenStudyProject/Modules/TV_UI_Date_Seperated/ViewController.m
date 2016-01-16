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

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) CellItems *items;
@end

@implementation ViewController


-(CellItems *)items {
    if (!_items) {
        _items = [[CustomCell alloc]init];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LayoutClass view:self.view andView:self.tv];
    
}

-(UITableView *)tv {
    
    
    if (!_tv) {
        _tv = [[UITableView alloc]init];
        _tv.dataSource = self;
        _tv.delegate = self;
        
    }
    
    return _tv;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell* cell = (CustomCell *)[[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil]lastObject];

    self.items.indexPath = indexPath;
    self.items.tv = tableView;
    self.items.cell = cell;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
