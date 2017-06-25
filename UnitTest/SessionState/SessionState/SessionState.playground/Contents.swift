//: Playground - noun: a place where people can play


import Foundation

public class sessionState {
    
    
    
    public var storage = [String: Any]()
    
    private let syncQueue = DispatchQueue(label: "serializationQueue")
    private let asyncQueue = DispatchQueue(label: "syncQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
    
    private init() {}
    
    public static let shared: sessionState = {
        let instance = sessionState()
        return instance
    }()
    
    public func set<T>(_ value: T?, forKey key: String) {
        
        asyncQueue.async(flags: .barrier) {
            if value == nil {
                if self.storage.removeValue(forKey: key) != nil {
                    print("successfully removed  value for key \(key)")
                } else {
                    print("No value for key \(key)")
                }
                self.storage[key] = value
            }
        }
        
//        syncQueue.sync {
//            if value == nil {
//                if storage.removeValue(forKey: key) != nil {
//                    print("successfully removed  value for key \(key)")
//                } else {
//                    print("No value for key \(key)")
//                }
//                storage[key] = value
//            }
//        }
        
//        syncQueue.sync {
//            storage[key] = value
//        }
    }
    
    public func object<T>(forKey key: String)-> T? {
        var result: T?
        
        asyncQueue.sync {
            result = storage[key] as? T ?? nil
        }
//        syncQueue.sync {
//            result = storage[key] as? T ?? nil
//        }
        return result
    }
}
