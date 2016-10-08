//: Playground - noun: a place where people can play

import UIKit
import Foundation
var str = "Héllo, 🇺🇸laygr😮und!"
print(str.characters.count)
print(str.utf8.count)
print(str.utf16.count)

let range = str.index(str.startIndex, offsetBy: 3)..<str.index(str.startIndex, offsetBy: 10)

print(range)


let subStr1 = str.rangeOfComposedCharacterSequences(for: range)
print(subStr1)

var s = "hi, I am Michael"
var index = s.index(s.startIndex, offsetBy: 1)
print(index)
let s1 = s.substring(to: index)
print(s1.uppercased())


















