//: Playground - noun: a place where people can play

import Foundation

/*
 冒泡排序（BubbleSort）的基本概念是：依次比较相邻的两个数，将小数放在前面，大数放在后面。即首先比较第1个和第2个数，将小数放前，大数放后。然后比较第2个数和第3个数，将小数放前，大数放后，如此继续，直至比较最后两个数，将小数放前，大数放后。重复以上过程，仍从第一对数开始比较（因为可能由于第2个数和第3个数的交换，使得第1个数不再小于第2个数），将小数放前，大数放后，一直比较到最大数前的一对相邻数，将小数放前，大数放后，第二趟结束，在倒数第二个数中得到一个新的最大数。如此下去，直至最终完成排序。
 由于在排序过程中总是小数往前放，大数往后放，相当于气泡往上升，所以称作冒泡排序。
 用二重循环实现，外循环变量设为i，内循环变量设为j。外循环重复9次，内循环依次重复9，8，...，1次。每次进行比较的两个元素都是与内循环j有关的，它们可以分别用a[j]和a[j+1]标识，i的值依次为1,2,...,9，对于每一个i, j的值依次为1,2,...10-i
 */


func bubbleSort<T>(SortedArray array: [T] = [], Asc isOrderedBefore: (T, T) ->Bool) ->[T] {
    
    guard array.count > 1 else {
        return array
    }
    
    var tempArray = array
    let count = tempArray.count
    for i in 0..<count {
        for j in 0..<count - 1 - i {
            if isOrderedBefore(tempArray[j + 1], tempArray[j]) {
                swap(&tempArray[j + 1], &tempArray[j])
            }
        }
    }
    return tempArray
    
}

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
        sortedArray[j] = temp
    }
    return sortedArray
    
}

let array = [1, 3, 9, 0, 0, 2323, 323, 23233, 2323]

print(insertSort(array, Asc: <))









