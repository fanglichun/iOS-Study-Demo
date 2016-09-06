//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
// 1. 将类型为 [Int] 的数组 [1,2,3,4] 中所有的元素乘以2
var dataArr: [Int] = [1, 2, 3, 4]

let resultMap = dataArr.map {
    $0 * 2
}
print(resultMap)

let resultFlapMap = dataArr.flatMap {
    $0 * 2
}
print(resultFlapMap)


// 2。将类型为 [String?] 的数组 [“ab”, “cc” , nil, “dd”] 中的 nil 元素过滤掉。 分别用 map, filter 与 flatMap 的方式都实现一遍。

var dataStringArr: [String?] = ["ab", "cc", nil, "dd"]
let resultMapFilter = dataStringArr.filter {
    $0 != nil
    }.map {
        $0
}
print(resultMapFilter)

let resultflatMap1 = dataStringArr.flatMap {
    $0
}
print(resultflatMap1)

