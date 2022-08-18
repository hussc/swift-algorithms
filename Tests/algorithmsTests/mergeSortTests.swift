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
    func testRegularSort() throws {
        let array: [Int] = sampleArray
        
        var mutableArray1 = array
        let mineTimer = ParkBenchTimer()
        mutableArray1.mergeSort()
        let mineDuration = mineTimer.stop()

        let originalTimer = ParkBenchTimer()
        let originalSorted = array.sorted()
        let originalTime = originalTimer.stop()
        
        print("Timers: \(mineDuration) ||| \(originalTime)")
        XCTAssertTrue(mutableArray1 == originalSorted)
    }
    
    func testBubbleSort() throws {
        let array = [9, 4, 10, 3]
        XCTAssertEqual(array.bubbleSorted(), array.sorted())        
    }
    
    func testSelectionSort() throws {
        let array = [9, 4, 10, 3]
        XCTAssertEqual(array.selectionSorted(), array.sorted())
    }
    
    func testQuickSort() throws {
        let array = [9, 4, 10, 3]
        let array2 = [9, 4, 10, 3]
        
        XCTAssertEqual(quicksortNaive(array2), array.sorted())
    }
}

