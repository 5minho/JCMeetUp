//
//  BinaryGap.swift
//  JCAlgorithms
//
//  Created by 오민호 on 2018. 3. 19..
//  Copyright © 2018년 오민호. All rights reserved.
//

import Foundation

extension Int {
    // 가장 왼쪽에 있는 비트
    var lsb : Int {
        return (self & 1)
    }
}

public func solution(_ N : Int) -> Int {
    var num = N
    // num의 LSB(least significant bit)가 1이 될때 까지 비트를 오른쪽으로 밀어준다.
    while num.lsb != 1 { num >>= 1 }
    
    var count = 0
    var answer = 0
    
    while num != 0 {
        num >>= 1
        // LSB가 0 이면 count를 증가시킨다
        if num.lsb == 0 {
            count += 1
            continue
        }
        // LSB가 1이면 이전에 저장해둔 count와 비교해서 제일 큰 BinaryGap 을 구한다.
        answer = max(answer, count)
        count = 0
    }
    
    return answer
}


