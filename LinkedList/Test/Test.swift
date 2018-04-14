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
        let lastOfEmptyList = emptylist.node(at: 0)
        XCTAssertNil(lastOfEmptyList)
        XCTAssertTrue(lastOfEmptyList === emptylist.last)
        
        let lastOfOneNodeList = oneNodeList.node(at : 0)
        XCTAssertEqual(lastOfOneNodeList?.item, 1)
        XCTAssertTrue(lastOfOneNodeList === oneNodeList.first)
        XCTAssertTrue(lastOfOneNodeList === oneNodeList.last)
        
        let lastOfTwoNodeList  = twoNodeList.node(at: 1)
        XCTAssertEqual(lastOfTwoNodeList?.item, 2)
        XCTAssertTrue(lastOfTwoNodeList === twoNodeList.node(at: 0)?.next)
        XCTAssertTrue(lastOfTwoNodeList === twoNodeList.first?.next)
    }
    
    func test_이전_노드_가져오기() {
        XCTAssertNil(oneNodeList.last?.prev)
        
        XCTAssertNil(twoNodeList.node(at: 0)?.prev)
        XCTAssertTrue(twoNodeList.node(at: 1)?.prev === twoNodeList.node(at: 0))
        
        XCTAssertTrue(threeNodeList.node(at: 1)?.prev === threeNodeList.node(at: 0))
        XCTAssertTrue(threeNodeList.node(at: 2)?.prev === threeNodeList.node(at: 1))
        XCTAssertTrue(threeNodeList.last?.prev?.prev === threeNodeList.node(at: 0))
    }
    
    func test_다음_노드_가져오기() {
        XCTAssertNil(oneNodeList.last?.next)
        
        XCTAssertTrue(twoNodeList.node(at: 0)?.next === twoNodeList.node(at: 1))
        XCTAssertNil(twoNodeList.node(at: 1)?.next)
        
        XCTAssertTrue(threeNodeList.node(at: 0)?.next === threeNodeList.node(at: 1))
        XCTAssertTrue(threeNodeList.node(at: 1)?.next === threeNodeList.node(at: 2))
        XCTAssertTrue(threeNodeList.first?.next?.next === threeNodeList.node(at: 2))
        XCTAssertNil(threeNodeList.last?.next)
    }
    
    func test_특정_인덱스_노드_가져오기() {
        XCTAssertEqual(oneNodeList.node(at: 0)?.item, 1)
        XCTAssertNil(oneNodeList.node(at: 1), "범위가 넘어가면 nil 이어야 한다")
        
        XCTAssertEqual(twoNodeList.node(at: 0)?.item, 1)
        XCTAssertEqual(twoNodeList.node(at: 1)?.item, 2)
        
        XCTAssertEqual(threeNodeList.node(at: 0)?.item, 1)
        XCTAssertEqual(threeNodeList.node(at: 1)?.item, 2)
        XCTAssertEqual(threeNodeList.node(at: 2)?.item, 3)
    }
    
    func test_특정_인덱스_노드_삭제() {
        XCTAssertTrue(threeNodeList.node(at: 1)?.next === threeNodeList.node(at : 2))
        
        // 1 - 2 - 3 , 3 삭제
        var removedNode = threeNodeList.remove(at : 2)
        XCTAssertNil(threeNodeList.node(at: 2))
        XCTAssertNil(removedNode?.prev)
        XCTAssertNil(removedNode?.next)
        XCTAssertTrue(threeNodeList.first === threeNodeList.node(at: 0))
        XCTAssertTrue(threeNodeList.last === threeNodeList.node(at: 1))
        XCTAssertFalse(threeNodeList.node(at: 1)?.next === removedNode)
        XCTAssertEqual(removedNode?.item, 3)
        XCTAssertEqual(threeNodeList.count, 2, "한개의 노드가 삭제됬으니 카운트 2")
        
        // 1 - 2 , 1 삭제
        let originalSecondNode = threeNodeList.node(at: 1)
        removedNode = threeNodeList.remove(at: 0)
        XCTAssertTrue(threeNodeList.node(at: 0) === originalSecondNode)
        XCTAssertNil(removedNode?.prev)
        XCTAssertNil(removedNode?.next)
        XCTAssertTrue(threeNodeList.first === threeNodeList.node(at: 0))
        XCTAssertTrue(threeNodeList.last === threeNodeList.node(at: 0))
        XCTAssertFalse(removedNode === threeNodeList.node(at: 0))
        XCTAssertEqual(removedNode?.item, 1)
        XCTAssertEqual(threeNodeList.count, 1, "다시 한개의 노드가 삭제됬으니 카운트 1")
        
        // 1 , 1삭제
        removedNode = threeNodeList.remove(at: 0)
        XCTAssertNil(threeNodeList.node(at: 0))
        XCTAssertNil(removedNode?.prev)
        XCTAssertNil(removedNode?.next)
        XCTAssertNil(threeNodeList.first)
        XCTAssertNil(threeNodeList.last)
        XCTAssertFalse(removedNode === threeNodeList.node(at: 0))
        XCTAssertEqual(removedNode?.item, 2)
        XCTAssertEqual(threeNodeList.count, 0, "다시 한개의 노드가 삭제됬으니 카운트 0")
        
        XCTAssertTrue(threeNodeList.isEmpty)
        
        var removedOutBounaryNode = twoNodeList.remove(at: 3)
        XCTAssertNil(removedOutBounaryNode, "범위가 넘어간 노드를 지우려고 시도하면 nil")
    }
    
    func test_마지막_노드_삭제() {
        XCTFail()
    }
    
    func test_첫번째_노드_삭제() {
        XCTFail()
    }
    
    func test_특정_값_노드_삭제() {
        XCTFail()
    }
    
    func test_첫번째에_노드_삽입() {
        XCTFail()
    }
    
    func test_마지막에_노드_삽입() {
        XCTFail()
    }
    
    func test_특정_인덱스에_노드_삽입() {
        // 1 - 2 - 3 => 100 - 1 - 2 - 3
        let originList = threeNodeList
        XCTAssertTrue(threeNodeList.insert(item: 100, at: 0))
        XCTAssertEqual(threeNodeList.node(at: 0)?.item, 100)
        XCTAssertTrue(threeNodeList.node(at: 0) === threeNodeList.first)
        XCTAssertTrue(threeNodeList.node(at: 1) === originList?.node(at: 0))
        XCTAssertTrue(threeNodeList.node(at: 2) === originList?.node(at: 1))
        XCTAssertTrue(threeNodeList.node(at: 3) === originList?.node(at: 2))
        XCTAssertTrue(threeNodeList.node(at: 3) === threeNodeList.last)
        XCTAssertEqual(threeNodeList.count, 4)
        
        // 100 - 1 - 2 - 3 => 100 - 1 - 2 - 3 - 200
        XCTAssertTrue(threeNodeList.insert(item: 200, at: 4))
        XCTAssertEqual(threeNodeList.node(at: 4)?.item, 200)
        XCTAssertTrue(threeNodeList.node(at: 0) === threeNodeList.first)
        XCTAssertTrue(threeNodeList.node(at: 4) === threeNodeList.last)
        XCTAssertEqual(threeNodeList.count, 5)
        
        // 100 - 1 - 2 - 3 - 200 => 100 - 1 - 2 - 300 - 3 - 200
        XCTAssertTrue(threeNodeList.insert(item: 300, at: 3))
        XCTAssertEqual(threeNodeList.node(at: 3)?.item, 300)
        XCTAssertEqual(threeNodeList.count, 6)
    }
    
}


















