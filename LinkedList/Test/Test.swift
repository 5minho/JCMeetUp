//
//  Test.swift
//  Test
//
//  Created by 오민호 on 2018. 4. 14..
//  Copyright © 2018년 오민호. All rights reserved.
//

import XCTest

class Test: XCTestCase {
    
    var emptylist : LinkedList<Int>!
    var oneNodeList : LinkedList<Int>!
    var twoNodeList : LinkedList<Int>!
    var threeNodeList : LinkedList<Int>!
    var manyNodeList : LinkedList<Int>!
    
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 1, 5, 2, 3] // 15개
    
    override func setUp() {
        super.setUp()
        initLists()
    }
    
    func initLists() {
        emptylist = LinkedList<Int>()
        
        oneNodeList = LinkedList<Int>()
        oneNodeList.append(1)
        
        twoNodeList = LinkedList<Int>()
        twoNodeList.append(1)
        twoNodeList.append(2)
        
        threeNodeList = LinkedList<Int>()
        threeNodeList.append(1)
        threeNodeList.append(2)
        threeNodeList.append(3)
        
        manyNodeList = LinkedList<Int>()
        numbers.forEach {
            manyNodeList.append(LinkedList.Node(item: $0))
        }
    }
    
    func test_첫번째_노드_가져오기() {
        
    }
    
    func test_마지막_노드_가져오기() {
        
    }
    
    func test_이전_노드_가져오기() {
        
    }
    
    func test_다음_노드_가져오기() {
        
    }
    
    func test_특정_인덱스_노드_가져오기() {
        
    }
    
    func test_이전_노드_삭제() {
        
    }
    
    func test_다음_노드_삭제() {
        
    }
    
    func test_특정_인덱스_노드_삭제() {
        
    }
    
    func test_특정_값_노드_삭제() {
        
    }
    
    func test_첫번째에_노드_삽입() {
        
    }
    
    func test_마지막에_노드_삽입() {
        
    }
    
    func test_특정_인덱스에_노드_삽입() {
        
    }
    
}
