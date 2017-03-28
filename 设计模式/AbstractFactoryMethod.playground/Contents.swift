//: Playground - noun: a place where people can play

import UIKit
import Foundation

public protocol Finish: CustomStringConvertible {
    
    var color: UIColor { get }
    var price: Float { get }
    
    var description: String { get }
}

public struct WhiteFinish: Finish {
    
    public var color: UIColor = UIColor.white
    public var price: Float = Float(300)
    public var description: String = "\n\tFinish: White"
    
    public init() {}
    
}

public struct BlackFinish: Finish {
    
    public var color: UIColor = UIColor.black
    public var price: Float = Float(400)
    public var description: String = "\n\tFinish: Black"
    
    public init() {}
    
}

public enum StorageType: String, CustomStringConvertible {
    case flash = "flash"
    case hardDisk = "hard disk"
    
    public var description: String {
        return self.rawValue
    }
    
}

public enum StorageSize: String, CustomStringConvertible {
    
    case small = "512GB"
    case medium = "1TB"
    case large = "2TB"
    
    public var description: String {
        return self.rawValue
    }
}

public protocol Storage: CustomStringConvertible {
    var type: StorageType { get }
    var size: StorageSize { get }
    var price: Float { get }
}



public struct SmallFlash: Storage {
    public var type: StorageType = .flash
    public var size: StorageSize = StorageSize.small
    public var price: Float = Float(500)
    
    public var description: String {
        return "\n\tStorage: \(size) \(type )"
    }
}

public struct MediumFlash: Storage {
    public var type: StorageType = .flash
    public var size: StorageSize = StorageSize.medium
    public var price: Float = Float(650)
    
    public var description: String {
        return "\n\tStorage: \(size) \(type )"
    }
}


public enum ProcessorType: String {
    
    case dualCore = "Dual Core"
    case quadCore = "Quad Core"
}

public enum ProcessorFrequency: String {
    
    case low = "1.4GHZ"
    case fast = "2.4GHZ"
    case turbo = "3.2GHZ"
}

public protocol Processor: CustomStringConvertible {
     var type: ProcessorType { get }
     var frequency: ProcessorFrequency { get }
     var price: Float { get }

}

public struct FastProcessor : Processor {
    public var type: ProcessorType = .dualCore
    public var frequency: ProcessorFrequency =  .fast
    public var price: Float = Float(320)
    
    public var description: String {
        return "\n\tProcessor: \(type) \(frequency.rawValue)"
    }
}

public struct TurboProcessor : Processor {
    public var type: ProcessorType = .dualCore
    public var frequency: ProcessorFrequency =  .turbo
    public var price: Float = Float(490)
    
    public var description: String {
        return "\n\tProcessor: \(type) \(frequency.rawValue)"
    }
}

public struct HighEndProcessor : Processor {
    public var type: ProcessorType = .dualCore
    public var frequency: ProcessorFrequency =  .turbo
    public var price: Float = Float(900)
    
    public var description: String {
        return "\n\tProcessor: \(type) \(frequency.rawValue)"
    }
}



public enum MemoryType: String {
    
    case dualCore = "DDR3"
    case quadCore = "LPDDR3"
}

public enum MemorySize: String {
    
    case basic = "8G"
    case medium = "16G"
    case pro = "32G"
}

public enum MemorySpeed: String {
    
    case fast = "1400MHZ"
    case turbo = "1600MHZ"
}

public protocol Memory: CustomStringConvertible {
    var type: MemoryType { get }
    var frequency: MemorySpeed { get }
    var size: MemorySize { get }
    var price: Float { get }
}

public struct BasicMemory:Memory {
    
    public var type: MemoryType = .dualCore
    public var size: MemorySize = .basic
    public var frequency: MemorySpeed = .fast
    public var price: Float = Float(200)
    
    public var description: String {
        return "\n\tMemory: \(size) \(type) \(frequency.rawValue)"
    }
    
}

struct Computer: CustomStringConvertible {
    public var finish: Finish
    public var storage: Storage
    public var processor: Processor
    public var memory: Memory
    public var price: Float {
        get {
            let total = finish.price + storage.price + processor.price + memory.price
            return total
        }
    }
    
    public var description: String {
        return "Your configuration: \(finish) \(storage) \(processor) \(memory) \nTotal: $\(price)"
        
    }
    
}

//let basicComputer = Computer(finish: WhiteFinish(), storage: SmallFlash(), processor: FastProcessor(), memory: BasicMemory())
//
//let officeComputer = Computer(finish: WhiteFinish(), storage: MediumFlash(), processor: TurboProcessor(), memory: BasicMemory())
//
//let developComputer = Computer(finish: WhiteFinish(), storage: SmallFlash(), processor: HighEndProcessor(), memory: BasicMemory())



public enum ComputerType {
    case basic
    case office
    case developer
    case highEnd
}

public class ComputerFactory {
    
    public func makeFinish() ->Finish? {
        return nil
    }
    
    public func makeStorage() ->Storage? {
        return nil
    }
    
    public func makeProcessor() ->Processor? {
        return nil
    }
    
    public func makeMemory()->Memory? {
        return nil
    }
    
    fileprivate class BasicComputerFactory: ComputerFactory {
        
        fileprivate override func makeFinish() -> Finish? {
            return WhiteFinish()
        }
        
        fileprivate override func makeStorage() -> Storage? {
            return SmallFlash()
        }
        
        fileprivate override func makeProcessor() -> Processor? {
            return FastProcessor()
        }
        
        fileprivate override func makeMemory() -> Memory? {
            return BasicMemory()
        }
    }
    
    fileprivate class DeveloperComputerFactory: ComputerFactory {
        fileprivate override func makeFinish() -> Finish? {
            return BlackFinish()
        }
        
        fileprivate override func makeStorage() -> Storage? {
            return MediumFlash()
        }
        
        fileprivate override func makeProcessor() -> Processor? {
            return TurboProcessor()
        }
        
        fileprivate override func makeMemory() -> Memory? {
            return BasicMemory()
        }
    }
    
    fileprivate class HighEndComputerFactory: ComputerFactory {
        fileprivate override func makeFinish() -> Finish? {
            return BlackFinish()
        }
        
        fileprivate override func makeStorage() -> Storage? {
            return MediumFlash()
        }
        
        fileprivate override func makeProcessor() -> Processor? {
            return HighEndProcessor()
        }
        
        fileprivate override func makeMemory() -> Memory? {
            return BasicMemory()
        }
    }
    
    public final class func makeFactory(type: ComputerType)->ComputerFactory {
        var factory: ComputerFactory
        switch type {
        case .basic:
            factory = BasicComputerFactory()
        case .developer:
            factory = DeveloperComputerFactory()
        case .office, .highEnd:
            factory = HighEndComputerFactory()
        }
        return factory
    }
}

let basicComputerFactory = ComputerFactory.makeFactory(type: .developer)

if let finish = basicComputerFactory.makeFinish(), let storage = basicComputerFactory.makeStorage(), let memory = basicComputerFactory.makeMemory(), let processor = basicComputerFactory.makeProcessor() {
    let computer = Computer(finish: finish, storage: storage, processor: processor, memory: memory)
    print(computer)
    
}
