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
        var prev : Node?
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
        return false
    }
    
    //MARK: public methods
    public func node(at idx: UInt) -> Node<T>? {
        return nil
    }
    
    public func appand(_ node : Node<T>) {
        
    }
    
    public func append(_ item : T) {
        
    }
    
    //MARK: private method
    private func checkBoundary(idx : UInt) -> Bool {
        return false
    }
    
}

