//: Playground - noun: a place where people can play

import UIKit

/*
 冒泡排序（BubbleSort）的基本概念是：依次比较相邻的两个数，将小数放在前面，大数放在后面。即首先比较第1个和第2个数，将小数放前，大数放后。然后比较第2个数和第3个数，将小数放前，大数放后，如此继续，直至比较最后两个数，将小数放前，大数放后。重复以上过程，仍从第一对数开始比较（因为可能由于第2个数和第3个数的交换，使得第1个数不再小于第2个数），将小数放前，大数放后，一直比较到最大数前的一对相邻数，将小数放前，大数放后，第二趟结束，在倒数第二个数中得到一个新的最大数。如此下去，直至最终完成排序。
 由于在排序过程中总是小数往前放，大数往后放，相当于气泡往上升，所以称作冒泡排序。
 用二重循环实现，外循环变量设为i，内循环变量设为j。外循环重复9次，内循环依次重复9，8，...，1次。每次进行比较的两个元素都是与内循环j有关的，它们可以分别用a[j]和a[j+1]标识，i的值依次为1,2,...,9，对于每一个i, j的值依次为1,2,...10-i
 */

func bubbleSort(_ array: [Int] = []) -> [Int] {
    var tempArray = array;
    let count = tempArray.count
    
    for i in 0..<count - 1  {
        for  j in 0 ..< count - 1 - i {
            if tempArray[j] > tempArray[j + 1] {
                swap(&tempArray[j], &tempArray[j + 1]);
            }
        }
     }
    return tempArray
}
let array = [24, 17, 85, 13, 9, 54, 76, 45, 5, 63, 3];

print(bubbleSort(array));

