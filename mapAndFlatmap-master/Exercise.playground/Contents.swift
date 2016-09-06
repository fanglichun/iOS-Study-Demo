//: Playground - noun: a place where people can play

import UIKit


// 1. 将类型为 [Int] 的数组 [1,2,3,4] 中所有的元素乘以2
// 2。将类型为 [String?] 的数组 [“ab”, “cc” , nil, “dd”] 中的 nil 元素过滤掉。 分别用 map, filter 与 flatMap 的方式都实现一遍。

var dataArr: [Int] = [1, 2, 3, 4]

let resultArr = dataArr.map {
    $0 * 2
}
print(resultArr)
