//: Playground - noun: a place where people can play

import UIKit

import Foundation

//func greet(person: String) -> String {
//    return "person"
//}
//
//func greet(_ person: String, alreadyGreeted: Bool) ->String{
//    if alreadyGreeted {
//        
//        return greet(person: "Michael")
//        
//    } else {
//        return "Fang"
//    }
//}

//print(greet("name", alreadyGreeted: false))

//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    guard let min = array.first, let max = array.first else {
//        return (0, 0)
//    }
//    
//    var currentMin = min
//    var currentMax = max
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//            
//       
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//let bounds = minMax(array: [1, 2, 44, 23, 4, 0])
//print(bounds.max)
//print(bounds.min)


//
//func minMax(array: [Int]) -> (min: Int, max: Int)? {
//    if array.isEmpty { return nil }
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//
//if let bounds = minMax(array: [0, 23, -32, 3443, 32]) {
//    print("min:\(bounds.min) max: \(bounds.max)")
//}
//
//
//func someFunction(_parameterName: Int) {
//    // In the function body, parameterName refers to the argument value
//    // for that parameter.
//}
//
//print(someFunction(_parameterName: 0))
//


//func arithmeticMean(_ numbers: Double...) -> Double {
//    var total: Double = 0;
//    for number in numbers {
//        total += number
//    }
//    
//    return total/Double(numbers.count)
//}
//
//
//let average = arithmeticMean(1, 2, 3, 4, 5)
//print(average)
//print(arithmeticMean(223, 23, 3223, 232332))
//
//func swapToInts(_ a: inout Int, _ b: inout Int) {
//    let temp = a
//    a = b;
//    b = temp
//}
//
//var a = 3, b = 10
//print("a: \(a) b: \(b)")
//print(swapToInts(&a, &b))
//print("a: \(a) b: \(b)")
//


//func addTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//
//func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a * b
//}
//
//var mathFunction: (Int, Int) ->Int = addTwoInts
//print(mathFunction(1, 23))
//
//mathFunction = multiplyTwoInts
//print(mathFunction(1, 2))


//nested function

//func chooseStepFunction(backward: Bool) ->(Int) ->Int {
//    
//    func stepForward(_ input: Int) -> Int {
//        return input + 1
//    }
//    
//    func stepBackward(_ input: Int) -> Int {
//        return input - 1
//    }
//    
//    return backward ? stepBackward: stepForward
//}
//
//var currentValue = 3;
//let moveToZero = chooseStepFunction(backward: currentValue > 0)
//while currentValue != 0 {
//    print("\(currentValue)... ")
//    currentValue = moveToZero(currentValue)
//}



let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(_ s1: String, _ s2: String) ->Bool {
    return s1 > s2
}

var reverseNames = names.sorted()
reverseNames.sorted(by: { (s1: String, s2: String) ->Bool in
    return s1 > s2
})

//print(reverseNames)

reverseNames.sorted { (s1, s2) -> Bool in
    return s1 > s2
}

reverseNames.sorted(by: {s1, s2 in s1 > s2})
reverseNames.sorted(by: {$0 > $1})
reverseNames.sorted(by: >)

func closureFunction(closure: () -> Void) {
}

closureFunction {
    
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

//print(strings)

let str = numbers.map { (num) -> String in
    
    var number = num
    var outPut = ""
    repeat {
        outPut = digitNames[number % 10]! + outPut
        number /= 10
    } while number > 0
    return outPut
}

func adder(forIncreasement amout: Int) ->() -> Int {
    var total = 0;
    func increase() -> Int {
        total += amout
        return total
    }
    return increase
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

//print(makeIncrementer(forIncrement: 3))
let increaseFunc = makeIncrementer(forIncrement: 3)
//print(increaseFunc())
//print(increaseFunc())
//print(increaseFunc())
let alsoIncrementByTen = increaseFunc
alsoIncrementByTen()
//functions and closures are reference types.










var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
//        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

//let instance = SomeClass()
//instance.doSomething()
//print(instance.x)
//completionHandlers.first?()
//print(instance.x)

//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//print(customersInLine.count)
//// Prints "5"
//
//let customerProvider = { customersInLine.remove(at: 0) }
//print(customerProvider())
//print(customersInLine.count)

//func serve(customer customerProvider: () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//serve(customer: { customersInLine.remove(at: 0) } )


//func serve(customer customerProvider: @autoclosure () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//serve(customer: customersInLine.remove(at: 0))
//


//var customerProviders: [() -> String] = []
//func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
//    customerProviders.append(customerProvider)
//}
//collectCustomerProviders(customersInLine.remove(at: 0))
//collectCustomerProviders(customersInLine.remove(at: 0))
//
//print("Collected \(customerProviders.count) closures.")
//// Prints "Collected 2 closures."
//for customerProvider in customerProviders {
//    print("Now serving \(customerProvider())!")
//}






//enum Trade {
//    
//    case Buy(stock: String, amount: Int)
//    case Sell(stock: String, amount: Int)
//}

//func trade(type: Trade) {}
//
//
//let trade = Trade.Buy(stock: "App", amount: 10)
//
//
//if case let Trade.Buy(stock, amount) = trade {
//    print("buy \(amount) of \(stock)")
//}



//Passing 2 arguments to a callee as a single tuple value has been removed in Swift 3

//enum Trade1 {
//    case Buy(String, Int)
//    case Sell(String, Int)
//}
//let tp = (stock: "TSLA", amount: 100)
//let trade1 = Trade.Sell(tp)

//typealias Config = (RAM: Int, CPU: String, GPU: String)
//
//func selectRAM(_ config: Config) -> Config {
//    return (RAM: 32, CPU: config.CPU, GPU: config.GPU)
//}
//
//func selectCPU(_ config: Config) -> Config {
//    return (RAM: config.RAM, CPU: "3.2GHZ", GPU: config.GPU)
//}
//
//func selectGPU(_ config: Config) -> Config {
//    return (RAM: config.RAM, CPU: "3.2GHZ", GPU: "NVidia")
//}
//
//enum Desktop {
//    case cube(Config)
//    case Tower(Config)
//    case Rack(Config)
//}
//
//let aTower = Desktop.Tower(selectGPU(selectCPU(selectRAM((0, "", "") as Config))))


//infix operator <^> { associativity left }
//
//func <^>(a: Config, f: (Config) -> Config) -> Config {
//    return f(a)
//}


//indirect enum ArithmeticExpression {
//    case number(Int)
//    case addition(ArithmeticExpression, ArithmeticExpression)
//    case multiplication(ArithmeticExpression, ArithmeticExpression)
//}
//
//let five = ArithmeticExpression.number(5)
//let four = ArithmeticExpression.number(4)
//let sum = ArithmeticExpression.addition(five, four)
//let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
//
//func evaluate(_ expression: ArithmeticExpression) ->Int {
//    switch expression {
//    case let .number(value):
//        return value
//    case let .addition(left, right):
//        return evaluate(left) + evaluate(right)
//    case let .multiplication(left, right):
//        return evaluate(left) * evaluate(right)
//    }
//}

//struct FixedLengthRange {
//    var firstValue: Int
//    let length: Int
//}
//
//let fixed = FixedLengthRange(firstValue: 0, length: 0)
//
//print(fixed.length)
//
//


class DataImporter {
    
    var filename = "data.txt"
    
}

class DataManager {
    
  lazy var impo
    
}

















