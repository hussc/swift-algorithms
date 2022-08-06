//
//  File.swift
//  
//
//  Created by Hussein on 06/08/2022.
//

import Foundation

/**
 How can we get rid of the constraint "MutableCollection"?
 */
public extension Collection where Element: Comparable, Index: Strideable, Self: MutableCollection {
    func bubbleSorted() -> Self {
        guard count >= 2 else {
            return self
        }
        
        var result = self
        
        let start = result.index(after: startIndex)
        for end in stride(from: start, to: endIndex, by: 1).reversed() {
            var swapped = false
            
            for current in stride(from: startIndex, to: end, by: 1) {
                let next = result.index(after: current)
                if result[current] > result[next] {
                    result.swapAt(current, next)
                    swapped = true
                }
            }
            
            if !swapped {
                return result
            }
        }
        
        return result
    }
}
