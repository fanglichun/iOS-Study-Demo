//: Playground - noun: a place where people can play

import UIKit
import Foundation

//辗转相除法， 又名欧几里得算法（Euclidean algorithm），目的是求出两个正整数的最大公约数
//两个正整数a和b（a>b），它们的最大公约数等于a除以b的余数c和b之间的最大公约数。
private func euclid(dividend: Int, divisor: Int) ->Int {
    return dividend % divisor == 0 ? divisor : euclid(dividend: divisor, divisor: dividend % divisor)
}

//更相减损术， 出自于中国古代的《九章算术》，也是一种求最大公约数的算法。
//两个正整数a和b（a>b），它们的最大公约数等于a-b的差值c和较小数b的最大公约数

private func decrease(a: Int, b: Int) ->Int {
    
    if a == b {
        return b
    }
    if a < b {
        return decrease(a: b - a, b: a)
    } else {
        return decrease(a: a - b , b: b)
    }
}

//
//func getGreatestCommonDivisor(a: Int, b: Int) -> Int {
//    var result = 1
//    result = a > b ? euclid(dividend: a, divisor: b) : euclid(dividend: b, divisor: a)
//    return result
//}
//
//print(getGreatestCommonDivisor(a: -1, b: 5))





private func gcd(a: Int, b: Int) ->Int {
    
    if a == b {
        return b
    }
    if a < b {
        return gcd(a: b, b: a)
    } else {
        let isEvenA = (a & 1)
        let isEvenB = (b & 1)
        if isEvenB == 0 && isEvenA == 0 {
            return gcd(a: a >> 11, b: b >> 1) << 1
        } else if isEvenA == 0 && isEvenB != 0 {
            return gcd(a: a >> 1, b: b)
        } else if isEvenA != 0 && isEvenB == 0 {
            return gcd(a: a, b: b >> 1)
        } else {
            return gcd(a: a, b: a - b)
        }
    }
}

func swap<T>(a:inout T, b:inout T){
    let temp = a
    a = b
    b = temp
}

var a = 2
var b = 3
print(a)
print(b)

print(swap(&a, &b))

print(a)
print(b)


































