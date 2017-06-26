//
//  User.swift
//  LighterViewControllers
//
//  Created by mfang032 on 2017/6/25.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class User: NSCoding {
    
    
    
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let firstname = "firstname"
        static let lastname = "lastname"
        static let username = "username"
        static let identifier = "identifier"
        static let photos = "photos"
    }
    
    // MARK: Properties
    public var firstname: String?
    public var lastname: String?
    public var username: String?
    public var identifier: String?
    public var photos: [Photo]?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    init() {
        
    }
    public required init(_ dict: [String: Any]) {
        firstname = dict[SerializationKeys.firstname] as? String
        lastname = dict[SerializationKeys.lastname] as? String
        username = dict[SerializationKeys.username] as? String
        identifier = dict[SerializationKeys.identifier] as? String
        photos = dict[SerializationKeys.photos] as? [Photo]
        
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = firstname { dictionary[SerializationKeys.firstname] = value }
        if let value = lastname { dictionary[SerializationKeys.lastname] = value }
        if let value = username { dictionary[SerializationKeys.username] = value }
        if let value = identifier { dictionary[SerializationKeys.identifier] = value }
        if let value = photos { dictionary[SerializationKeys.photos] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.firstname = aDecoder.decodeObject(forKey: SerializationKeys.firstname) as? String
        self.lastname = aDecoder.decodeObject(forKey: SerializationKeys.lastname) as? String
        self.username = aDecoder.decodeObject(forKey: SerializationKeys.username) as? String
        self.identifier = aDecoder.decodeObject(forKey: SerializationKeys.identifier) as? String
        self.photos = aDecoder.decodeObject(forKey: SerializationKeys.photos) as? [Photo]
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(firstname, forKey: SerializationKeys.firstname)
        aCoder.encode(lastname, forKey: SerializationKeys.lastname)
        aCoder.encode(username, forKey: SerializationKeys.username)
        aCoder.encode(identifier, forKey: SerializationKeys.identifier)
        aCoder.encode(photos, forKey: SerializationKeys.photos)
    }
   
}

extension User {
    
    func fullName() -> String? {
        return firstname ?? ""
    }
    
    func numberOfPhotosTaken() ->NSInteger {
        return photos?.count ?? 0
    }
   
}


