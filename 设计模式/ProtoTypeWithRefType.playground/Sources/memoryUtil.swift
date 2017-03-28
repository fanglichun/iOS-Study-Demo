import Foundation

public struct memoryUtil {
    
    public static func address(_ o: UnsafeRawPointer) -> String {
        let address  = unsafeBitCast(o, to: Int.self)
        return String(format: "%p", address)
    }
    
    public static func address<T: AnyObject>(_ ref: T) -> String {
        let address = unsafeBitCast(ref, to: Int.self)
        return String(format: "%p", address)
    }
}
