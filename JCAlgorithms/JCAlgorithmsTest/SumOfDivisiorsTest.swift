//
//  SumOfDivisiorsTest.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 17..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class SumOfDivisiorsTest: XCTestCase {
    
    private var rand : Int {
        return Int(arc4random_uniform(UInt32(50000))) + 1
    }

    func testFastSumOfDivisiors() {
        XCTAssertEqual(12.sumOfDivisiorsFast, 28)
        XCTAssertEqual(26.sumOfDivisiorsFast, 42)
        XCTAssertEqual(55.sumOfDivisiorsFast, 72)
    }
    
    func testSlowSumOfDivisiors() {
        XCTAssertEqual(12.sumOfDivisiorsSlow, 28)
        XCTAssertEqual(26.sumOfDivisiorsSlow, 42)
        XCTAssertEqual(55.sumOfDivisiorsSlow, 72)
    }

    func testPerformanceFastSumOfDivisios() {
        // This is an example of a performance test case.
        self.measure {
            for _ in 0 ..< 1000 {
                _ = self.rand.sumOfDivisiorsFast
            }
        }
    }
    
    func testPerformanceSlowSumOfDivisios() {
        // This is an example of a performance test case.
        self.measure {
            for _ in 0 ..< 1000 {
                _ = self.rand.sumOfDivisiorsSlow
            }
        }
    }

}
