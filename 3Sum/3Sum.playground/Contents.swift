//: Playground - noun: a place where people can play

import UIKit

func threeSum(_ nums: [Int]) -> [[Int]] {
    var results = [[Int]]()
    if nums.count < 3 {
        return results
    }
    let snums = nums.sorted()
    let count = snums.count
    for i in 0..<(count-2) {
        if (i > 0 && snums[i] == snums[i-1]) {
            continue
        }
        var left = i + 1, right = count - 1
        let twoSumTarget = 0 - snums[i]
        while left < right {
            let curSum = snums[left] + snums[right]
            if curSum == twoSumTarget {
                results.append([snums[i], snums[left], snums[right]])
                left += 1
                right -= 1
                while snums[left] == snums[left-1] && left < right { left += 1 }
                while snums[right] == snums[right+1] && left < right { right -= 1}
            }
            else if curSum < twoSumTarget {
                left += 1
            }
            else {
                right -= 1
            }
        }
    }
    return results
}

threeSum([-1,-1,2,10,1,2,-1,-4])
