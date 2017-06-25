//
//  V2exMember.swift
//
//  Created by mfang032 on 2017/6/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class V2exMember: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let tagline = "tagline"
    static let avatarNormal = "avatar_normal"
    static let id = "id"
    static let avatarLarge = "avatar_large"
    static let username = "username"
    static let avatarMini = "avatar_mini"
  }

  // MARK: Properties
  public var tagline: String?
  public var avatarNormal: String?
  public var id: Int?
  public var avatarLarge: String?
  public var username: String?
  public var avatarMini: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    tagline <- map[SerializationKeys.tagline]
    avatarNormal <- map[SerializationKeys.avatarNormal]
    id <- map[SerializationKeys.id]
    avatarLarge <- map[SerializationKeys.avatarLarge]
    username <- map[SerializationKeys.username]
    avatarMini <- map[SerializationKeys.avatarMini]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = tagline { dictionary[SerializationKeys.tagline] = value }
    if let value = avatarNormal { dictionary[SerializationKeys.avatarNormal] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = avatarLarge { dictionary[SerializationKeys.avatarLarge] = value }
    if let value = username { dictionary[SerializationKeys.username] = value }
    if let value = avatarMini { dictionary[SerializationKeys.avatarMini] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.tagline = aDecoder.decodeObject(forKey: SerializationKeys.tagline) as? String
    self.avatarNormal = aDecoder.decodeObject(forKey: SerializationKeys.avatarNormal) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.avatarLarge = aDecoder.decodeObject(forKey: SerializationKeys.avatarLarge) as? String
    self.username = aDecoder.decodeObject(forKey: SerializationKeys.username) as? String
    self.avatarMini = aDecoder.decodeObject(forKey: SerializationKeys.avatarMini) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(tagline, forKey: SerializationKeys.tagline)
    aCoder.encode(avatarNormal, forKey: SerializationKeys.avatarNormal)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(avatarLarge, forKey: SerializationKeys.avatarLarge)
    aCoder.encode(username, forKey: SerializationKeys.username)
    aCoder.encode(avatarMini, forKey: SerializationKeys.avatarMini)
  }

}
