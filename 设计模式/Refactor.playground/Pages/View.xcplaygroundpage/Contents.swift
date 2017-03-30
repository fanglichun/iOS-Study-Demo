//: Playground - noun: a place where people can play

import UIKit


class MyCustomer {
    
    let name: String
    let orders: Array<Int>
    
    init(name: String, orders: Array<Int>) {
        self.name = name
        self.orders = orders
    }
    
    func printOwing() {
       printBanner()
        printDetail(outstanding: getOutstanding())
    }
    
    func printDetail(outstanding: Int) {
        //print detail
        print("name\(self.name)")
        print("amout\(outstanding)")
    }
    
    func printBanner() {
        //print banner
        print("print banner");
    }
    
    func getOutstanding() -> Int {
        var outstanding: Int = 0
        for order in orders {
            outstanding += order
        }
        return outstanding
    }
}

let s = MyCustomer(name: "michael", orders: [1, 2, 3, 4, 5])
s.printOwing()

let s1 = Profduct(quantity: 1, price: 2.2)
print(s1.getPrice())











