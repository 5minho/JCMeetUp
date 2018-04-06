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
    
    //책 알고리즘
    static func rotate90Degree(matrix : inout [[Int32]]) -> Bool{
        guard matrix.isSquare else {return false}
        let dimension = matrix.count
        for layer in 0 ..< matrix.count / 2 {
            let first = layer
            let last = dimension - 1 - layer
            for i in first ..< last {
                let offset = i - first
                let top = matrix[first][i]
                matrix[first][i] = matrix[last - offset][first]
                matrix[last - offset][first] = matrix[last][last - offset]
                matrix[last][last - offset] = matrix[i][last]
                matrix[i][last] = top
            }
        }
        return true
    }
    
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
    
    var matrix1 = Array.squareInt32Matrix(dimension: 2000)
    let matrix2 = Array.squareInt32Matrix(dimension: 2000)
    
    func test_정방행렬이_90도_회전을_잘하는지_확인() {
        let matrix2Dimension : [[Int32]] = [[1,2],
                                            [2,3]]
        let expected : [[Int32]] = [[2,1],
                                    [3,2]]
        let result = matrix2Dimension.rotate90Degree
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, expected)
    }
    
    func test_정방행렬이_90도_회전_책_알고리즘_을_잘하는지_확인() {
        var matrix2Dimension : [[Int32]] = [[1,2],
                                            [2,3]]
        let expected : [[Int32]] = [[2,1],
                                    [3,2]]
        let result = Array.rotate90Degree(matrix: &matrix2Dimension)
        XCTAssertTrue(result)
        XCTAssertEqual(matrix2Dimension, expected)
    }
    
    func testBookAlgorithm() {
        self.measure {
            let _ = Array.rotate90Degree(matrix: &matrix1) //약 12초 초/중반
        }
    }
    
    func testMyAlgorithm() {
        self.measure {
            let _ = matrix2.rotate90Degree //약 13초 중/후반
        }
    }
    
}










