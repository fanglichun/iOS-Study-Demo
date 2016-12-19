//: Playground - noun: a place where people can play

import UIKit
/*
let values =  (1...1024).map{
    $0 * 2
}
let sum = (1...100).reduce(1, combine: +)
print(sum)

let words = ["Swift","iOS","cocoa","OSX","tvOS"]
let tweet = "This is an Swift tweet larking about Swift"

let isContained = !words.filter({tweet.containsString($0)}).isEmpty
print(isContained)




let path = NSBundle.mainBundle().pathForResource("test", ofType: ".txt")

let lines = try? String(contentsOfFile: path!).characters.split{ $0 == "\n" }.map(String.init)
print(lines)
let name = "Alice"
(1...4).forEach{print("Happy Birthday " + (($0 == 3) ? "dear \(name)":"to You"))}


let array = ["My", "name", "is", "Fang Lichun"]
array.forEach{
    if $0 == "My" {
        print($0 + " name is Fang Lichun")
    }
}

extension SequenceType {

    typealias Element = Self.Generator.Element
    
    func partitionBy(fu: (Element) -> Bool) -> (array1: [Element], array2: [Element]) {
        
        var firstArray = [Element]()
        var secondArray = [Element]()
        
        for item in self {
            if fu(item) {
                firstArray.append(item)
            } else {
                secondArray.append(item)
            }
        }
        return (firstArray, secondArray)
    }
    
    func anotherPartitionBy(fu: (Self.Generator.Element) -> Bool) -> (array1: [Self.Generator.Element], array2: [Self.Generator.Element]) {
        return (self.filter(fu), self.filter({
            !fu($0)
        }))
    }
}

let excellenceScoresArray = [100, 99, 40, 80, 75, 97, 80, 67].partitionBy {
    $0 >= 80
}.array1
print(excellenceScoresArray)


let passScoresArray = [100, 39, 40, 80, 75, 97, 80, 67].anotherPartitionBy({
    $0 >= 60
}).array1

print(passScoresArray)

let passedScoresArray = [100, 99, 40, 80, 75, 97, 80, 67].reduce(([], []), combine:  {
    (a: ([Int], [Int]), n: Int) -> ([Int], [Int]) in
    n >= 60 ? (a.0 + [n], a.1) : (a.0, a.1 + [n])
})
print(passedScoresArray)

let a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(a.reduce(0, combine: +))

*/

let arr = [1, 2, 4, 5, 6, 6, 8, 9, 7, 10]
let min1 = arr.sort().first
print(min1)
let min2 = arr.reduce(Int.max, combine: min)
print(min2)

let min3 = arr.minElement()
print(min3)
let max1 = arr.sort().last
print(max1)

print(arr.reduce(Int.min, combine: max))
print(arr.maxElement())

var n = 100
var primes = Set(2...n)

(2...Int(sqrt(Double(n)))).forEach{primes.subtractInPlace((2*$0).stride(through:n, by:$0))}
print(primes.sort())

var samplePrimes = Set(2...n)

samplePrimes.subtractInPlace((2...Int(sqrt(Double(n)))).flatMap{ (2*$0).stride(through:n, by:$0)})
print(samplePrimes.sort())





//交换两个元素的位置
var a = 2, b = 1
(a, b) = (b, a)
print(a)
print(b)

var s1 = "Michael", s2 = "Fang"
(s1, s2) = (s2, s1)
print(s1)
print(s2)

swap(&a, &b)
print(a)
print(b)
swap(&s1, &s2)
print(s1)
print(s2)

let s = ["Michael", "Fang", "My", "name", "is"]
print(s)

func swap(inout a: String, inout b: String) {
    (a, b) = (b, a)
}

swap(&s1, b: &s2)
print(s1)
print(s2)

































