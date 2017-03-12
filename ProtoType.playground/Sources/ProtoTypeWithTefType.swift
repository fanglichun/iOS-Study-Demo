import  Foundation
public class Contact {
    
    public var firstName: String
    public var lastName: String
    
    public init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Contact: Equatable {
    public static func ==(rhs: Contact, lhs: Contact) ->Bool {
        return rhs.firstName == lhs.firstName && rhs.lastName == lhs.lastName
    }
}

var contactProtoType = Contact(firstName: "Joe", lastName: "Black")
var anotherContact = contactProtoType

//print(memoryUtil.address(contactProtoType))
//print(memoryUtil.address(contactCopy))
anotherContact.firstName = ""
anotherContact.lastName = ""
