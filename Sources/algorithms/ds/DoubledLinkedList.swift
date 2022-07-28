//
//  File.swift
//  
//
//  Created by Hussein on 28/07/2022.
//

import Foundation

public struct DoubleLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: Node<T>? {
        head
    }
    
    @discardableResult
    public mutating func append(_ value: T) -> Node<T> {
        guard !isEmpty else {
            head = Node(value: value)
            tail = head
            return head!
        }
        
        let newNode = Node(prev: tail, value: value)
        
        tail?.next = newNode
        return newNode
    }
    
    @discardableResult
    public mutating func remove(_ node: Node<T>) -> T {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = prev
        }
        
        next?.prev = prev
        
        if next == nil {
            tail = next
        }
        
        node.prev = nil
        node.next = nil
        
        return node.value
    }
}

extension DoubleLinkedList {
    public class Node<T> {
        public var prev: Node<T>?
        public var value: T
        public var next: Node<T>?
        
        public init(prev: Node<T>? = nil, value: T, next: Node<T>? = nil) {
            self.prev = prev
            self.value = value
            self.next = next
        }
    }
}

extension DoubleLinkedList.Node: CustomStringConvertible {
    public var description: String {
        String(describing: value)
    }
}


extension DoubleLinkedList: CustomStringConvertible {
    public var description: String {
        var string = ""
        var current = head
        while let node = current {
            string.append("\(node.value) -> ")
            current = node.next
        }
        return string + "end"
    }
}

extension DoubleLinkedList: Sequence {
    public class Iterator<T>: IteratorProtocol {
        public typealias Element = Node<T>
        
        private var current: Node<T>?
        
        public init(current: Node<T>?) {
            self.current = current
        }
        
        public func next() -> Node<T>? {
            defer {
                self.current = current?.next
            }
            
            return self.current
        }
    }
    
    public func makeIterator() -> DoubleLinkedList.Iterator<T> {
        Iterator(current: self.head)
    }
}
