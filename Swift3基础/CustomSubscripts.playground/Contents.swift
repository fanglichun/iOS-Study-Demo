//: Playground - noun: a place where people can play

import UIKit
import Foundation


struct Checkerboard {
    
    enum  Square: String {
        case empty = "▪️"
        case red = "&#x1f534;"
        case white = "⚪️"
        
    }

typealias Coordinate = (x: Int, y: Int)

    private var squares: [[Square]] = [
        [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
        [ .red,   .empty, .red,   .empty, .red,   .empty, .red,   .empty ],
        [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
        [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
        [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
        [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ],
        [ .empty, .white, .empty, .white, .empty, .white, .empty, .white ],
        [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ]
    ]
    
    subscript(coordinate: Coordinate) -> Square {
        get {
            return squares[coordinate.y][coordinate.x]
        }
        set {
            squares[coordinate.y][coordinate.x] = newValue
        }
    }
}

//extension Checkerboard: CustomStringConvertible {
//    
////    var description: String {
////        return squares.map { row in row.map { $0.rawValue }.joined(separator: "") }
////            .joined(separator: "\n") + "\n"
////    }
//
//}

let array = [1, 2, 3 ,4 ,5]
extension Array {
    subscript (safe index: Int) -> Element? {
        return self.count - 1 >= index ? self[index] : nil
    }
}










