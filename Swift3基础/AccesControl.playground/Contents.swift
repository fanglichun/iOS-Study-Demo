//: Playground - noun: a place where people can play

import UIKit

public class SomePublicClass {}
internal class SomeInternalClass {}// implicitly internal
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
let someInternalConstant = 0//implicitly internal

fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}
