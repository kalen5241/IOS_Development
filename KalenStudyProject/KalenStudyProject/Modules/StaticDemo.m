//
//  StaticDemo.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/24.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "StaticDemo.h"
#import "KalenTableViewCellCode.h"
#import "FD_Masonry_CellXib.h"
#import "KalenDataModel.h"

@interface StaticDemo () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *heights;
@end

@implementation StaticDemo

- (void)viewDidLoad {
    
    self.freshFlag = NO;
    self.delegate = self;
    self.isStatic = YES;
    [super viewDidLoad];
}

-(NSArray *)heights {
    
    if (!_heights) {
        _heights = @[@40.0,@80.5];
    }
    return _heights;
}


#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        KalenTableViewCellCode *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL0"];
        if (!cell) {
            cell = [[KalenTableViewCellCode alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CELL2"];
        }
       cell.dataModel = [KalenDataModel initDataModelWithTitle:@"kalen" andContent:@"FIRST" andImageView:@"taocan"];
        return cell;
    }
    
    if (indexPath.row == 1) {
        
        FD_Masonry_CellXib *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL1"];
        if (!cell) {
            NSArray *nibs= [[NSBundle mainBundle] loadNibNamed:@"FD_Masonry_CellXib" owner:self options:nil];
            cell = (FD_Masonry_CellXib *)[nibs objectAtIndex:0];
        }
        cell.dataModel = [KalenDataModel initDataModelWithTitle:@"kalen" andContent:@"FIRST" andImageView:@"taocan"];
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
       cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CELL"];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.heights[indexPath.row] floatValue];
}

@end
