// Goal: Sort an array from low to high (or high to low).

func insertionSort<T>(_ array: [T], _ isFirst: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else {
        return array
    }
    var results = array
    
    for i in 1..<results.count {
        var j = i
        let temp = results[j]
        while j > 0 && isFirst(temp, results[ j - 1]) {
            results[j] = results[j - 1]
            j -= 1
        }
        results[j] = temp
    }
    
    return results
}

let strings = [ "b", "a", "d", "c", "e" ]
let numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]

insertionSort(strings, >)
insertionSort(strings, <)
insertionSort(numbers, >)
insertionSort(numbers, <)
