//
//  GCDLCM.swift
//  JCAlgorithms
//
//  Created by 오민호 on 2018. 3. 17..
//  Copyright © 2018년 오민호. All rights reserved.
//

import Foundation

extension Array {
    
    var gcdlcmFast : Array<Int> {
        let a : Int = self[0] as! Int
        let b : Int = self[1] as! Int
        let gcd = self.gcdByEuclidean(a, b)
        let lcm = a * b / gcd
        return [gcd, lcm]
    }
    
    var gcdlcmSlow : Array<Int> {
        let a : Int = self[0] as! Int
        let b : Int = self[1] as! Int
        let gcd = self.gcdByMinho(a, b)
        let lcm = a * b / gcd
        return [gcd, lcm]
    }
    
    //유클리드 호제법
    func gcdByEuclidean(_ a : Int ,_ b : Int) -> Int {
        var u = a
        var v = b
        while v != 0 {
            u %= v
            swap(&u, &v)
        }
        return u
    }
    
    //두 숫자들의 약수들을 구해서 하나하나 비교
    func gcdByMinho(_ a : Int ,_ b : Int) -> Int {
        var divisiorsA = a.divisiors
        var divisiorsB = b.divisiors
        
        var idxA = divisiorsA.count - 1
        var idxB = divisiorsB.count - 1
        
        while idxA > 0 && idxB > 0 {
            if divisiorsA[idxA] == divisiorsB[idxB] {
                return divisiorsA[idxA]
            }
            
            if divisiorsA[idxA] > divisiorsB[idxB] {
                idxA -= 1
                continue
            }
            
            if divisiorsA[idxA] < divisiorsB[idxB] {
                idxB -= 1
            }
        }
        
        return 1
    }
    
}
