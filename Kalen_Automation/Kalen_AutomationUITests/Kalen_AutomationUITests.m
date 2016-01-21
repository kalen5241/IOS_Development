//
//  Kalen_AutomationUITests.m
//  Kalen_AutomationUITests
//
//  Created by kalen on 16/1/21.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Kalen_AutomationUITests : XCTestCase

@end

@implementation Kalen_AutomationUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    /*第一代代码  没有用identifier 通过遍历空白处的子控件来查找元素
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *textField = [[app.otherElements
                               containingType:XCUIElementTypeStaticText identifier:@"Label"]
                              childrenMatchingType:XCUIElementTypeTextField].element;
    
    [textField tap];
    [textField typeText:@"ll"];
    [textField typeText:@"aa"];
    [app.buttons[@"Button"] tap];
    */
    
    /*第二代代码   通过给textfield 设置 identifier = @“kalen” 来查找元素 */
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *kalenTextField = app.textFields[@"kalen"];
    [kalenTextField tap];
    [kalenTextField typeText:@"ww"];
    [app.buttons[@"Button"] tap];
     
    
    /*给UI元素设置 identifier  便于找查元素
    UIButton *btt = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btt setAccessibilityIdentifier:@"kalen"];
    */
    
    
    /*点击空白处代码
    XCUIElement *labelElement = [app.otherElements containingType:XCUIElementTypeStaticText identifier:@"Label"].element;
    [labelElement tap];
     */
    
}

@end
