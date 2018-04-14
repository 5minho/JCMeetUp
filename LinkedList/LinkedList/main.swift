//
//  main.swift
//  LinkedList
//
//  Created by 오민호 on 2018. 4. 14..
//  Copyright © 2018년 오민호. All rights reserved.
//

import Foundation

struct LinkedList<T> {

    class Node<T> {
        weak var prev : Node? // cycle 방지 weak 선언
        var next : Node?
        var item : T
        
        init(item : T) {
            self.item = item
        }
    }
    
    //MARK: stored properties
    var first : Node<T>?
    var last : Node<T>?
    var count : Int = 0
    //MARK: computed properties
    var isEmpty : Bool {
        return (first == nil) && (last == nil)
    }
    
    //MARK: public methods
    public func node(at idx: UInt) -> Node<T>? {
        guard let first = self.first else {return nil}
        guard checkBoundary(idx : idx) else {return nil}
        var currentNode = first
        for _ in (0..<idx) {
            guard let nextNode = currentNode.next else {
                return nil
            }
            currentNode = nextNode
        }
        return currentNode
    }
    
    public mutating func appand(_ newNode : Node<T>) {
        clear(newNode)
        guard self.isEmpty == false else {
            self.first = newNode
            self.last = newNode
            self.count += 1
            return
        }
        last?.next = newNode
        newNode.prev = last
        last = newNode
        count += 1
    }
    
    public mutating func append(_ item : T) {
        let newNode = Node(item: item)
        appand(newNode)
    }
    
    public mutating func remove(at idx : UInt) -> Node<T>? {
        guard let removedNode = self.node(at: idx) else {
            return nil
        }
        return self.remove(removedNode)
    }
    
    public mutating func remove(_ node : Node<T>) -> Node<T>? {
        if let removedNextNode = node.next {
            removedNextNode.prev = node.prev
        }
        else {
            self.last = node.prev
        }
        if let removedPrevNode = node.prev {
            removedPrevNode.next = node.next
        }
        else {
            self.first = node.next
        }
        clear(node)
        count -= 1
        return node
    }
    
    //MARK: private method
    private func checkBoundary(idx : UInt) -> Bool {
        return idx < self.count
    }

    func clear(_ node : Node<T>) {
        node.prev = nil
        node.next = nil
    }
}

