//: Playground - noun: a place where people can play

import UIKit

var evens = [Int]()
for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}


let  filterEvents1 = evens.filter {
    $0 % 2 == 0
}

let filterEvents2 = evens.filter { value in
    value % 2 == 0
}

func myFiter<T>(source: [T], predicate: (T) -> Bool) -> [T] {
    var results = [T]()
    for item in source {
        if predicate(item) {
            results.append(item)
        }
    }
    return results
}

let dataArray = myFiter(source: evens) { $0 % 2 == 0 }
print(dataArray)
let s = dataArray.reduce(0) { (total, number) -> Int in
    total + number
}
print(s)


let sum = dataArray.reduce(0) {
    (total, number) in
    total + number
}

//customize filter and reduce function
extension Array {
    
    func myFiter<T>(source: [T], predicate: (T) -> Bool) -> [T] {
        var results = [T]()
        for item in source {
            if predicate(item) {
                results.append(item)
            }
        }
        return results
    }
    
    func myReduce<T, U>(seed: U, combiner: (U, T) -> U) -> U {
        var current = seed
        for item in self {
            current = combiner(current, item as! T)
        }
        return current
    }
}

let minus =  evens.myReduce(seed: 0) { (minus, number) -> Int in
    minus - number
}
print(minus)
//Building an Index










