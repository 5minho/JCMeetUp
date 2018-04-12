//
//  HarshardNumber.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 4. 12..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

extension UInt {
    
    var isHarshardNumber : Bool {
        return (self % self.components.reduce(0, +)) == 0
    }

    var components : [UInt] {
        var quotient = self
        var components = [UInt]()
        while quotient != 0 {
            components.append(quotient % 10)
            quotient /= 10
        }
        return components
    }
    
}

class HarshardNumber: XCTestCase {

    func test_정수가_각_자리수의_숫자들로_잘나누어_지는지_확인() {
        let number1 : UInt = 12345
        let expected1 : [UInt] = [5,4,3,2,1]
        XCTAssertEqual(number1.components, expected1)
        
        let number2 : UInt = 2
        let expected2 : [UInt] = [2]
        XCTAssertEqual(number2.components, expected2)
        
        let number4 : UInt = 123124123
        let expected4 : [UInt] = [3,2,1,4,2,1,3,2,1]
        XCTAssertEqual(number4.components, expected4)
    }
    
    func test_하샤드_수가_맞는지_확인() {
        let number1 : UInt = 18
        XCTAssertTrue(number1.isHarshardNumber)
        
        let number2 : UInt = 189
        XCTAssertFalse(number2.isHarshardNumber)
        
        let number3 : UInt = 24
        XCTAssertTrue(number3.isHarshardNumber)
    }

}
