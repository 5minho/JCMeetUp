//
//  main.swift
//  JCAlgorithms
//
//  Created by 오민호 on 2018. 3. 13..
//  Copyright © 2018년 오민호. All rights reserved.
//

import Foundation

extension Array {
    var gcdlcm : Array<Int> {
        let a : Int = self[0] as! Int
        let b : Int = self[1] as! Int
        let gcd = self.gcd(a, b)
        let lcm = a * b / gcd
        return [gcd, lcm]
    }
    
    func gcd(_ a : Int ,_ b : Int) -> Int {
        var u = a
        var v = b
        while v != 0 {
            u %= v
            swap(&u, &v)
        }
        
        return u
    }
}

extension Int {
    var sumOfDivisiors : Int {
        return (1...Int(self / 2)).filter {self % $0 == 0}.reduce(0, +) + self
    }
}

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
