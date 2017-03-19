import Foundation

public enum Title: String {
    case mr = "Mr."
    case ms = "Ms."
    case none = ""
}

public struct BasicInfo {
    
    public var title: Title?
    public var fullName: String
    
}

public struct address {
    public var street: String
    public var city: String
    public var state: String
    public var zip: String
    public var cooutry: String
    public var phoneNumber: String?
    
}

public struct Employment {
    public var company: String
    public var occupation: String
    public var workAddress: address
}
