//: Playground - noun: a place where people can play

import UIKit
import Foundation

let numbers = [1, 2, 3]

var numMulTwo1: [Int] = []
for var num in numbers {
    num += num
    numMulTwo1.append(num)
}
print(numMulTwo1)

let numMulTwo2 = numbers.map { (num: Int) ->Int in
    return num * 2
}
print(numMulTwo2)

let numMulTwo3 = numbers.map { num in
    return num * 2
}
print(numMulTwo3)

let numMulTwo4 = numbers.map { num in num * 2
}
print(numMulTwo4)
//使用map可以帮我们简化代码
let numMulTwo5 = numbers.map {
    $0 * 2
}
print(numMulTwo5)

let fruits = ["apple", "orange", "banana", ""]

//Map函数返回数组的元素类型不一定要与原数组相同

let counts = fruits.map { fruit -> Int? in
    let length = fruit.characters.count
    guard length > 0 else { return nil}
    return length
}
print(counts)
//Map还能返回判断数组中的元素是否满足某种条件的Bool值数组
let bools = fruits.map {
    $0.characters.count > 0
}
print(bools)


//flatMap和map的不同点：
//1)flatMap返回后的数组中不存在nil, 同时它会把Optional解包;
//2)flatMap还能把数组中存有数组的数组一同打开变成一个新的数组;
//3)flatMap也能把两个不同的数组合并成一个数组, 这个合并的数组元素个数是前面两个数组元素个数的乘积

//flatMap返回后的数组中不存在nil 同时它会把Optional解包
let fruitsFlatMap = fruits.flatMap { fruit -> Int? in
    let length = fruit.characters.count
    guard length > 0 else { return nil }
    return length
}
print(fruitsFlatMap)

//flatMap 还能把数组中存有数组的数组 一同打开变成一个新的数组
let array = [[1, 2 , 3], [4, 5, 6], [7, 8, 9]]
let arrayMap = array.map { $0}.map {
$0
}
print(arrayMap)
let flapMap = array.flatMap {
    $0
}
print(flapMap)
//flatMap也能把两个不同的数组合并成一个数组 这个合并的数组元素个数是前面两个数组元素个数的乘积
let fruitsCount = numbers.flatMap { count in
    fruits.map { fruit in
//        fruit  + "\(count)"
        (count, fruit)
    }
}
print(fruitsCount)



//Filter使用
//filter 可以取出数组中符合条件的元素 重新组成一个新的数组
let events = numbers.filter {
    $0 % 2 != 0 && $0 > 0
}
print(events)

//Reduce: map,flatMap和filter方法都是通过一个已存在的数组，生成一个新的、经过修改的数组。然而有时候我们需要把所有元素的值合并成一个新的值 那么就用到了Reduce

//1)获得数组所有元素的和
var sum = 0
for var num in numbers {
    sum += num
}
print(sum)

let sum1 = numbers.reduce(0) { total , num in
    return total + num
}
print(sum1)

let sum2 = numbers.reduce(0) {
    // reduce 函数第一个参数是返回值的初始化值
    $0 + $1
}
print(sum2)

//2)合并成的新值不一定跟原数组中元素的类型相同 
let numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
let tel = numberArray.reduce("") {
    // reduce 函数第一个参数是返回值的初始化值
    "\($0)" + "\($1)"
}
print(tel)


//3)ruduce 还可以实现 map 和 filter 并且时间复杂度变为O(n) 原来 map 和 filter 的时间复杂度是O(n*n)
extension Array {
    func mMap (transform: Element -> Element) -> [Element] {
        return reduce([], combine: { $0 + [transform($1)] })
    }
    func mFilter (includeElement: Element -> Bool) -> [Element] {
        return reduce([]) { includeElement($1) ? $0 + [$1] : $0 }
    }
}

let testmFilter = numberArray.mFilter {
    $0 > 1
}
print(testmFilter)

let testmMap = numberArray.mMap {
    $0
}

print(testmMap)






