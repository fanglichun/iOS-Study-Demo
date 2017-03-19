import  Foundation


public class WorkAddress: NSCopying, CustomStringConvertible {
    
    public var streetAddress: String
    public var city: String
    public var zip: String
    
    public init(streetAddress: String, city: String, zip: String) {
        self.streetAddress = streetAddress
        self.city = city
        self.zip = zip
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return WorkAddress(streetAddress: streetAddress, city: city, zip: zip)
    }
    
    public var description: String {
        return ""
    }
    
}

public class Contact: NSCopying, CustomStringConvertible {
    
    public var firstName: String
    public var lastName: String
    public var workAddress: WorkAddress
    
    public init(firstName: String, lastName: String, workAddress: WorkAddress) {
        self.firstName = firstName
        self.lastName = lastName
        self.workAddress = workAddress
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return Contact(firstName: self.firstName, lastName: self.lastName, workAddress: self.workAddress.copy() as! WorkAddress)
    }
    
    public var description: String {
        return "\(firstName), \(lastName)"
    }
}

extension Contact: Equatable {
    public static func ==(rhs: Contact, lhs: Contact) ->Bool {
        return rhs.firstName == lhs.firstName && rhs.lastName == lhs.lastName
    }
}

//var contactProtoType = Contact(firstName: "Joe", lastName: "Black")
//var anotherContact = contactProtoType
//
//print(memoryUtil.address(contactProtoType))
//print(memoryUtil.address(anotherContact))
//assert(contactProtoType == anotherContact, "content should match")
//anotherContact.firstName = "Frod"
//anotherContact.lastName = "Prefect"
//print(contactProtoType)
//print(anotherContact)
//
//var contactCopy = contactProtoType.copy() as! Contact
//contactCopy.firstName = "Joe"
//contactCopy.lastName = "Black"
//
//print(memoryUtil.address(contactProtoType))
//print(memoryUtil.address(contactCopy))

//shallow copy
var contactPrototype = Contact(firstName: "Joe", lastName: "Black", workAddress: WorkAddress(streetAddress: "1, Brannon street", city: "Los Angeles", zip: "90026"))

var contactCopy = contactPrototype.copy() as! Contact
print(memoryUtil.address(contactPrototype))
print(memoryUtil.address(contactCopy))

contactCopy.firstName = "Ford"
contactCopy.lastName = "Prefect"
contactCopy.workAddress.streetAddress = "Materie"
contactCopy.workAddress.city = "16, shadowmar Rrv"
contactCopy.workAddress.zip = "70006"

print(contactPrototype)
print(contactCopy)

print(memoryUtil.address(contactPrototype.workAddress))
print(memoryUtil.address(contactCopy.workAddress))




