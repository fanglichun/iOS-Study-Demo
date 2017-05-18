//: Playground - noun: a place where people can play

import UIKit

import Foundation

var para: String = ""

func f1( para: inout String) ->String {
    para += "Michael"
    return para
}

func f2(para: inout String) ->String {
    para = "立春"
    return para
}

print(f1(para: &para))
print(f2(para: &para))







