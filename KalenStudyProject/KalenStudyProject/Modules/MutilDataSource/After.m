//
//  After.m
//  KalenStudyProject
//
//  Created by kalen on 15/11/11.
//  Copyright © 2015年 kalen. All rights reserved.
//

#import "After.h"
#import "CustomCellTwo.h"

@implementation After


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCellTwo *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = (CustomCellTwo *)[[[NSBundle mainBundle] loadNibNamed:@"CustomCellTwo" owner:nil options:nil]lastObject];
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}



@end
