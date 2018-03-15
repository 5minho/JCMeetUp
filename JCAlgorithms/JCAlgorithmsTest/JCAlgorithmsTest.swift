//
//  JCAlgorithmsTest.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 13..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class JCAlgorithmsTest: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual( [6,9].gcdlcm, [3,18])
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            for _ in 0..<1000 {
                _ = [6,9].gcdlcm
            }
        }
    }
    
}
