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

extension Character {
    var asciiValue: Int {
        let s = self.unicodeScalars
        return Int(s[s.startIndex].value)
    }
}

extension Int {
    var isOdd : Bool {
        return (self & 1) == 1
    }
}

extension String {
    var isPermutationOfPalindrome : Bool {
        var alphaCountList = [Int](repeating: 0, count: 26)
        let lowercaseStr = self.lowercased()
        var oddCount = 0
        lowercaseStr.forEach {
            let asciiValue = $0.asciiValue
            if (97..<123).contains(asciiValue) {
                alphaCountList[$0.asciiValue - 97] += 1
            }
        }
        alphaCountList.forEach {
            if $0.isOdd {
                oddCount += 1
            }
        }
        return oddCount.isOdd
    }
}

class ArrayAndString1_4Test: XCTestCase {
    
    func test_Swift_Character의_아스키코드를_잘_가져오는지_확인() {
        let char = Character("a")
        let expected = 97
        XCTAssertEqual(expected, char.asciiValue)
    }
    
    func test_주어진_문자열이_회문의_순열인지_확인() {
        let string = "Tact Coa"
        XCTAssertTrue(string.isPermutationOfPalindrome)
    }
    
}
