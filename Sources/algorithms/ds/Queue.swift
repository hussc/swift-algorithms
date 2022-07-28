//
//  File.swift
//  
//
//  Created by Hussein on 26/07/2022.
//

import Foundation

/**
 FIFO data structure,
 enqueue: 1,2,3,4 ->>>> dequeue: 1,2,3,4
 
 you can imagine a queue with a list where [| | -> | | | | | -> | | ]
 */
public protocol Queue {
    associatedtype Element
    
    /**
     Insert at the back of the queue.
     */
    @discardableResult
    mutating func enqueue(_ element: Element) -> Bool
    
    /**
     Remove the element at the front of the queue and return it.
     */
    mutating func dequeue() -> Element?
    
    
    var isEmpty: Bool { get }
    
    /**
     Element at the top, same as dequeue but without mutation.
     */
    var peek: Element? { get }
    var count: Int { get }
}


public struct ArrayQueue<Element>: Queue {
    private var storage: [Element] = []
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        storage.append(element)
        return true
    }
    
    // O(n) operation, we're shifting all the elements in the array when we remove the first element
    public mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        return storage.removeFirst()
    }
    
    public var peek: Element? { storage.first }
    public var isEmpty: Bool { storage.isEmpty }
    public var count: Int { storage.count }
}

public struct DoubleLinkedQueue<Element>: Queue {
    private var storage: DoubleLinkedList<Element> = .init()
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        storage.append(element)
        return true
    }
    
    // O(n) operation, we're shifting all the elements in the array when we remove the first element
    public mutating func dequeue() -> Element? {
        guard let head = self.storage.first else {
            return nil
        }
        
        return storage.remove(head)
    }
    
    public var peek: Element? { storage.first?.value }
    public var isEmpty: Bool { storage.isEmpty }
    public var count: Int { 1 } // didn't want to add implementation for the count for the double linked list
}

public struct QueueRingBuffer<T>: Queue {
    private var ringBuffer: RingBuffer<T>
    
    public var count: Int {
        ringBuffer.count
    }
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public var peek: T? {
        ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    }
}

public struct QueueStack<T>: Queue {
    public typealias Element = T
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public var count: Int {
        leftStack.count + rightStack.count
    }
    
    public init() { }
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
}
