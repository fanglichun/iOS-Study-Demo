
import Foundation

public enum Title: String {
    case mr = "Mr."
    case ms = "Ms."
    case none = ""
}

extension Title: CustomStringConvertible {
    
    public var description: String {
        var result: String
        switch self {
        case .mr:
            result = Title.mr.rawValue
        case .ms:
            result = Title.ms.rawValue
        default:
            result = Title.none.rawValue
        }
        return result
    }
}

public struct BasicInfo {
    
    public var title: Title?
    public var fullName: String
    
}

extension BasicInfo: CustomStringConvertible {
    public var description: String {
        var result = fullName
        if let title = title {
            result = "\(title) ".appending(result)
        }
        return result
    }
}

public struct Address {
    public var street: String
    public var city: String
    public var state: String
    public var zip: String
    public var cooutry: String
    public var phoneNumber: String?
    
}

extension Address: CustomStringConvertible {
    
    public var description: String {
        let result = "\(street), \(city), \(state), \(zip), \(cooutry)"
        if let phoneNumber = phoneNumber {
            result.appending(", \(phoneNumber)")
        }
        return result
    }
}

public struct Employment {
    public var company: String
    public var occupation: String
    public var workAddress: Address
}

extension Employment: CustomStringConvertible {
    
    public var description: String {
        return "\(company), \(occupation), \(workAddress)"
    }
}

public struct Contact {
    
    public var info: BasicInfo
    public var address: Address?
    var employeement: Employment?
    public var notes: String?
}

extension Contact: CustomStringConvertible {
    
    public var description: String {
        var result = "\(info)"
        if let address = address {
            result = result.appending("\n\t \(address)")
        }
        if let employment = employeement {
            result = result.appending("\n\t \(employment)")
        }
        
        if let notes = notes {
            result = result.appending(notes)
        }
        return result
    }
}

extension Contact: Equatable {
    
    public static func ==(rhs: Contact, lhs: Contact) ->Bool {
        return rhs.info.fullName == lhs.info.fullName
    }
}

public class AddressBook {
    
    fileprivate var internalContacts = [Contact]()
    
    public var contacts: [Contact] {
        get {
            return internalContacts
        }
    }
    
    public func add(contact: Contact) {
        if internalContacts.index(of: contact) == nil {
            internalContacts.append(contact)
            internalContacts.sort{ $0.info.fullName < $1.info.fullName}
        }
    }
    
    public func remove(contact: Contact){
        if let index = internalContacts.index(of: contact) {
            internalContacts.remove(at: index)
        }
    }
    
    public func search(name: String) -> [Contact] {
        let matchingContacts = internalContacts.filter { $0.info.fullName.contains(name)
        }
        return matchingContacts
    }
}

extension AddressBook: CustomStringConvertible {
    public var description: String {
        var descriptions = String()
        contacts.forEach { contact in
            descriptions.append("\(contact)\n")
        }
        return descriptions
    }
}

let addressBook = AddressBook()
let info = BasicInfo(title: Title.mr, fullName: "Joe Black")
let address = Address(street: "1, Brannon", city: "New York", state: "NY", zip: "10026", cooutry: "US", phoneNumber: nil)
let employment = Employment(company: "", occupation: "", workAddress: address)

let contactPrototype = Contact(info: info, address: nil, employeement: employment, notes: nil)
var fordP = contactPrototype
fordP.info.fullName = "Ford Prefect"

var johnD = contactPrototype
johnD.info.fullName = "John Doe"

var maryM = contactPrototype
maryM.info.fullName = "Mary  Smith"
maryM.info.title = .ms
maryM.employeement?.workAddress.city = "Matairie"
maryM.employeement?.workAddress.street = "16, Shadow Drw"
maryM.employeement?.workAddress.zip = "70032"
maryM.employeement?.workAddress.state = "LA"
maryM.employeement?.company = "PwC"

print(contactPrototype)
print(fordP)
print(johnD)
print(maryM)

addressBook.add(contact: contactPrototype)
addressBook.add(contact: fordP)
addressBook.add(contact: johnD)
addressBook.add(contact: maryM)
print(addressBook)


let searchTerm = "Joh"
let results = addressBook.search(name: searchTerm)
print("search results for \(searchTerm)")
results.forEach { (contact) in
    print(contact)
}

if let contact = results.first {
    print("\n renoving contact\(contact)")
    addressBook.remove(contact: contact)
}

print("\nAddressBook after removed contact")
print(addressBook)



