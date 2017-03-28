//: Playground - noun: a place where people can play

import UIKit


var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
    completionHandler()
}

func someFunctionWithNonescapingClosure(closure: @noescape () -> Void) { //@noescape closur is default,so it can be ignored
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithNonescapingClosure {
            x = 200
            print(Thread.current)
        }
        someFunctionWithEscapingClosure {
            self.x = 100
            print(Thread.current)
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 输出 "200"

completionHandlers.first?()
print(instance.x)
// 输出 "100"


//@escaping:逃逸闭包可以在函数体调用结束之后调用，它可以在函数体之外被调用，逃逸闭包如果需要使用对象的变量或常量的时候，必须显示指明self
//一个闭包是逃逸必要的条件是这个闭包需要存储在函数外部
//@noescape:只能在函数体之内被调用，使用对象的变量或常量的时候，无需显示指明self




var students = ["A","B","C"]
print(students)
let studentsProvider = {
    students.remove(at: 0)
}
studentsProvider()
print(students)

func test(_ closure: @autoclosure @escaping () -> Void) {
    closure()
}













