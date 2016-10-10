//: Playground - noun: a place where people can play

import UIKit

let words = ["Aaron", "Michael", "Tony", "Danni", "Jun"]
let letters = ["A", "M", "T", "D"]
//get a new array that deleting first element
print(words.dropFirst())
print(words)
//get a new array that deleting last element
print(words.dropLast())
//get a new array that deleting 4 elements orderly
print(words.dropFirst(4))
//get a new array that deleting 4 elements the reverse
print(words.dropLast(2))
//if you want to delete
//ergodic array element and index,but only ergodic all elements
for(index, word) in words.enumerated() {
    print(index)
    print(word)
}
//ergodic specfied range element and index,but it depends on shorter collection's count
let range = 0...words.count
for (word, number) in zip(words, range) {
    print(word)
    print(number)
}
//assemble array A with array B
let zipped = Array(zip(words, letters))
print(zipped)

//sort ergodic array
for word in words.sorted() {
    print(word)
}
let sort = words.sorted { (a, b) -> Bool in
    a > b
}
print(sort)
//array element reverse
let reverse = words.reversed()
print(reverse)


for item in reverse {
    print(item)
}












































































