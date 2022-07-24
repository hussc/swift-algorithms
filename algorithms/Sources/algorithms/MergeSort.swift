//
//  File.swift
//  
//
//  Created by Hussein on 24/07/2022.
//

import Foundation

func mergeSort<T: Comparable>(array: inout [T]) {
    func _merge<T: Comparable>(array: inout [T], l: Int, m: Int, r: Int) {
        // assumpting the array is equal sizes
        let a = Array(array[l...m])
        let b = Array(array[m+1...r])
        
        var i = 0
        var j = 0
        var k = l
        
        while i < a.count && j < b.count {
            if a[i] < b[j] {
                array[k] = a[i]
                i += 1
            } else {
                array[k] = b[j]
                j += 1
            }
            
            k += 1
        }
        
        while i < a.count {
            array[k] = a[i]
            i += 1
            k += 1
        }
        
        while j < b.count {
            array[k] = b[j]
            j += 1
            k += 1
        }
    }
    
    func _sort<T: Comparable>(array: inout [T], l: Int, r: Int) {
        if l >= r { return }
        let m = (l + r) / 2
        
        _sort(array: &array, l: l, r: m)
        _sort(array: &array, l: m + 1, r: r)
        _merge(array: &array, l: l, m: m, r: r)
    }
    
    _sort(array: &array, l: 0, r: array.count-1)
}
