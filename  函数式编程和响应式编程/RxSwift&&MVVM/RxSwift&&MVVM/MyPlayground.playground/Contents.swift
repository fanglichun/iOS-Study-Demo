//: Playground - noun: a place where people can play

import UIKit
import Foundation
let array = [1,2,3,4,5]
let array2 = array.filter({$0 > 1}).map({$0 * 2})//4 6 8 10
var indexGenerator = array2.makeIterator()
let fisrt = indexGenerator.next() // 4
let second = indexGenerator.next() //6


print("array2:\(array2)")
print("indexGenerator:\(indexGenerator)")

print("fisrt:\(fisrt)")
print("second:\(second)")








