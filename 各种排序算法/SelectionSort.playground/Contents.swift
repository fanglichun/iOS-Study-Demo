//: Playground - noun: a place where people can play

import Foundation


func selectionSort<T>(SortedArray array: [T] = [], Asc isOrderedBefore: (T, T) ->Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    var tempArray = array;
    for i in 0 ..< tempArray.count - 1 {
        var lowest = i
        for j in (i + 1)..<tempArray.count {
            if isOrderedBefore(tempArray[j], tempArray[lowest]) {
                lowest = j;
            }
        }
        if lowest != i {
            swap(&tempArray[i], &tempArray[lowest])
        }
    }
    return tempArray;
}

func bubbleSort<T>(SortedArray array: [T] = [], Asc isOrderedBefore: (T, T) ->Bool) ->[T] {
    
    guard array.count > 1 else {
        return array
    }
    
    var tempArray = array
    let count = tempArray.count
    for i in 0..<count {
        for j in 0..<count - 1 - i {
            if isOrderedBefore(tempArray[j], tempArray[j + 1]) {
                swap(&tempArray[j], &tempArray[j + 1])
            }
        }
    }
    return tempArray
    
}


let array = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]

let a =  selectionSort(SortedArray: [1, 2]) { (s1, s2) -> Bool in
    return s1 > s2
}
print(selectionSort(SortedArray: array, Asc: >))
print(bubbleSort(SortedArray: array, Asc: >))




