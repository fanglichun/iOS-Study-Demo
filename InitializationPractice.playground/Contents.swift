//: Playground - noun: a place where people can play

import UIKit

import Foundation

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print(f.temperature)


struct Celsius {
    
    
    var temperatutreInCelsius: Double
    
    init(fromFahrenheit fahrenheit:Double) {
        self.temperatutreInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatutreInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        self.temperatutreInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(boilingPointOfWater)
print(freezingPointOfWater)

struct Color {
    
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
print(magenta)
print(halfGray)
let veryGreen = Color(red: 0.0, green: 1.0, blue: 0.0)



struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//Failable Initializers for Enumerations

enum TemperatureUnit {
    
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character) {
        
        switch symbol {
            
        case "k":
            self = .kelvin
            
        case "c":
            self = .celsius
            
        case "f":
            self = .fahrenheit
            
        default:
            return nil
        }
    }

}

let fahrenheitUnit = TemperatureUnit(symbol: "k")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}


//Propagation of Initialization Failure

class Product {
    
    let name: String
    init?(name: String) {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    
    let quantity: Int
    init?(name: String, quantity: Int) {
        guard quantity >= 1 else {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

//Overriding a Failable Initializer

class Document {
    
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty { return nil}
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    
    override init() {
        //super.init()
        //self.name = "[Untitled]"
        super.init(name: "[Untitled]")!
        //super.init(name: "")!
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

let au = AutomaticallyNamedDocument()
print(au)

//Required Initializers
class SomeClass {
    
    
    required init() {
        // initializer implementation goes here
    }
}
class SomeSubclass: SomeClass {
    
    required init() {
        
    }
    
}

let s = SomeSubclass()
print(s)

struct Chessboard {
    
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row: Int, column: Int) ->Bool {
        return boardColors[row * 8 + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 9))
print(board.squareIsBlackAt(row: 7, column: 7))





