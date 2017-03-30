//: Playground - noun: a place where people can play

import UIKit
import Foundation

//类似于Array的index方法
func linearSearch<T: Equatable>(dataArray a: [T], Key key: T) -> Int? {
    for i in 0..<a.count {
        if key == a[i] {
            return i
        }
    }
    return nil
}

func binarySearch<T: Comparable>(DataArray array: [T], Key value: T) -> Int? {
    guard array.count > 0 else {
        return nil
    }
    
    var low = 0, high = array.count - 1
    
    while low <= high {
        if array[low] == value {
            return low
        }
        if array[high] == value {
            return high
        }
        let mid = low + (high - low) / 2
        if array[mid] == value {
            return mid
        } else if array[mid] < value {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return nil
}

func binarySearchRecursive<T: Comparable>(DataArray a: [T], lowerBound low: Int, UpperBound high: Int, Key key: T) ->Int? {
    guard a.count > 0 else {
        return nil
    }
    if low > high {
        return nil
    } else {
        let mid = low + (high - low) / 2
        if key == a[mid] {
            return mid
        } else if key < a[mid] {
            return binarySearchRecursive(DataArray: a, lowerBound: low, UpperBound: mid - 1, Key: key)
        } else {
            return binarySearchRecursive(DataArray: a, lowerBound: mid + 1, UpperBound: high, Key: key)
        }
    }
}


//be form github code
func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        if a[lowerBound] == key {
            return lowerBound
        }
        if a[upperBound - 1] == key {
            return upperBound - 1
        }
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

func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    guard  a.count > 0 else {
        return nil
    }
    if range.lowerBound > range.upperBound {
        return nil
    } else {
        let mid = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if a[mid] == key {
            return mid
        } else if a[mid] > key {
            return binarySearch(a, key: key, range: range.lowerBound..<mid)
        } else {
            return binarySearch(a, key: key, range: (mid + 1 )..<range.upperBound)
        }
    }
}

let array =  [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23, 23]
print("count: \(array.count)")

//own code 
print(binarySearch(DataArray: array, Key: 7) ?? -1)
//print(binarySearchRecursive(DataArray: array, lowerBound: 0, UpperBound: array.count - 1, Key: 3) ?? -1)


















