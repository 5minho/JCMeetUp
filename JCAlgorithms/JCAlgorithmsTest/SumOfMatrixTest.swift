//
//  JCAlgorithmsTest.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 13..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class SumOfMatrixTest: XCTestCase {
    
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
    
    func testPerformanceSumMatric() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
