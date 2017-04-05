//: Playground - noun: a place where people can play

import Foundation
/*
 在要排序的一组数中，选出最小的一个数与第一个位置的数交换；然后在剩下的数当中再找最小的与第二个位置的数交换，如此循环到倒数第二个数和最后一个数比较为止。
 */

func selectionSort<T>(SortedArray array: [T] = [], Asc isOrderedBefore: (T, T) ->Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    var tempArray = array;
    for i in 0 ..< tempArray.count {
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

let array = [ 10, -1, 3, 9, 2, 27, 8, 5, 4, 10,  1, 3, 0, 26, 30 ]

let a =  selectionSort(SortedArray: [1, 2, 0]) { (s1, s2) -> Bool in
    return s1 > s2
}
//print(a)


print(selectionSort(SortedArray: array, Asc: <))












