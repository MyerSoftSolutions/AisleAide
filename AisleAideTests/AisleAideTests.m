//
//  AisleAideTests.m
//  AisleAideTests
//
//  Created by Joel Myers on 3/4/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AisleList.h"

@interface AisleAideTests : XCTestCase
@property (nonatomic, strong) AisleList *aisleList;


@end

@implementation AisleAideTests

UIButton *Button;
- (void)setUp {
    [super setUp];
    self.aisleList = [[AisleList alloc] init];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
