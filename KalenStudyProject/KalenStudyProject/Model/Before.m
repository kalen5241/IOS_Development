//
//  Before.m
//  KalenStudyProject
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "Before.h"
#import "CustomCellOne.h"
@implementation Before

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CustomCellOne *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = (CustomCellOne *)[[[NSBundle mainBundle] loadNibNamed:@"CustomCellOne" owner:nil options:nil]lastObject];
    }
    
    //cell.textLabel.text = @"条目1";
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        tableView.dataSource = self.destData;
        tableView.delegate = self.destData;
        [tableView reloadData];
}

@end
