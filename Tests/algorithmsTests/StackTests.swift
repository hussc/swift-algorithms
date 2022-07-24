//
//  File.swift
//  
//
//  Created by Hussein on 25/07/2022.
//

import Foundation
import XCTest
@testable import algorithms

final class StackTests: XCTestCase {
    func testPopReturnsLastValue() throws {
        var stack = createStack()
        XCTAssertEqual(stack.pop(), 4)
    }
    
    func testPopMutatesItself() throws {
        var stack = createStack()
        stack.pop()
        XCTAssertEqual(stack.count, 3)
    }
    
    func testEmptyStack() throws {
        let stack: Stack<Int> = []
        XCTAssertTrue(stack.isEmpty)
    }
    
    func testBalanceParentheses() throws {
        /**
         Another solution might be to loop through the array, and whenever we find an open parenthese we do push it to the stack, whenever we find closed parenthese, we pop the stack, until we finish from the array, we verify isBalanced by returning isEmpty on the stack
         */
        func isStringParenthesesBalanced(_ string: String) -> Bool {
            var stack = Stack(array: Array(string))
            var openCount = 0
            var closedCount = 0
            
            while let element = stack.pop() {
                if element == "(" {
                    openCount += 1
                    continue
                }
                
                if element == ")" {
                    closedCount += 1
                    continue
                }
            }
            
            return openCount == closedCount
        }
        
        let balanced = "h((e))llo(world)()"
        let unbalanced = "(hello world"
        
        XCTAssertTrue(isStringParenthesesBalanced(balanced))
        XCTAssertFalse(isStringParenthesesBalanced(unbalanced))
    }
    
    private func createStack() -> Stack<Int> {
        [1, 2, 3, 4]
    }
}

