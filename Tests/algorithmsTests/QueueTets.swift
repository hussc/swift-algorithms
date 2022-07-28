//
//  File.swift
//  
//
//  Created by Hussein on 26/07/2022.
//

import Foundation
import XCTest
@testable import algorithms

class QueueTests: XCTestCase {
    
    func testArrayBasicOperations() throws {
        // enqueue
        var queue = ArrayQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertEqual(queue.count, 3)
        XCTAssertEqual(queue.peek, 1)
        
        XCTAssertTrue(queue.dequeue() == 1)
        XCTAssertTrue(queue.peek == 2)
    }
}
