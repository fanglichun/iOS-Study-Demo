//
//  FrogTests.swift
//  SwiftUnitTest
//
//  Created by mfang032 on 14/02/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import XCTest
@testable import SwiftUnitTest

class FrogTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFrogTransformation() {
        let frog = Frog()
        frog.transform()
        XCTAssert(frog.name == "Frog", "Pass")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            var sum = 0.0
            for i in 0...1000 {
                sum += Double(i)
            }
            // Put the code you want to measure the time of here.
        }
    }
    
}
