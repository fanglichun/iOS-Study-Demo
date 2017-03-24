//: Playground - noun: a place where people can play

import UIKit

import Foundation

class Vehicle {
    //You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).
    final var good = false
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

class Bicycle: Vehicle {
    
    var hasBasket = false
}
let vehicle = Vehicle()
let bicycle = Bicycle()
bicycle.currentSpeed = 10.0
bicycle.hasBasket = true
print("Bicycle value: \(bicycle.currentSpeed)")
print(bicycle.hasBasket)
print("Vehicle value: \(vehicle.currentSpeed)")
print(bicycle.description)
print(vehicle.description)


class Tandem: Bicycle {
    
    var currentNumberOfPassengers = 0
    //var hasBasket: Bool = false//cannot override with a stored property 'hasBasket'

}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 10
tandem.currentSpeed  = 22.0
print("Tandem: \(tandem.description)")
print("Bicycle value: \(bicycle.currentSpeed)")
print(bicycle.hasBasket)
print("Vehicle value: \(vehicle.currentSpeed)")

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("Choo Choo")
    }
}

let train = Train()
print(train.makeNoise())
//You can present an inherited read-only property as a read-write property by providing both a getter and a setter in your subclass property override. You cannot, however, present an inherited read-write property as a read-only property.


class Car:Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
            print("gear:\(gear) currentSpeed:\(currentSpeed)")
        }
    }
}

let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 35.0
print("automaticCar:\(automaticCar.description)")
print(automaticCar.gear)


final class Animal {
    
    var name: String?
    var age: Int?
}




