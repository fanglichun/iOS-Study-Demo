//: Playground - noun: a place where people can play

import UIKit

import Foundation


let data: Data = Data()


let json = try? JSONSerialization.jsonObject(with: data, options: [])


var jsonDict = [String: Any]()
jsonDict["name"] = "Caffè Macs";
jsonDict["meals"] = ["breakfast", "lunch", "dinner"]
let subDict: [String: Any] = ["lat": 37.330576, "lon": -122.029739];
jsonDict["coordinates"] = subDict

print(jsonDict)

struct Restaurant {
    
    enum Meal: String {
        case breakfast, lunch, dinner
    }
    
    let name: String
    let coordinates: (latitude: Double, longitude: Double)
    let meals: Set<Meal>
}




enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

extension Restaurant {
    
    init(json: [String: Any]) throws {
        // Extract name
        guard let name = json["name"] as? String else {
            throw SerializationError.missing("name")
        }
        
        // Extract and validate coordinates
        guard let coordinatesJSON = json["coordinates"] as? [String: Double],
            let latitude = coordinatesJSON["lat"],
            let longitude = coordinatesJSON["lng"]
            else {
                throw SerializationError.missing("coordinates")
        }
        
        let coordinates = (latitude, longitude)
        guard case (-90...90, -180...180) = coordinates else {
            throw SerializationError.invalid("coordinates", coordinates)
        }
        
        // Extract and validate meals
        guard let mealsJSON = json["meals"] as? [String] else {
            throw SerializationError.missing("meals")
        }
        
        var meals: Set<Meal> = []
        for string in mealsJSON {
            guard let meal = Meal(rawValue: string) else {
                throw SerializationError.invalid("meals", string)
            }
            
            meals.insert(meal)
        }
        
        // Initialize properties
        self.name = name
        self.coordinates = coordinates
        self.meals = meals
    }
}

//extension Restaurant {
//    
//    private var urlComponents: URLComponents {
//        didSet {
//            
//        }
//    }
//    
//}

class CustomButton : UIButton
{
    @IBInspectable var borderWidth : CGFloat = 0.0
        {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
}

extension UIButton {
    @IBInspectable var borderWidth1 : CGFloat {
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
    }
}







