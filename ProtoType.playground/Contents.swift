//: Playground - noun: a place where people can play

import UIKit
import Foundation

public struct Contact: CustomStringConvertible{
    
    public var firstName: String
    public var lastName: String
    
    public var description: String {
        return "\(firstName), \(lastName)"
    }
}

extension Contact: Equatable {
    
    public static func ==(rhs: Contact, lhs: Contact) ->Bool {
        return rhs.firstName == lhs.firstName && rhs.lastName == lhs.lastName
    }
}

var contactProtoType = Contact(firstName: "Joe", lastName: "Black")

var contactCopy = contactProtoType

print(memoryUtil.address(&contactProtoType))
print(memoryUtil.address(&contactCopy))
print(contactProtoType)
print(contactCopy)
assert(contactProtoType == contactCopy, "contents should match")

contactCopy.firstName = "Ford"
contactCopy.lastName = "Prefect"
assert(contactProtoType != contactCopy, "contacts should differ")
print(contactProtoType)
print(contactCopy)

var numbers: Array<Int> = [1, 2, 3]
var numbersCopy = numbers
print(memoryUtil.address(&numbers))
print(memoryUtil.address(&numbersCopy))

numbersCopy.append(4)
print(memoryUtil.address(numbersCopy))
print(memoryUtil.address(&numbers))











