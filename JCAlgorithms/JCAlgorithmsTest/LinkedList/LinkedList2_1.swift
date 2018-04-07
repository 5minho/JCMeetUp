//
//  LinkedList2_1.swift
//  JCAlgorithmsTest
//
//  Created by 오민호 on 2018. 4. 6..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

extension LinkedList where T : Hashable {
    
    func deleteDuplicationWithSet() {
        var set = Set<T>()
        var current = self.first
        while current != nil {
            if set.contains(current!.value) {
                current = current?.next
                if let prev = current!.previous {
                    self.remove(node: prev)
                }
                continue
            }
            set.insert(current!.value)
            current = current?.next
        }
    }
    
    func 
    
}

class LinkedList2_1: XCTestCase {

    func test_임시버퍼를_사용하고_중복_체크하기() {
        // 0 -> 1 -> 2 -> 2 -> 5
        let list = LinkedList<Int>()
        list.append(0)
        list.append(1)
        list.append(2)
        list.append(2)
        list.append(5)
        
        list.deleteDuplicationWithSet()
        XCTAssertEqual(4, list.count)
        XCTAssertEqual(0, list[0])
        XCTAssertEqual(1, list[1])
        XCTAssertEqual(2, list[2])
        XCTAssertEqual(5, list[3])
    }

}
