//
//  SumOfMatrix.swift
//  JCAlgorithms
//
//  Created by 오민호 on 2018. 3. 17..
//  Copyright © 2018년 오민호. All rights reserved.
//

import Foundation

func sumMatric(_ A : [[Int]], _ B : [[Int]]) -> [[Int]] {
    var answer = [[Int]](repeating: [Int](repeating : 0, count : A[0].count),
                         count : A.count)
    A.enumerated().forEach { (i, rows) in
        rows.enumerated().forEach({ (j, col) in
            answer[i][j] = col + B[i][j]
        })
    }
    return answer
}
