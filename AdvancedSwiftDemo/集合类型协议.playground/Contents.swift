//: Playground - noun: a place where people can play

import UIKit
import Foundation

//Sequence && Collection


//迭代器

//protocol Sequence {
//    associatedtype Iterator: IteratorProtocol
//    func makeIterator() -> Iterator
// }

//protocol IteratorProtocol {
//    associatedtype Element
//    mutating func next() -> Element?
//}

struct ConstantIterator: IteratorProtocol {
    
    mutating func next() -> Int? {
        return 1
    }
}
//var iterator = ConstantIterator()
//while let x = iterator.next() {
//    print(x)
//}
struct FibsIterator: IteratorProtocol {
    var state = (0, 1)
    mutating func next() -> Int? {
        let upcomingNumber = state.0
        state = (state.1, state.0 + state.1)
        return upcomingNumber
    }
}

struct PrexIterator: IteratorProtocol {
    let string:String
    var offset:String.Index
    
    init(string:String) {
        self.string = string
        offset = string.startIndex
    }
    mutating func next() -> String? {
        guard offset < string.endIndex else {
            return nil
        }
        offset = string.index(after: offset)
        return nil
        // Subscripts returning String were obsoleted in Swift 4; explicitly construct a String from subscripted result
//        return string[string.startIndex..<offset]
    }
}


struct PrexSequence: Sequence {
    
    let string:String
    func makeIterator() -> PrexIterator {
        return PrexIterator(string: string)
    }
}

extension Sequence where Iterator.Element: Equatable,
                         SubSequence: Sequence,
                         SubSequence.Iterator.Element == Iterator.Element {
    func headMirrorsTail(_ n: Int) -> Bool {
        let head = prefix(n)
        let tail = suffix(n).reversed()
        return head.elementsEqual(tail)
    }
}

[1,2,3,4,2,1].headMirrorsTail(2)

protocol Queue {
    /// 在 `self` 中所持有的元素的类型
    associatedtype Element
    /// 将 `newElement` 入队到 `self`
    mutating func enqueue(_ newElement: Element)
    /// 从 `self` 出队一个元素
    mutating func dequeue() -> Element?
    
}

struct FIFOQueue<Element>: Queue {
    fileprivate var left:[Element] = []
    fileprivate var right:[Element] = []
    /// 将元素添加到队列最后
    /// - 复杂度: O(1)
    mutating func enqueue(_ newElement: Element) {
        right.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

extension FIFOQueue: Collection {
    
    //索引表示了集合中的位置。每个集合都有两个特殊的索引值:startIndex 和 endIndex。
//    startIndex 指定集合中第一个元素，
//    endIndex 是集合中最后一个元素之后的位置
    public var startIndex: Int { return 0 }
    public var endIndex: Int { return left.count + right.count }
    
    func index(after i: Int) -> Int {
        precondition(i < endIndex)
        return i + 1
    }
    
    subscript(position:Int) ->Element {
        precondition((0..<endIndex).contains(position), "Index out of bounds")
        if position < left.endIndex {
            return left[left.count - position - 1]
        } else {
            return right[position - left.count]
        }
    }
    
    typealias indices = CountableRange<Int>
    var indices: CountableRange<Int> {
        return startIndex..<endIndex
    }
}

var q = FIFOQueue<String>()
for x in ["1", "2", "3", "4"] {
    q.enqueue(x)
}

for s in q {
//    print(s, terminator: " ")
}

extension FIFOQueue: ExpressibleByArrayLiteral {
//    typealias ArrayLiteralElement = Element
    public init(arrayLiteral elements: Element...)  {
        self.init(left: elements.reversed(), right: [])
    }
}
let q1:FIFOQueue = [1, 2, 3]
let byteQueue:FIFOQueue<Int8> = [1 ,2 ,3]


let hello = "Hello"
let world = "World"
let helloIdx = hello.startIndex
world[helloIdx]


var array = [1, 2, 3]
for number in array {
    print(number)
    array = [4, 5, 6]
}
print(array)





