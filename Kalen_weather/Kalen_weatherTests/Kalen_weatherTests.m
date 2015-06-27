//
//  Kalen_weatherTests.m
//  Kalen_weatherTests
//
//  Created by tarena on 15/6/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//
#import "TRWeatherViewController.h"
#import "Layout.h"
#import "TRHeaderView.h"
#import "HTTPTool.h"
#import "JsonTools.h"
#import "TRWeather.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Kalen_weatherTests : XCTestCase

@end

@implementation Kalen_weatherTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSURL *url = [NSURL URLWithString:@"http://api.worldweatheronline.com/free/v2/weather.ashx?q=beijing&num_of_days=2&format=json&tp=6&key=47722af12eecece70a05f6764b346"];
    
   // [JsonTools Json:[HTTPTool sendRequest:url]];
    
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
