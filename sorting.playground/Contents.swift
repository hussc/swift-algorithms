func mergeSort(array: [Int]) -> [Int] {
    func _merge(a: [Int], b: [Int]) -> [Int] {
        return a + b
    }
    
    func _mergeSort(_ array: [Int]) -> [Int] {
        // 1. split the array to half
        if array.count == 1 {
            return array
        }
        
        if array.count == 2 {
            return array[0] > array[1] ? [array[0], array[1]] : [array[1], array[0]]
        }
        
        let n = array.count
        let left = _mergeSort(Array(array[0..<(n/2)]))
        print("Left: \(left)")
        let right = _mergeSort(Array(array[(n / 2)..<n]))
        print("Right: \(right)")
        
        return _merge(a: left, b: right)
    }

    return _mergeSort(array)
}

mergeSort(array: [2,1,4,6])

