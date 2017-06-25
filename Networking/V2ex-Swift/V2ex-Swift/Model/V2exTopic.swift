//
//  V2exHotTopic.swift
//
//  Created by mfang032 on 2017/6/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class V2exTopic: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let member = "member"
    static let content = "content"
    static let replies = "replies"
    static let contentRendered = "content_rendered"
    static let id = "id"
    static let created = "created"
    static let lastModified = "last_modified"
    static let lastTouched = "last_touched"
    static let node = "node"
    static let title = "title"
    static let url = "url"
  }

  // MARK: Properties
  public var member: V2exMember?
  public var content: String?
  public var replies: Int?
  public var contentRendered: String?
  public var id: Int?
  public var created: Int?
  public var lastModified: Int?
  public var lastTouched: Int?
  public var node: V2exNode?
  public var title: String?
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
    member <- map[SerializationKeys.member]
    content <- map[SerializationKeys.content]
    replies <- map[SerializationKeys.replies]
    contentRendered <- map[SerializationKeys.contentRendered]
    id <- map[SerializationKeys.id]
    created <- map[SerializationKeys.created]
    lastModified <- map[SerializationKeys.lastModified]
    lastTouched <- map[SerializationKeys.lastTouched]
    node <- map[SerializationKeys.node]
    title <- map[SerializationKeys.title]
    url <- map[SerializationKeys.url]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = member { dictionary[SerializationKeys.member] = value.dictionaryRepresentation() }
    if let value = content { dictionary[SerializationKeys.content] = value }
    if let value = replies { dictionary[SerializationKeys.replies] = value }
    if let value = contentRendered { dictionary[SerializationKeys.contentRendered] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = lastModified { dictionary[SerializationKeys.lastModified] = value }
    if let value = lastTouched { dictionary[SerializationKeys.lastTouched] = value }
    if let value = node { dictionary[SerializationKeys.node] = value.dictionaryRepresentation() }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.member = aDecoder.decodeObject(forKey: SerializationKeys.member) as? V2exMember
    self.content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? String
    self.replies = aDecoder.decodeObject(forKey: SerializationKeys.replies) as? Int
    self.contentRendered = aDecoder.decodeObject(forKey: SerializationKeys.contentRendered) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? Int
    self.lastModified = aDecoder.decodeObject(forKey: SerializationKeys.lastModified) as? Int
    self.lastTouched = aDecoder.decodeObject(forKey: SerializationKeys.lastTouched) as? Int
    self.node = aDecoder.decodeObject(forKey: SerializationKeys.node) as? V2exNode
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(member, forKey: SerializationKeys.member)
    aCoder.encode(content, forKey: SerializationKeys.content)
    aCoder.encode(replies, forKey: SerializationKeys.replies)
    aCoder.encode(contentRendered, forKey: SerializationKeys.contentRendered)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(lastModified, forKey: SerializationKeys.lastModified)
    aCoder.encode(lastTouched, forKey: SerializationKeys.lastTouched)
    aCoder.encode(node, forKey: SerializationKeys.node)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(url, forKey: SerializationKeys.url)
  }

}
