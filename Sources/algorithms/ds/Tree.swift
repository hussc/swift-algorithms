//
//  File.swift
//  
//
//  Created by Hussein on 29/07/2022.
//

import Foundation

public class TreeNode<T> {
    let value: T
    var children: [TreeNode<T>]
    
    public init(_ value: T) {
        self.value = value
        self.children = []
    }
    
    public func append(_ value: TreeNode<T>) {
        self.children.append(value)
    }
}

extension TreeNode {
    public func forEachDepthFirst(_ block: ((TreeNode<T>) -> Void)){
        block(self)
        children.forEach { $0.forEachDepthFirst(block) }
    }
    
    public func forEachLevelOrder(_ visit: ((TreeNode<T>) -> Void)) {
        visit(self)
        var queue = ArrayQueue<TreeNode<T>>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
