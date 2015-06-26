//
//  ViewController.m
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "DPAPI.h"
#import "TRDeal.h"
#import "TRMeataTool.h"
#import "TRCityGroup.h"
#import "TRSorts.h"
#import "TRCities.h"

@interface ViewController () <DPRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DPAPI *api = [[DPAPI alloc]init];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"city"] = @"北京";
    params[@"region"] = @"朝阳区";
    params[@"category"] = @"火锅";
    params[@"sort"] = @2;
    params[@"limit"] = @10;
    DPRequest *request =[api requestWithURL:@"v1/deal/find_deals" params:params delegate:self];
    
    NSArray *categoryArray = [TRMeataTool categories];
    NSLog(@"%@",categoryArray);
    NSArray *cityArray = [TRMeataTool cities];
    NSLog(@"%@",cityArray);
    NSArray *sortArray = [TRMeataTool sorts];
    NSLog(@"%@",sortArray);
    NSArray *cityGroupArray = [TRMeataTool cityGroup];
    NSLog(@"%@",cityGroupArray);
    
}
#pragma mark --DPRequestDelegate
- (void)request:(DPRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"发送失败");
}
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    NSLog(@"发送成功");
    NSArray *dealsArray = [self parseDealsWithArray:result];
    
    
}
-(NSArray *)parseDealsWithArray:(id)result{
    
    NSArray *dealsArray = result[@"deals"];
    
    //NSDictionary -->TRDeal
    NSMutableArray *deals = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in dealsArray) {
        TRDeal *deal = [TRDeal parseDealWithDictionary:dict];
        [deals addObject:deal];
    }
    NSLog(@"%@",deals);
    return [deals copy];
}

/*
 "deal_id": "2-9208554",
 "title": "老玉火锅",
 "description": "老玉火锅 仅售1元，价值48元秘制锅底，不限时段通用，免费wifi！新鲜的食材，味蕾的诱惑，私家秘制锅底，从未享受过如此美味！",
 "city": "北京",
 "list_price": 48,
 "current_price": 1,
 "regions": [],
 "categories": [],
 "purchase_count": 7,
 "purchase_deadline": "2015-11-16",
 "publish_date": "2015-01-07",
 "distance": -1,
 "image_url": "http://t3.dpfile.com/pc/mc/0c87e1e505e0c628f7684175dc6c6987(640x1024)/thumb.jpg",
 "s_image_url": "http://t1.dpfile.com/pc/mc/0c87e1e505e0c628f7684175dc6c6987(640x1024)/thumb_1.jpg",
 "deal_url": "http://dpurl.cn/p/4Q5Q0muOwH",
 "deal_h5_url": "http://lite.m.dianping.com/kFpGZBOIbW",
 "commission_ratio": 0,
 "businesses": []
 

 */

@end
