//merge sort

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var sortedArray = [T]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let left = leftArray[leftIndex]
        let right = rightArray[rightIndex]
        
        if left < right {
            sortedArray.append(left)
            leftIndex += 1
        } else if left > right {
            sortedArray.append(right)
            rightIndex += 1
        } else {
            sortedArray.append(left)
            leftIndex += 1
            sortedArray.append(right)
            rightIndex += 1
        }
    }
    
    while leftIndex < leftArray.count {
        sortedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightArray.count {
        sortedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }
    
    return sortedArray
}

mergeSort([2, 1, 5, 4, 9])
mergeSort(["s", "e", "c", "a", "z", "w", "g", "q", "n"])
