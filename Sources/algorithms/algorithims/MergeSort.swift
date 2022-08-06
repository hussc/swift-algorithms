//
//  File.swift
//  
//
//  Created by Hussein on 24/07/2022.
//

import Foundation

extension MutableCollection where Element: Comparable {
    mutating func mergeSort() {
        func _merge(array: Self, l: Index, m: Index, r: Index) -> Self {
            // assumpting the array is equal sizes
            var result: Self = array
            
            let a = array[l...m]
            let b = array[array.index(after: m)...r]
            
            var i = a.startIndex
            var j = b.startIndex
            var k = l
            
            while i < a.endIndex && j < b.endIndex {
                if a[i] < b[j] {
                    result[k] = a[i]
                    i = array.index(after: i)
                } else {
                    result[k] = b[j]
                    j = array.index(after: j)
                }
                
                k = array.index(after: k)
            }
            
            while i < a.endIndex {
                result[k] = a[i]
                i = array.index(after: i)
                k = array.index(after: k)
            }
            
            while j < b.endIndex {
                result[k] = b[j]
                j = array.index(after: j)
                k = array.index(after: k)
            }
            
            return result
        }
        
        func _sort(array: Self, l: Index, r: Index) -> Self {
            if l >= r { return array }
            let size = distance(from: l, to: r)
            let m = index(l, offsetBy: size / 2)
            var array = array
            
            array = _sort(array: array, l: l, r: m)
            array = _sort(array: array, l: array.index(after: m), r: r)
            return _merge(array: array, l: l, m: m, r: r)
        }
        
        let end = index(endIndex, offsetBy: -1)
        self = _sort(array: self, l: self.startIndex, r: end)
    }
}
