//: Playground - noun: a place where people can play

import UIKit

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) { var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores { if score > max {
        max = score
    } else if score < min {
        min = score }
        sum += score }
    return (min, max, sum)
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number }
    return sum
}

sumOf()
sumOf(42, 597, 12)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> (Int -> Int) { func addOne(number: Int) -> Int {
    return 1 + number }
    return addOne }
var increment = makeIncrementer();
increment(7)