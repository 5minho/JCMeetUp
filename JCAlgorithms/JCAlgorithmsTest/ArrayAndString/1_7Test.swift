//
//  1_7Test.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 4. 6..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

extension Array where Element == Int32 {
    static func squareInt32Matrix(dimension : Int) -> [[Element]] {
        return [[Element]](repeating: [Element](repeating: 0, count: dimension),
                                   count: dimension)
    }
}

extension Array where Element == [Int32] {
    var isSquare : Bool {
        //components가 없으면 true 리턴 (0 by 0)
        guard self.count != 0 else {
            return true
        }
        return self.count == self[0].count
    }
    
    //추가 행렬 사용
    var rotate90Degree : [[Int32]]? {
        guard self.isSquare else {return nil}
        var temp = Array<Int32>.squareInt32Matrix(dimension: self.count)
        let dimension = self.count
        for row in 0 ..< dimension {
            for col in 0 ..< dimension {
                temp[col][dimension - row - 1] = self[row][col]
            }
        }
        return temp
    }
}

class ArrayAndString1_7Test: XCTestCase {
    
    func test_정방행렬이_90도_회전을_잘하는가() {
        let matrix2Dimension : [[Int32]] = [[1,2],
                                            [2,3]]
        let expected : [[Int32]] = [[2,1],
                                    [3,2]]
        let result = matrix2Dimension.rotate90Degree
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, expected)
    }
    
}










