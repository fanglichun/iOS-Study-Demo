//: Playground - noun: a place where people can play

import UIKit
import Foundation


//let s = array.flatMap { (array) -> Sequence in
//    var arrays = Array<Int>();
//    let sum = array.reduce(0, +)
//    arrays.append(sum)
//}

//let numbersCompound = [[1,2,3],[4,5,6]];
//var res = numbersCompound.map { $0.map{ $0 + 2 } }
//print(res)
//var flatRes = numbersCompound.flatMap { $0.map{ $0 + 2 } }
//print(flatRes)


//var flatRes = numbersCompound.flatMap({
//    $0.reduce(0, +)
//})

let array = [[1, 2, 3, 4], [5, 6, 7, 8]]
//print(array)

var dict = [Int: Int]()

for (index, item) in array.enumerated() {
    let sum = item.reduce(0, +)
    dict[index] = sum
}
//print(dict)

func compare(_ num: Int) ->[Int: Int] {
    var retDic = [Int: Int]()
    for d in dict {
        if num > d.value {
            retDic[d.key] = d.value
        }
    }
    print(retDic)
    return retDic
}

let dict1 = compare(20)
if dict1.keys.count > 0 {
    var array = [Int]()
    for (key, value) in dict1 {
        print("key: \(key), value: \(value)")
        array.append(value)
    }
    if let max = array.max() {
        
    }
}












