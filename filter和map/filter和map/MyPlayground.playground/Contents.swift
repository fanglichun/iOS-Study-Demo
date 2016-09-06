//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// filter基本使用
let userCollection = [(name: "张三", age: 20, phone:"123456"),
                      (name: "李四", age: 34, phone:"123456"),
                      (name: "王五", age: 45, phone:"123456")]

let  results  = userCollection.lazy.filter{ c in c.age < 45}.map{
    ($0.name, $0.age, $0.phone)
}
for result in results {
    print(result)
}

let numbers = [1,2,3,4]
// map 基本使用
let result1 = numbers.map {
    $0 + 2
}
print(result1)
// 接收整数，返回字符串
let resultString = numbers.map {
    "No.\($0)"
}
print(resultString)
// flatMap 使用
let result2 = numbers.flatMap {
    $0 + 2
}
print(result2)

// map 和 flatMap 的区分
let numbersCompound = [[1, 2, 3], [4, 5, 6]]
// numbersCompound.map { ... } 这个调用实际上是遍历了这里两个数组元素 [1,2,3] 和 [4,5,6] 。 因为这两个元素依然是数组，所以我们可以对他们再次调用 map 函数： $0.map{ $0 + 2 } 。 这个内部的调用最终将数组中所有的元素加 2。
var map = numbersCompound.map {
    $0.map {
        $0 + 2
    }
}
print(map)
// flatMap 依然会遍历数组的元素，并对这些元素执行闭包中定义的操作。 但唯一不同的是，它对最终的结果进行了所谓的 “降维” 操作。 本来原始数组是一个二维的， 但经过 flatMap 之后，它变成一维的了。
var flapMap = numbersCompound.flatMap {
    $0.map {
        $0 + 2
    }
}
// flatMap 的闭包接受的是数组的元素，但返回的是一个 SequenceType 类型，也就是另外一个数组
print(flapMap)

// flatMap 与 Optional
let optionalArray: [String?] = ["AA", nil, "BB", "CC"]
print(optionalArray)
let optionalMapResult = optionalArray.map {
    $0
}
// map 函数值对元素进行 变换 操作。 但不会对数组的 结构 造成影响
print( optionalMapResult)
let optionalFlapMapResult = optionalArray.flatMap {
    $0
}
// flatMap 会影响数组的结构
print(optionalFlapMapResult)
// flatMap 的这种机制，而已帮助我们方便的对数据进行验证，比如我们有一组图片文件名， 我们可以使用 flatMap 将无效的图片过滤掉：
var imageNames = ["test.png", "aa.png", "icon.png"];
imageNames.flatMap{ UIImage(named: $0) }
print(imageNames)
