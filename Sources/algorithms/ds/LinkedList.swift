//
//  LinkedList.swift
//  
//
//  Created by Hussein on 25/07/2022.
//

import Foundation

public class Node<T>: CustomDebugStringConvertible {
    public var value: T
    public var next: Node<T>?
    
    public init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
    
    public var debugDescription: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> \(String(describing: next)) "
    }
}

public struct LinkedList<T>: CustomDebugStringConvertible {
    public var head: Node<T>?
    public var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var count: Int {
        if isEmpty { return 0 }
        
        var current = head
        var count = 0
        while current != nil {
            count += 1
            current = current?.next
        }
        
        return count
    }
    
    public var debugDescription: String {
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
    
    public init() { }
    
    public func node(at index: Int) -> Node<T>? {
        var current = head
        var currentIndex = 0
        
        while current != nil && currentIndex < index {
            current = current?.next
            currentIndex += 1
        }
        
        return current
    }
    
    @discardableResult
    public mutating func insert(value: T, after node: Node<T>) -> Node<T> {
//        copyNodes()
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    public mutating func push(_ value: T) {
//        copyNodes()
        self.head = Node(value: value, next: head)
        if tail == nil {
            self.tail = head
        }
    }
    
    public mutating func append(_ value: T) {
        copyNodes()
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        guard let node = copyNodes(returningCopyOf: prev) else {
            return nil
        }
        
        node.next = nil
        tail = node
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<T>) -> T? {
//        guard let node = copyNodes(returningCopyOf: node) else {
//            return nil
//        }
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
    private mutating func copyNodes(returningCopyOf node:
                                    Node<T>?) -> Node<T>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<T>?
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        return nodeCopy
    }
}

extension LinkedList {
    func getMiddle() -> Node<T>? {
        var fast = head
        var slow = head
        
        while let nextFast = fast?.next {
            fast = nextFast.next
            slow = slow?.next
        }
        
        return slow
    }
    
    mutating func reverse() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
}

extension LinkedList: Collection {
    public struct Index: Comparable {
        public var node: Node<T>?
        
        public static func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node, next: { $0?.next })
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        Index(node: head)
    }
    
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> T {
        position.node!.value
    }
}
