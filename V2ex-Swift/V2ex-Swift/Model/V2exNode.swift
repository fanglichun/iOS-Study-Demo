//
//  MFV2Nodes.swift
//
//  Created by mfang032 on 2017/6/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class V2exNode: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let titleAlternative = "title_alternative"
    static let name = "name"
    static let topics = "topics"
    static let id = "id"
    static let created = "created"
    static let title = "title"
    static let footer = "footer"
    static let header = "header"
    static let url = "url"
  }

  // MARK: Properties
  public var titleAlternative: String?
  public var name: String?
  public var topics: Int?
  public var id: Int?
  public var created: Int?
  public var title: String?
  public var footer: String?
  public var header: String?
  public var url: String?

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
    titleAlternative <- map[SerializationKeys.titleAlternative]
    name <- map[SerializationKeys.name]
    topics <- map[SerializationKeys.topics]
    id <- map[SerializationKeys.id]
    created <- map[SerializationKeys.created]
    title <- map[SerializationKeys.title]
    footer <- map[SerializationKeys.footer]
    header <- map[SerializationKeys.header]
    url <- map[SerializationKeys.url]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = titleAlternative { dictionary[SerializationKeys.titleAlternative] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = topics { dictionary[SerializationKeys.topics] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = footer { dictionary[SerializationKeys.footer] = value }
    if let value = header { dictionary[SerializationKeys.header] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.titleAlternative = aDecoder.decodeObject(forKey: SerializationKeys.titleAlternative) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.topics = aDecoder.decodeObject(forKey: SerializationKeys.topics) as? Int
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.footer = aDecoder.decodeObject(forKey: SerializationKeys.footer) as? String
    self.header = aDecoder.decodeObject(forKey: SerializationKeys.header) as? String
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(titleAlternative, forKey: SerializationKeys.titleAlternative)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(topics, forKey: SerializationKeys.topics)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(footer, forKey: SerializationKeys.footer)
    aCoder.encode(header, forKey: SerializationKeys.header)
    aCoder.encode(url, forKey: SerializationKeys.url)
  }

}
