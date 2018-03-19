//
//  BinaryGap.swift
//  JCAlgorithms
//
//  Created by 오민호 on 2018. 3. 19..
//  Copyright © 2018년 오민호. All rights reserved.
//

import Foundation

extension Int {
    var isOdd : Bool {
        return (self & 1) == 0
    }
}

public func solution(_ N : Int) -> Int {
    var num = N
    
    while num.isOdd {
        num >>= 1
    }
    
    var count = 0
    var answer = 0
    
    while num != 0 {
        num >>= 1
        if num.isOdd {
            count += 1
            continue
        }
        answer = max(answer, count)
        count = 0
    }
    
    return answer
}


