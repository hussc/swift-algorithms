//
//  File.swift
//  
//
//  Created by Hussein on 06/08/2022.
//

import Foundation

public extension Collection where Element: Comparable, Index: Strideable & SignedInteger, Index.Stride: SignedInteger, Self: MutableCollection {
    func selectionSorted() -> Self {
        guard count >= 2 else { return self }
        var result = self
        
        let end = result.index(result.endIndex, offsetBy: -1)
        for current in result.startIndex..<end {
            var lowest = current
            
            for other in result.index(after: current)..<result.endIndex {
                if result[lowest] > result[other] {
                    lowest = other
                }
            }
            
            if lowest != current {
                result.swapAt(lowest, current)
            }
        }
        
        return result
    }
}
