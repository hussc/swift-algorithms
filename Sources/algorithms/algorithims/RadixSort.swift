//
//  File.swift
//  
//
//  Created by Hussein on 06/08/2022.
//

import Foundation

extension Array where Element == Int {
    mutating func radixSorted() {
        let base = 10
        var done = false
        var digits = 1
        
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            forEach {
                let remainingPart = $0 / digits
                let digit = remainingPart % base
                buckets[digit].append($0)
                
                if remainingPart > 0 {
                    done = false
                }
            }
            
            digits *= base
            self = buckets.flatMap { $0 }
        }
    }
}
