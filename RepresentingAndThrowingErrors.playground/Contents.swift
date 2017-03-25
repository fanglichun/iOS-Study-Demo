//: Playground - noun: a place where people can play

import UIKit
import Foundation

enum VendingMachineError: Error {
    
    case invalidSelection
    case insufficientFunds(coninsNeed: Int)
    case outOfStock
    
}

throw VendingMachineError.insufficientFunds(coninsNeed: 5)

