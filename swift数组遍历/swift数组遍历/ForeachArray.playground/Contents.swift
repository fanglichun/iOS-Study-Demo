//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var array = ["A", "B", "C", "D", "E", "F", "G", "H"]

for var index in 5..<array.count {
    if index == 5 {
        print("方式1：")
    }
    print(array[index])
}
(5..<array.count).forEach {
    if $0 == 5 {
        print("方式2")
    }
    print(array[$0])
}

for (index, value) in array[5..<array.count].enumerate() {
    if index + 5 == 5 {
        print("方式3")
    }
    print(value)
}

let  range = 5..<array.count
for(index, value) in zip(range, array) {
    if index == 5 {
        print("方式4")
    }
    print(value)
}

zip(range, array[range]).forEach { index, value in
    if index == 5 {
        print("方法5")
    }
    print(value)
}
print("方法6")
let results = array[range].map { $0
        print($0)
}
print("方法7")
for value in array.dropFirst(5) {
    print(value)
}
print("方法8")
var slice = array.dropFirst(5)
while !slice.isEmpty {
    let value = slice.removeFirst()
    print(value)
}
