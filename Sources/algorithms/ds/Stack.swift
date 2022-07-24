//
//  File.swift
//  
//
//  Created by Hussein on 25/07/2022.
//

import Foundation

public struct Stack<T>: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = T
    
    private var storage: Array<T>
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
    public var count: Int {
        storage.count
    }
    
    public init(array: [T]) {
        self.storage = array
    }
    
    public init() {
        self.storage = []
    }
    
    public init(arrayLiteral elements: ArrayLiteralElement...) {
        self.storage = elements
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        return storage.popLast()
    }
    
    public mutating func push(_ element: T) {
        storage.append(element)
    }
    
    public func peek() -> T? {
        return storage.last
    }
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        storage.reversed().map { "\($0)" }.joined(separator: "\n")
    }
}
