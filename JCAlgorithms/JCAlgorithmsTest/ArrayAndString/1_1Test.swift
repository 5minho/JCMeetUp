
//
//  1_1.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 31..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

extension String {
    var hasDuplicationCharacter : Bool {
        for c in self {
            guard let _ = self.first(where: { $0 == c }) else {
                return false
            }
        }
        return true
    }
}

class ArrayAndString1_1Test : XCTest {
    
    func test_문자열에_같은_문자가_중복등장_하는지_확인() {
        XCTAssertFalse("abc".hasDuplicationCharacter)
        XCTAssertFalse("".hasDuplicationCharacter)
        XCTAssertTrue("aaaaaaa".hasDuplicationCharacter)
        XCTAssertTrue("wkqnskd".hasDuplicationCharacter)
    }
    
}
