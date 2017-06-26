//
//  Photo.swift
//  LighterViewControllers
//
//  Created by mfang032 on 2017/6/25.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class Photo: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let name = "name"
        static let user = "user"
        static let rating = "rating"
        static let identifier = "identifier"
        static let creationDate = "creationDate"
    }
    
    // MARK: Properties
    public var name: String?
    public var user: User?
    public var rating: Double?
    public var identifier: String?
    public var creationDate: Date?
    
    init() {
        
    }
    
    init(_ name: String, user: User?, rating: Double, identifier: String, creationDate: Date) {
        self.name = name
        self.user = user
        self.identifier = identifier
        self.creationDate = creationDate
    }
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(_ dict: [String: Any]) {
        name = dict[SerializationKeys.name] as? String
        if let userDict = dict[SerializationKeys.user] as? [String: Any] {
            self.user = User(userDict)
        }
        rating = dict[SerializationKeys.rating] as? Double
        identifier = dict[SerializationKeys.identifier] as? String
        creationDate = dict[SerializationKeys.creationDate] as? Date
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = user { dictionary[SerializationKeys.user] = value.dictionaryRepresentation() }
        if let value = rating { dictionary[SerializationKeys.rating] = value }
        if let value = identifier { dictionary[SerializationKeys.identifier] = value }
        if let value = creationDate { dictionary[SerializationKeys.creationDate] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.user = aDecoder.decodeObject(forKey: SerializationKeys.user) as? User
        self.rating = aDecoder.decodeObject(forKey: SerializationKeys.rating) as? Double
        self.identifier = aDecoder.decodeObject(forKey: SerializationKeys.identifier) as? String
        self.creationDate = aDecoder.decodeObject(forKey: SerializationKeys.creationDate) as? Date
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: SerializationKeys.name)
        aCoder.encode(user, forKey: SerializationKeys.user)
        aCoder.encode(rating, forKey: SerializationKeys.rating)
        aCoder.encode(identifier, forKey: SerializationKeys.identifier)
        aCoder.encode(creationDate, forKey: SerializationKeys.creationDate)
    }
    
}

extension Photo {
    
    func adjustedRating() ->Double {
        guard let rating = self.rating else {
            return 0
        }
        var adjustedRating = (rating - 97.0) / 3.0
        if adjustedRating < 0 {
            adjustedRating = 0
        }
        return adjustedRating
    }
    
    func authorFullName() -> String? {
        return ""
    }
}


