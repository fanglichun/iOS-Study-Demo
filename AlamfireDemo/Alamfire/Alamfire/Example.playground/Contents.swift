//: Playground - noun: a place where people can play

import UIKit
import Alamofire

protocol BaseNumberStringConvertible {
    
    var intValue: Int? { get}
    var doubleValue: Double? { get}
    var floatvalue: Float? { get }
    
}

extension String: BaseNumberStringConvertible {
    
    public var intValue: Int? {
        if let doubleValue = doubleValue {
            return Int(doubleValue)
        }
        return nil
    }
    
    public var doubleValue: Double? {
        return Double(self)
    }
    
    public var floatvalue: Float? {
        return Float(self)
    }
}

let str = "1.222"
//print(str.intValue ?? 0)
//print(str.doubleValue ?? 0)
//print(str.floatvalue ?? 0)
//guard let url = URL(string: "") else {
//    return
//}
//do {
//    let request = try URLRequest(url: url, method: HTTPMethod.get)
//    
//} catch(let error)  {
//    
//}

//define subscript
class MySubscriptionClass {
    
    var value: String = "default"
    
    subscript(_ myValue: String) -> String {
        get {
            return value
        }
        set {
            value = newValue
        }
    }
}

let s1 = MySubscriptionClass()
s1["Key"] = "michael"
//print(s1.value)
s1["value"] = "Fang"
//print(s1.value)

let stringArray = ["Tom", "ALice", "Alex"]
//print(stringArray.joined(separator: " \\\n\t"))
let array = Array<String>()
//print(array.joined(separator: ", ").characters.count)


let descriptions: [AnyHashable: Any] = [
         AnyHashable("😄"): "emoji",
         AnyHashable(42): "an Int",
         AnyHashable(Int8(43)): "an Int8",
         AnyHashable(Set(["a", "b"])): "a set of strings"
     ]
//     print(descriptions[AnyHashable("😄")]!)      // prints "an Int"
//     print(descriptions[AnyHashable(43)])       // prints "nil"
//     print(descriptions[AnyHashable(Int8(43))]!) // prints "an Int8"
//     print(descriptions[AnyHashable(Set(["a", "b"]))]!) // prints "a set of strings"


struct ShippingOptions: OptionSet {
         let rawValue: Int

         static let nextDay    = ShippingOptions(rawValue: 1 << 0)
         static let secondDay  = ShippingOptions(rawValue: 1 << 1)
         static let priority   = ShippingOptions(rawValue: 1 << 2)
         static let standard   = ShippingOptions(rawValue: 1 << 3)

         static let express: ShippingOptions = [.nextDay, .secondDay]
         static let all: ShippingOptions = [.express, .priority, .standard]
     }

     let singleOption: ShippingOptions = .priority
     let multipleOptions: ShippingOptions = [.nextDay, .secondDay, .priority]
     let noOptions: ShippingOptions = []




protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
//    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}










