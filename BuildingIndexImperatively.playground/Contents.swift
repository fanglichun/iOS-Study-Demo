//: Playground - noun: a place where people can play

import UIKit
import Foundation


let words = ["Cat", "Chicken", "fish", "Dog",
             "Mouse", "Guinea Pig", "monkey"]


typealias Entry = (Character, [String])


//Building an Index Imperatively
func buildIndex(words: [String]) -> [Entry] {
    
    var result = [Entry]()
    
    var letters = [Character]()
    
    for word in words {
        
        let firstLetter = word.substring(to: word.index(word.startIndex, offsetBy: 1)).uppercased()
        if !letters.contains(Character(firstLetter)) {
            letters.append(Character(firstLetter))
        }
    }
    
    for letter in letters {
        var wordsForLetter = [String]()
        for word in words {
            let firstLetter = word.substring(to: word.index(word.startIndex, offsetBy: 1)).uppercased()
            if Character(firstLetter) == letter {
                wordsForLetter.append(word)
            }
        }
        result.append((letter, wordsForLetter))
    }
    return result
}

print(buildIndex(words: words))