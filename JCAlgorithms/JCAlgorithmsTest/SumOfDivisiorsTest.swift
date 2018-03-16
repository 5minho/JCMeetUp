//
//  SumOfDivisiorsTest.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 17..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class SumOfDivisiorsTest: XCTestCase {

    func testSumOfDivisiors() {
        XCTAssertEqual(12.sumOfDivisiors, 28)
        XCTAssertEqual(26.sumOfDivisiors, 42)
        XCTAssertEqual(55.sumOfDivisiors, 72)
    }

    func testPerformanceSumOfDivisios() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
