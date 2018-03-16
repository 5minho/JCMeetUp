//
//  JCAlgorithmsTest.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 13..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class JCAlgorithmsTest: XCTestCase {
    
    private var array = [Int](1...1000000)
    
    override func setUp() {
        super.setUp()
        self.shuffle(array: &array)
    }
    
    func testGCDLCM() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual( [6, 9].gcdlcm, [3, 18])
        XCTAssertEqual( [23, 11].gcdlcm, [1, 23 * 11])
        XCTAssertEqual( [24, 28].gcdlcm, [4, 168])
    }
    
    func testSumOfDivisiors() {
        XCTAssertEqual(12.sumOfDivisiors, 28)
        XCTAssertEqual(26.sumOfDivisiors, 42)
        XCTAssertEqual(55.sumOfDivisiors, 72)
    }
    
    func testSumMatric() {
        var A = [[1,2,5],[2,6,5],[6,2,8]]
        var B = [[3,8,2],[4,2,7],[8,9,0]]
        var expectaion = [[4,10,7],[6,8,12],[14,11,8]]
        assertEqual2DMatrix(A: A, B: B, expectaion: expectaion, rows: 3, cols: 3)
        
        A = [[1,2],[2,6],[6,2],[2,7]]
        B = [[3,8],[4,2],[8,9],[1,4]]
        expectaion = [[4,10],[6,8],[14,11],[3,11]]
        assertEqual2DMatrix(A: A, B: B, expectaion: expectaion, rows: 4, cols: 2)
        
        A = [[1,2,5],[2,6,5]]
        B = [[3,8,2],[4,2,7]]
        expectaion = [[4,10,7],[6,8,12]]
        assertEqual2DMatrix(A: A, B: B, expectaion: expectaion, rows: 2, cols: 3)
    }
    
    private func assertEqual2DMatrix(A : [[Int]], B : [[Int]], expectaion : [[Int]], rows : Int, cols : Int) {
        for row in 0..<rows {
            for col in 0..<cols {
                XCTAssertEqual(A[row][col] + B[row][col], expectaion[row][col])
            }
        }
    }

    
    func testPerformanceGCDLCM() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
        }
    }
    
    func testPerformanceSumOfDivisios() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPerformanceSumMatric() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
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
