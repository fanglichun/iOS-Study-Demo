//: Playground - noun: a place where people can play

import UIKit
import Foundation
let s =  stride(from:0.0, through: 1.0, by: 0.3)
//print(s)

for i in stride(from: 0, to: 4, by: 1) {
    //print("to:\(i)")
}

for i in stride(from: 0, through: 4, by: 1) {
    //print("through:\(i)")
}

enum RideCategory: String {
    case family
    case kids
    case thrill
    case scary
    case relaxing
    case water
}
extension RideCategory: CustomStringConvertible {
    
    var description: String {
        return rawValue
    }
}

typealias Minutes = Double
struct Ride {
    let name: String
    let categories: Set<RideCategory>
    let waitTime: Minutes
    
    
}

extension Ride: CustomStringConvertible {
    
    var description: String {
        return "name: \(name) categories: \(categories) waitTime: \(waitTime)"
    }
}


let parkRides = [
    Ride(name: "Raging Rapids", categories: [.family, .thrill, .water], waitTime: 45.0),
    Ride(name: "Crazy Funhouse", categories: [.family], waitTime: 10.0),
    Ride(name: "Spinning Tea Cups", categories: [.kids], waitTime: 15.0),
    Ride(name: "Spooky Hollow", categories: [.scary], waitTime: 30.0),
    Ride(name: "Thunder Coaster", categories: [.family, .thrill], waitTime: 60.0),
    Ride(name: "Grand Carousel", categories: [.family, .kids], waitTime: 15.0),
    Ride(name: "Bumper Boats", categories: [.family, .water], waitTime: 25.0),
    Ride(name: "Mountain Railroad", categories: [.family, .relaxing], waitTime: 0.0)
]


func sortedNames(of rides: [Ride]) ->[String] {
    var sortedRides = rides
    var key: Ride
    for i in (0..<sortedRides.count) {
        key = sortedRides[i]
        for j in stride(from: i, to: -1, by: -1) {
            if key.name.localizedCompare(sortedRides[j].name) == .orderedAscending {
                sortedRides.remove(at: j + 1)
                sortedRides.insert(key, at: j)
            }
        }
    }
    var sortedNames = [String]()
    for ride in sortedRides {
        sortedNames.append(ride.name)
    }
    return sortedNames
}


//print(sortedNames(of: parkRides))
var originalNames = [String]()
for ride in parkRides {
    originalNames.append(ride.name)
}

//print(originalNames)

var isPrime: ( () ->Bool)

func sort(_ a: [Int], Asc isOrder: (Int) ->Bool) ->[Int] {
    var items = [Int]()
    for item in a {
        if isOrder(item) {
            items.append(item)
        }
    }
    return items
}


let sortedArray = sort([1, 0 , 2]) { $0 > 0}
//print(sortedArray)

func waitTimeIsShort(ride: Ride) -> Bool {
    return ride.waitTime < 15.0
}


var shortWaitTimeRides = parkRides.filter { (ride) -> Bool in
    ride.waitTime > 15.0
}
//print(shortWaitTimeRides)

let rideNames = parkRides.map { $0.name}
//print(rideNames)

//print(rideNames.sorted(by: <))

let totalWaitTime = parkRides.reduce(0.0) { (total, ride) in
    total + ride.waitTime
}

let times = parkRides.reduce(0.0, { (total, ride) in
    total + ride.waitTime
})

//print(times)

//Partial Functions
func filter(for category: RideCategory) -> ([Ride]) -> [Ride] {
    return { (rides: [Ride]) in
        rides.filter({
            $0.categories.contains(category)
        })
    }
}
let kidRideFilter = filter(for: .kids)
//print(kidRideFilter(parkRides))
//

//Pure Functions

func ridesWithWaitTimeUnder(_ waitTime: Minutes, from rides: [Ride]) -> [Ride] {
    return rides.filter({ $0.waitTime < waitTime
    })
}

var shortWaitrides = ridesWithWaitTimeUnder(15, from: parkRides)
assert(shortWaitrides.count == 2, "Count of short wait rides should be 2")
//print(shortWaitrides)



extension Ride: Comparable {
    static func <(lhs: Ride, rhs: Ride) -> Bool {
        return lhs.waitTime < rhs.waitTime
    }
    
    static func ==(lhs: Ride, rhs: Ride) -> Bool {
        return lhs.name == rhs.name
    }
}


extension Array where Element: Comparable {
    
    func quickSorted() -> [Element] {
        if self.count > 1 {
            let (pivot, remaining) = (self[0], dropFirst())
            let lhs = remaining.filter { $0 <= pivot }
            let rhs = remaining.filter { $0 > pivot }
            return lhs.quickSorted() as [Element] + [pivot] + rhs.quickSorted()
        }
        return self
    }
}

let s1 = [1, 2, 3, 4]
print(s.dropFirst())

// imperative code
var ridesOfInterest: [Ride] = []
for ride in parkRides where ride.waitTime < 20 {
    for category in ride.categories where category == .family {
        ridesOfInterest.append(ride)
        break
    }
}

var sortedRidesOfInterest = ridesOfInterest.quickSorted()
print(sortedRidesOfInterest)

//declarative code
sortedRidesOfInterest.filter({ $0.categories.contains(.family) && $0.waitTime < 20
}).sorted(by: <)

print(sortedRidesOfInterest)




//func login(username: String, password: String, completion: (String?, Error?) ->Void) {
//    
//}


//login(username: "Michael", password: "23322323") { (token, error) in
//    if let token = token {
//        //success
//    } else if let error = error {
//        //failure
//    }
//}


struct Token {
    let string: String
}

struct Credential {
    var username: String
    var password: String
}


//func login(credential: Credential, completion: (String?, Error?) ->Void) {
//    
//}
//
let credential = Credential(username: "michael", password: "njnjnsdjks")
//login(credential: credential) { (token, error) in
//    
//}

enum Result<Value> {
    case success(Value)
    case failure(Error)
}






func login(credential: Credential, completion: (Result<Token>) ->Void) {

}

login(credential: credential) { (result) in
    switch result {
    case .success(let token):
        break
    case .failure(let error):
        break
    }
}



























