//
//  1_4Test.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 4. 3..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

/*
 TDD 단계
 red : 실패 테스트 작성
 green : 실패 테스트 통과하는 간단한 코드 (또 다른 실패테스트가 생길 수 있음)
 refactor : 리팩토링 (필요하다면 다시 red)
*/

extension String {
    var isPermutationOfPalindrome : Bool {
        return false
    }
}

class ArrayAndString1_4Test: XCTestCase {
    
    func test_주어진_문자열이_회문의_순열인지_확인() {
        let string = "Tact Coa"
        XCTAssertTrue(string.isPermutationOfPalindrome)
    }
    
}
