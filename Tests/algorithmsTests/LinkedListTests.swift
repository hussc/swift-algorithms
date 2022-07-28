//
//  File.swift
//  
//
//  Created by Hussein on 25/07/2022.
//

import Foundation
import XCTest
@testable import algorithms

final class LinkedListTests: XCTestCase {
    func testPopOperation() throws {
        var list = createLinkedList()
        list.pop()
        XCTAssertEqual(list.count, 2)
    }
    
    func testListCount() throws {
        let list = createLinkedList()
        XCTAssertEqual(list.count, 3)
    }
    
    func testInsertOperation() throws {
        var list = createLinkedList()
        list.insert(value: -1, after: list.node(at: 0)!)
        XCTAssertEqual(list.node(at: 1)!.value, -1)
    }
    
    func testRemoveLast() throws {
        var list = createLinkedList()
        let value = list.removeLast()
        XCTAssertEqual(value, 3)
        XCTAssertEqual(list.count, 2)
    }
    
    func testRemoveAfter() throws {
        var list = createLinkedList()
        
        let node = list.node(at: 0)!
        let removedValue = list.remove(after: node)
        
        XCTAssertEqual(removedValue, 2)
        XCTAssertEqual(list.count, 2)
    }
      
    func testReverseLinkedList() throws {
        let list = createLinkedList()
        var anotherList = LinkedList<Int>()
        var currentNode = list.head
        
        while currentNode != nil {
            anotherList.push(currentNode!.value)
            currentNode = currentNode?.next
        }
        
        print(anotherList)
    }
    
    func testRemoveAllOcc() throws {
        var list = createLinkedList()
        list.push(2)
        list.push(2)
        list.push(2)
        
        let itemToRemove = 2
        var currentNode = list.head
        
        if currentNode?.value == itemToRemove {
            list.pop()
        }
        
        while currentNode != nil {
            if currentNode?.next?.value == itemToRemove {
                list.remove(after: currentNode!)
            }
            
            currentNode = currentNode?.next
        }
        
        print(list)
    }
    
    private func createLinkedList() -> LinkedList<Int> {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        return list
    }
}

