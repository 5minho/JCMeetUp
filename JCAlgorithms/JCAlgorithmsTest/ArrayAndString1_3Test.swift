//
//  ArrayAndString1_3Test.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 28..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class ArrayAndString1_3Test: XCTestCase {
    
    func whiteSpace2Percent20(string : inout String) {
        string = string.replacingOccurrences(of: " ", with: "%20")
    }

    func testWhite2Percent20UsingSwiftAPI() {
        var string = "a b c d"
        whiteSpace2Percent20(string: &string)
        XCTAssertEqual(string, "a%20b%20c%20d")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
