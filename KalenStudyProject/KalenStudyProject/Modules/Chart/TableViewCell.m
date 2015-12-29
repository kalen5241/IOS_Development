//
//  TableViewCell.m
//  UUChartView
//
//  Created by shake on 15/1/4.
//  Copyright (c) 2015年 uyiuyao. All rights reserved.
//

#import "TableViewCell.h"
#import "UUChart.h"

@interface TableViewCell ()<UUChartDataSource>
{
    NSIndexPath *path;
    UUChart *chartView;
}
@property (nonatomic,strong) NSArray *data;
@end

@implementation TableViewCell


-(NSArray *)data {
    if (!_data) {
        _data = @[@"42",@"42",@"25",@"15",@"30",@"42",@"32",@"40",@"42",@"25",@"33",@"23",@"42",@"25",@"15",@"30",@"42",@"32",@"40",@"42",@"25",@"33",@"23",@"42",@"25",@"15",@"30",@"42",@"32",@"40"];
    }
    return @[_data];
}

- (void)configUI:(NSIndexPath *)indexPath
{
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    
    path = indexPath;
    
    chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-20, 180)
                                              withSource:self
                                               withStyle:UUChartStyleBar];
    //chartView.backgroundColor = [UIColor redColor];
    [chartView showInView:self.contentView];
}

- (NSArray *)getXTitles:(int)num
{
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=0; i<num; i++) {
            NSString * str = [NSString stringWithFormat:@"%d",i+1];
            [xTitles addObject:str];
    }
    return xTitles;
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)chartConfigAxisXLabel:(UUChart *)chart
{
    NSArray *array = self.data[0];
    return [self getXTitles:(int)array.count];
}
//数值多重数组
- (NSArray *)chartConfigAxisYValue:(UUChart *)chart
{

   return self.data;
}

#pragma mark - @optional
//颜色数组
- (NSArray *)chartConfigColors:(UUChart *)chart
{
    return @[[UUColor green],[UUColor red],[UUColor brown]];
}
//显示数值范围
- (CGRange)chartRange:(UUChart *)chart
{
    NSInteger max = 0;
    for (NSArray * ary in self.data) {
        for (NSString *valueString in ary) {
            NSInteger value = [valueString integerValue];
            if (value > max) {
                max = value;
            }
        }
    }
    return CGRangeMake(50 , 0);
}

@end
