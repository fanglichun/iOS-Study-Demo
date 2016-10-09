//: Playground - noun: a place where people can play

import UIKit
import Foundation


private func gcd(a: Int, b: Int) ->Int {
    if a % b == 0 {
        return b
    } else {
        return gcd(a: b, b: a % b)
    }
    
}

func getGreatestCommonDivisor(a: Int, b: Int) -> Int {
    if a > b {
        return gcd(a: a, b: b)
    } else {
        return gcd(a: b, b: a % b)
    }
}







