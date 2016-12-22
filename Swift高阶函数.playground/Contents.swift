//: Playground - noun: a place where people can play

import UIKit
import Foundation

func averageOfFunction(a: Double, b: Double, f: (Double -> Double)) ->Double {
    
    return (f(a) + f(b)) / 2
}

func square(a: Double) -> Double {
    return a * a
}

func cubic(b: Double) -> Double {
    return b * b * b
}


averageOfFunction(3, b: 4, f: square)

print(averageOfFunction(3, b: 4, f: cubic))

print(averageOfFunction(3, b: 4, f: { (x) -> Double in
    return x * x
}))

print(averageOfFunction(3, b: 4, f: { (x) -> Double in
    return x * x * x
}))

print(averageOfFunction(3, b: 4, f: {x in return x * x}))














