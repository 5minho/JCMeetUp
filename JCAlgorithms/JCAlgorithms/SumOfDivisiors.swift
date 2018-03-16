//
//  SumOfDivisiors.swift
//  JCAlgorithms
//
//  Created by 오민호 on 2018. 3. 17..
//  Copyright © 2018년 오민호. All rights reserved.
//

import Foundation

extension Int {
    
    var divisiors : [Int] {
        return (1...self).filter {self % $0 == 0}
    }
    
    var sumOfDivisiorsFast : Int {
        return (1...Int(self / 2)).filter {self % $0 == 0}.reduce(0, +) + self
    }
    
    var sumOfDivisiorsSlow : Int {
        return (1...self).filter {self % $0 == 0}.reduce(0, +)
    }
    
}
