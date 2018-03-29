//
//  ArrayAndString1_5Test.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 29..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest


class ArrayAndString1_5Test: XCTestCase {
    
    // 처음에 문제를 읽고 두 문자열의 최장공통문자열이 두 문자열중 긴 문자열과 1 차이가 나면
    // 한번의 수정으로 다른 하나의 문자열을 만들 수 있다고 생각했음

    func lcsLength(str1 : inout String, str2 : inout String) -> Int {
        var table = [[Int]](repeating : [Int](repeating: 0, count : str2.count + 1),
                            count : str1.count + 1)
        for (i, c1) in str1.enumerated() {
            for (j, c2) in str2.enumerated() {
                if c1 == c2 {
                    table[i + 1][j + 1] = table[i][j] + 1
                    continue
                }
                table[i + 1][j + 1] = max(table[i + 1][j], table[i][j + 1])
            }
        }
        return table[str1.count][str2.count]
    }
    
    func isEqualOnlyOneEdit(str1 : inout String, str2 : inout String) -> Bool {
        return max(str1.count, str2.count) == self.lcsLength(str1: &str1, str2: &str2) + 1
    }

    func test_최장공통부분수열이_제대로_구해지는가_확인() {
        var stringTuple = ("pale", "ple")
        XCTAssertEqual(lcsLength(str1: &stringTuple.0, str2: &stringTuple.1), 3) // ple
        
        stringTuple = ("abcde", "ebcda")
        XCTAssertEqual(lcsLength(str1: &stringTuple.0, str2: &stringTuple.1), 3) // bcd
        
        stringTuple = ("abcdefg", "cdeabfg")
        XCTAssertEqual(lcsLength(str1: &stringTuple.0, str2: &stringTuple.1), 5) // cdefg
        
        stringTuple = ("cdabe", "cdegt")
        XCTAssertEqual(lcsLength(str1: &stringTuple.0, str2: &stringTuple.1), 3) // cde
    }
    
    func test_한번의_교체_삽입_삭제으로_다른하나의_문자열이_나오는가_확인() {
        var stringTuple = ("pale", "ple")
        XCTAssertTrue(isEqualOnlyOneEdit(str1: &stringTuple.0, str2: &stringTuple.1))
        
        stringTuple = ("pales", "pale")
        XCTAssertTrue(isEqualOnlyOneEdit(str1: &stringTuple.0, str2: &stringTuple.1))
        
        stringTuple = ("pale", "bale")
        XCTAssertTrue(isEqualOnlyOneEdit(str1: &stringTuple.0, str2: &stringTuple.1))
        
        stringTuple = ("pale", "bake")
        XCTAssertFalse(isEqualOnlyOneEdit(str1: &stringTuple.0, str2: &stringTuple.1))
    }
    
    
    
}
