//
//  Collatz.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 4. 12..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

extension Int {
    // limit 번 만에 1이 될까?
    func guessCollatz(limit : Int) -> Int {
        var current = self
        for count in 0..<limit {
            if current == 1 {
                return count
            }
            current = current.nextCollatzStep
        }
        return -1
    }
    
    var nextCollatzStep : Int {
        return self.isOdd ? self * 3 + 1 : self / 2
    }

    var isPowerOfTwo : Bool {
        return (self > 0 && (self & (self - 1)) == 0)
    }
    
}

class Collatz: XCTestCase {

    func test_2의_거듭제곱_인지_확인() {
        let number1 = 2
        XCTAssertTrue(number1.isPowerOfTwo)
        
        let number2 = 3
        XCTAssertFalse(number2.isPowerOfTwo)
        
        let number3 = 18
        XCTAssertFalse(number3.isPowerOfTwo)
        
        let number4 = 0
        XCTAssertFalse(number4.isPowerOfTwo)
        
        let number5 = 512
        XCTAssertTrue(number5.isPowerOfTwo)
    }
    
    func test_콜라츠_추측_확인() {
        let number1 = 626331
        let expected = -1
        XCTAssertEqual(number1.guessCollatz(limit: 500), expected)
        
    }
    
}
