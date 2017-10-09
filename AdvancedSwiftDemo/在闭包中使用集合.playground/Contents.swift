//: Playground - noun: a place where people can play

import UIKit

extension Sequence where Iterator.Element: Hashable {
    ///remove duplicated elements of array or sequence
    func unique() ->[Iterator.Element] {
        var seen:Set<Iterator.Element> = []
        return filter {
            if seen.contains($0) {
                return false
            } else {
                seen.insert($0)
                return true
            }
        }
    }
}

[1,2,3,12,1,3,4,5,6,4,6].unique()

let singleDigitNumbers = 0..<10
let lowercaseLetters = Character("a")...Character("z")







