//
//  Kalen_AutomationTests.m
//  Kalen_AutomationTests
//
//  Created by kalen on 15/6/4.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Animal.h"
@interface Kalen_AutomationTests : XCTestCase
@property (nonatomic) NSInteger one;
@property (nonatomic) NSInteger two;
@property (nonatomic,strong) Animal *animal;

@end

@implementation Kalen_AutomationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    Animal *A1 = [[Animal alloc]init];
    self.animal = A1;
    
    self.one =1;
    self.two =2;
    
     printf("....................................................................\n");
}

- (void)tearDown {
    [super tearDown];
     printf("....................................................................\n");
}
- (void)testKalen {
    
    self.animal.sex =@"Male";
    XCTAssertTrue(1 ==[self.animal isMale]);
}
- (void)testExample {
    // This is an example of a functional test case.
    XCTAssertTrue(self.one + self.two == 3,@"kalen");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for (int i=0; i<100; i++) {
            NSLog(@"Hello Kalen");
        }
    }];
}
@end
