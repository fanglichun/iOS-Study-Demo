//: Playground - noun: a place where people can play

import UIKit

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
    

print(decrease(a: 3, b: 4))

















