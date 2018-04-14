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
    }
    
    func test_첫번째_노드_가져오기() {
        let firstOfEmptyList = emptylist.node(at: 0)
        XCTAssertNil(firstOfEmptyList)
        XCTAssertTrue(firstOfEmptyList === emptylist.first)
        
        let firstOfOneNodeList = oneNodeList.node(at: 0)
        XCTAssertEqual(firstOfOneNodeList?.item, 1)
        XCTAssertTrue(firstOfOneNodeList === oneNodeList.first)
        XCTAssertTrue(firstOfOneNodeList === oneNodeList.last)
        
        let firstOfTwoNodeList  = twoNodeList.node(at: 0)
        XCTAssertEqual(firstOfTwoNodeList?.item, 1)
        XCTAssertTrue(firstOfTwoNodeList === twoNodeList.node(at: 1)?.prev)
        XCTAssertTrue(firstOfTwoNodeList === twoNodeList.last?.prev)
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
