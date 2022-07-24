//
//  File.swift
//  
//
//  Created by Hussein on 24/07/2022.
//

import Foundation
import XCTest
@testable import algorithms

final class mergeSortTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(algorithms().text, "Hello, World!")
    }
    
    func testRegularSort() throws {
        let array: [Int] = sampleArray
        
        var mutableArray1 = array
        let mineTimer = ParkBenchTimer()
        mergeSort(array: &mutableArray1)
        let mineDuration = mineTimer.stop()

        let originalTimer = ParkBenchTimer()
        let originalSorted = array.sorted()
        let originalTime = originalTimer.stop()
        
        print("Timers: \(mineDuration) ||| \(originalTime)")
        XCTAssertTrue(mutableArray1 == originalSorted)
    }
}

