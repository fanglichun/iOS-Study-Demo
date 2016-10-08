//: Playground - noun: a place where people can play

import UIKit
import Foundation

//Building an Index the Functional Way


let words = ["Cat", "Chicken", "fish", "Dog",
             "Mouse", "Guinea Pig", "monkey"]


let letters = words.map {
    
    Character($0.substring(to: $0.index($0.startIndex, offsetBy: 1)).uppercased())
}
print(letters)

func distinct<T: Equatable>(source: [T]) -> [T] {
    var unique = [T]()
    for item in source {
        if !unique.contains(item) {
            unique.append(item)
        }
    }
    return unique
}



typealias Entry = (Character, [String])

func buildIndex(words: [String]) -> [Entry] {
    
    //get first letter  and make it uppercased
    func firstLetter(str: String) -> Character {
        return Character(str.substring(to: str.index(str.startIndex, offsetBy: 1)).uppercased())
    }
    //ergodic
    let letters = words.map {
        
        firstLetter(str: $0)
//        Character($0.substring(to: $0.index($0.startIndex, offsetBy: 1)).uppercased())
    }
    print(letters)
    let distinctLetters = distinct(source: letters)
    return distinctLetters.map { letter -> Entry in
        return (letter, words.filter { word -> Bool in
//            Character(word.substring(to: word.index(word.startIndex, offsetBy: 1)).uppercased()) == letter
            firstLetter(str: word) == letter
        })
    }
}



print(distinct(source: letters))
print(buildIndex(words: words))








