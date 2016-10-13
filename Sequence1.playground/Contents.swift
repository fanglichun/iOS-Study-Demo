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


numbers.forEach { (value) in
    if value & 1 == 0 {
        print("偶数")
        
    } else {
        print("奇数")
    }
}


struct Countdown: Sequence, IteratorProtocol {
    var count: Int
    mutating func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer {
                count -= 1
            }
            return count
            
        }
    }
}

var count = Countdown(count: 4)
print(count.next())

let url = URL(string: "https://www.baidu.com")
do {
    let data = try Data(contentsOf: url!)
    print(data)
    
} catch {
    
}





















