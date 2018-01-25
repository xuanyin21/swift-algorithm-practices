//Binary Search O(log n)

//recursive
//func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
//    if range.upperBound > range.lowerBound {
//        let middleIndex = (range.upperBound - range.lowerBound)/2 + range.lowerBound
//        if key > a[middleIndex] {
//            return binarySearch(a, key: key, range: middleIndex+1..<range.upperBound)
//        } else if key < a[middleIndex] {
//            return binarySearch(a, key: key, range: range.lowerBound..<middleIndex)
//        } else {
//            return middleIndex
//        }
//    } else {
//        return nil
//    }
//
//}

//Iterative
func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

binarySearch(numbers, key: 43)
