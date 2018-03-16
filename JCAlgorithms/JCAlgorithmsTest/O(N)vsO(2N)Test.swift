//
//  O(N)vsO(2N)Test.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 17..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class O_N_vsO_2N_Test: XCTestCase {

    private var array = [Int](1...1000000)
    
    override func setUp() {
        super.setUp()
        self.shuffle(array: &array)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testNLoop() {
        self.measure {
            var min = Int.min
            var max = Int.max
            for x in array {
                if x < min { min = x }
                if x > max { max = x }
            }
        }
    }
    
    func test2NLoop() {
        self.measure {
            var min = Int.min
            var max = Int.max
            for x in array {
                if x < min { min = x }
            }
            for x in array {
                if x > max { max = x }
            }
        }
    }
    
    private func shuffle(array : inout [Int]) {
        var last = array.count - 1
        while last > 0 {
            let rand = Int(arc4random_uniform(UInt32(last)))
            array.swapAt(last, rand)
            last -= 1
        }
    }

}
