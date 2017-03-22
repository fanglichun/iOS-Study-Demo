//: Playground - noun: a place where people can play

import UIKit
import Foundation

struct Book {
    let title: String
    let author: String
    let price: String?
    let pubDate: String?
    
    init?(dict: [String: String]) {
        guard let title = dict["title"], let author = dict["author"] else {
            return nil
        }
        self.title = title
        self.author = author
        self.price = dict["price"]
        self.pubDate = dict["pubDate"]
    }
}

struct TimesTable {
    let multiplier: Int
    subscript(_ index: Int) ->Int {
        return multiplier * index
    }
}
let timeTable = TimesTable(multiplier: 3)
print("six times three is \(timeTable[3])");
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
print(numberOfLegs)
//Subscripts can use variadic parameters, but they can’t use in-out parameters or provide default parameter values.

struct Matrix {
    
    let rows: Int, columns: Int
    var grid:[Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    
    func indexIsValid(row: Int, column: Int) ->Bool {
        return (rows >= 0 && row < rows)  && (column >= 0 && column < columns)
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[row * columns + column]
            
        }
        
        set {
            assert(indexIsValid(row: row, column: column), "index out of range")
            grid[row * column + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
print(matrix.grid)
matrix[0, 1] = 1.5
print(matrix.grid)
matrix[1, 0] = 3.2
print(matrix.grid)




















