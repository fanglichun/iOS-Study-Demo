//
//  OCUnitTestTests.m
//  OCUnitTestTests
//
//  Created by mfang032 on 15/02/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemReturn.h"

@interface OCUnitTestTests : XCTestCase

@property (strong, nonatomic) ItemReturn *myItemReturn;

@end

@implementation OCUnitTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.myItemReturn = [[ItemReturn alloc]init];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.myItemReturn = nil;
    
    [super tearDown];
}

- (void)testPassingTest {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertNil(Nil, "pass");
    
}

- (void)testFailingTest {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertNil([_myItemReturn returnMyItem], "Failure");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
