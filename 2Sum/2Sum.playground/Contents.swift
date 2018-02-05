//: Playground - noun: a place where people can play

import UIKit

func twoSum(_ nums:[Int], target: Int) -> [[Int]] {
    var results = [[Int]]()
    if nums.count < 2 {
        return results
    }
    
    let sorted = nums.sorted()
    var l = 0
    var r = sorted.count - 1
    while l < r {
        let sum = sorted[l] + sorted[r]
        if sum == target {
            results.append([sorted[l], sorted[r]])
            l += 1
            r -= 1
            while sorted[l] == sorted[l - 1] && l < r { l += 1 }
            while sorted[r] == sorted[r + 1] && l < r { r -= 1 }
        } else if sum < target {
            l += 1
        } else if sum > target {
            r -= 1
        }
    }
    
    return results
}

twoSum([-1,-1,2,10,1,-2,-1,-4], target: 0)
