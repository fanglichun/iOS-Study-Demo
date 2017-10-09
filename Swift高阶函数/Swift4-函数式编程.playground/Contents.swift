//: Playground - noun: a place where people can play

import UIKit
import Foundation

extension Sequence {
    func findElement(_ match: (Self.Element) -> Bool) -> Element? {
        for element in self where match(element) {
            return element
        }
        return nil
    }
}
let array = [1, 2, 3, 4]
let obj = array.findElement{ $0 == 1}
print(obj ?? 0)

extension Array {
    func accumulate<U>(_ initial: U, combine: (U, Element) ->U) ->[U] {
        var running = initial;
        return self.map { next in
            running = combine(running, next)
            return running
        }
    }
}

let newArray = array.accumulate(0, combine: +)
print(newArray)
let array1 = (1..<10).map {$0 * $0}.filter { $0 % 2 == 0}
print(array1)

extension Array {
    func filter(included element:(Element) ->Bool) ->[Element] {
        var results: [Element] = []
        for x in self where element(x) {
            results.append(x)
        }
        return results
    }
}
print(array.filter { $0 % 2 != 0 })
print(array1.contains(where: {$0 != 0}))
print(array1.contains(5))

extension Sequence {
    
    public func allMatch(predicate: (Element) ->Bool) ->Bool {
        return !self.contains(where: { !predicate($0)})
    }
}

print(array1.allMatch(predicate: { $0 / 2 == 1 }))

let sum = array1.reduce(0, +)
print(sum)

extension Array {
    func reduce<U>(initial: U, combine: (U, Element) ->U) ->U {
        var result = initial
        for x in self {
            result = combine(result, x)
        }
        return result
    }
}
print(array1.reduce(initial: 0, combine: +))

extension Array {
    
//    func mMap (transform: Element -> Element) -> [Element] {
//        return reduce([], { $0 + [transform($1)]})
//    }
//    func mFilter (includeElement: Element -> Bool) -> [Element] {
//        return reduce([]) { includeElement($1) ? $0 + [$1] : $0 }
//    }
}

//extension Array {
//
//    func flatMap<T>(transform: Element ->[T]) -> [T] {
//        var result: [T] = []
//        for x in self {
//            result.append(contentsOf: transform(x))
//        }
//        return result
//    }
//}

let flatMap = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let sequence = flatMap.flatMap({ results in
    results.map({ (item) -> Int in
        return item
    })
})
print(sequence)




//flatMap 的另一个常⻅使用情景是将不同数组里的元素进行合并。为了得到两个数组中元素的所,有配对组合，我们可以对其中一个数组进行  atMap，然后对另一个进行 map 操作
let suits = ["♠", "♥", "♣", "♦"]
let ranks = ["J","Q","K","A"]

let allCombinations = suits.flatMap({ suit in
    ranks.map({ rank in
        return (suit, rank)
    })
})
print(allCombinations)


(1..<10).forEach { (num) in
    if num > 2 {
        print(num)
        return
    }
}

print(array1[1..<array1.endIndex])
let sliceArray = Array(array1[1..<array1.endIndex])
print(sliceArray)

let array2 = [1, 2, 3, 4, 5]
print(array2[1..<array2.endIndex])

























