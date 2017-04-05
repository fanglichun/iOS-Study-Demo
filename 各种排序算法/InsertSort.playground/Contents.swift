//: Playground - noun: a place where people can play

import UIKit

//每步将一个待排序的记录，按其顺序码大小插入到前面已经排序的字序列的合适位置（从后向前找到合适位置后），直到全部插入排序完为止。

func insertSort<T>(_ array: [T], Asc isorderBefore: (T, T) -> Bool) -> [T] {
   
    var sortedArray = array
    for i in 1..<sortedArray.count {
        var j = i
        let temp = sortedArray[j]
        while j > 0 && isorderBefore(sortedArray[j], sortedArray[j - 1])  {
            swap(&sortedArray[j], &sortedArray[j - 1])
            j -= 1
           
        }
        //sortedArray[j] = temp
    }
    return sortedArray
    
}


func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y - 1]) {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}



let array = [1, 0, 3, 2, 40, 30, 19, 40, 15, 20,  15]
//print(insertionSort(array, >))
print(insertSort(array, Asc: <))





































































