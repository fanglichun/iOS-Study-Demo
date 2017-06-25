//: Playground - noun: a place where people can play

import UIKit

let array1 = ["a", "b", "c", "d", "e"]
let array2 = ["d", "c", "f"]
let a = array2.filter { !array1.contains($0) }

print(a)




