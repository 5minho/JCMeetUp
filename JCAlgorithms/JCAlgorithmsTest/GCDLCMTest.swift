//
//  GCDLCMTest.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 17..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class GCDLCMTest: XCTestCase {
    
    private var twoNumbers : [Int] {
        var twoNumbers = [Int]()
        twoNumbers.append(Int(arc4random_uniform(UInt32(10000))) + 1)
        twoNumbers.append(Int(arc4random_uniform(UInt32(10000))) + 1)
        return twoNumbers
    }

    func testFastGCDLCM() {
        XCTAssertEqual( [6, 9].gcdlcmFast, [3, 18])
        XCTAssertEqual( [23, 11].gcdlcmFast, [1, 23 * 11])
        XCTAssertEqual( [24, 28].gcdlcmFast, [4, 168])
    }
    
    func testSlowGCDLCM() {
        XCTAssertEqual( [6, 9].gcdlcmSlow, [3, 18])
        XCTAssertEqual( [23, 11].gcdlcmSlow, [1, 23 * 11])
        XCTAssertEqual( [24, 28].gcdlcmSlow, [4, 168])
    }

    func testPerformanceFastGCDLCM() {
        // This is an example of a performance test case.
        self.measure {
            for _ in 0..<1000 {
                _ = twoNumbers.gcdlcmFast
            }
        }
    }
    
    func testPerformanceSlowGCDLCM() {
        // This is an example of a performance test case.
        self.measure {
            for _ in 0..<1000 {
                _ = twoNumbers.gcdlcmSlow
            }
        }
    }

}
