//
//  ArrayAndString1_2.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 28..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

extension String {
    
    func isPermuRelationBySort (with otherStr : String) -> Bool {
        guard self.count == otherStr.count else {return false}
        return otherStr.sorted() == self.sorted()
    }
    
}

class ArrayAndString1_2Test: XCTestCase {

    func testPermutaionRelationShip() {
        XCTAssertTrue("dog".isPermuRelationBySort(with: "god"))
        XCTAssertTrue("acea".isPermuRelationBySort(with: "aace"))
        XCTAssertTrue("grasdw".isPermuRelationBySort(with: "wsadrg"))
    }
    
    func testNotPermutaionRelationShip() {
        XCTAssertFalse("eqwe".isPermuRelationBySort(with: "12333"))
        XCTAssertFalse("efwef".isPermuRelationBySort(with: "asdf"))
        XCTAssertFalse("feefsd".isPermuRelationBySort(with: "hnthf"))
    }

}
