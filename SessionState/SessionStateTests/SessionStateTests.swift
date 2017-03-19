//
//  SessionStateTests.swift
//  SessionStateTests
//
//  Created by mfang032 on 13/02/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import XCTest
@testable import SessionState

class SessionStateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func textConcurrent() {
        let asynQueue = DispatchQueue(label: "asynQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
        
        let expect = expectation(description: "Storing values in sessionState shall succeed")
        let maxIndex = 200
        for index in 0...maxIndex {
            asynQueue.async {
                print(index)
                //sessionState.shared.set(index, forKey: String(index))
            }
        }
//        while sessionState.shared.object(forKey: String(maxIndex)) as! Int != maxIndex {
//            
//        }
        expect.fulfill()
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Test expection failed")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
