//: Playground - noun: a place where people can play

import UIKit

let numbers = [10, 20, 30, 40, 50, 60]


if let i = numbers.index(of: 40) {
    print(i)
    print(numbers.suffix(from: i))
    print(numbers.suffix(i))
    print(numbers.suffix(i))
    print("换行:\n")
    print(numbers.prefix(i))
    print(numbers.prefix(i))
    print(numbers.prefix(upTo: i))
    print(numbers.prefix(through: i))
}



func myForEach( clsure:(_ value: Int) ->Void) {
    
}
numbers.forEach { (value) in
    if value & 1 == 0 {
        print("偶数")
    } else {
        print("奇数")
    }
}










