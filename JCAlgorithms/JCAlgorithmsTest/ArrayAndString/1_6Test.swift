//
//  ArrayAndString1_6Test.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 3. 30..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

//func compressed(string : inout String) {
//    var temp = string.substring(with: string.startIndex ..< string.endIndex)
//}

extension String {
    var compressed : String {
        var temp = self[startIndex..<endIndex]
        var compressed = ""

        while temp.isEmpty == false {
            let prevIndex = temp.startIndex
            if let nextIndex = temp.index(where: { $0 != temp.first ?? $0 }) {
                compressed.append("\(temp[prevIndex])\(distance(from: prevIndex, to: nextIndex))")
                temp = temp[nextIndex..<endIndex]
                continue
            }
            compressed.append("\(temp[prevIndex])\(distance(from: prevIndex, to: endIndex))")
            break
        }
        
        if compressed.count > self.count {
            return self
        }
        
        return compressed
    }
}


class ArrayAndString1_6Test: XCTestCase {
    func test_압축이_제대로_됐는지_확인() {
        XCTAssertEqual("aabcccccaaa".compressed, "a2b1c5a3")
        XCTAssertEqual("".compressed, "")
        XCTAssertEqual("aaaaaaaaaaaa".compressed, "a12")
        XCTAssertEqual("ab".compressed, "ab")
    }
}
