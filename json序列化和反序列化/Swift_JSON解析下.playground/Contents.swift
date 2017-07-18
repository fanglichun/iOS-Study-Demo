//: Playground - noun: a place where people can play

import UIKit
import Foundation
//Merge Data from Different Depths
let json = """
{
    "Banana": {
        "points": 200,
        "description": "A banana grown in Ecuador."
    },
    "Orange": {
        "points": 100,
        "description": "A juicy orange."
    }
}
""".data(using: .utf8)!

struct GroceryStore {
    var name: String
    var products: [Product]
    init(products: [Product] = []) {
        self.products = products
        self.name = ""
    }
    
    struct Product {
        let name: String
        let points: Int
        let description: String
    }
}

extension GroceryStore:Encodable {
    
    struct ProductKey: CodingKey {
        var stringValue: String
        init?(intValue: Int) { return nil }
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int? { return nil }
        static let points = ProductKey.init(stringValue: "points")!
        static let description = ProductKey.init(stringValue: "description")!
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ProductKey.self)
        for product in products {
            let nameKey = ProductKey.init(stringValue: product.name)!
            var productContainer = container.nestedContainer(keyedBy: ProductKey.self, forKey: nameKey)
            try productContainer.encode(product.points, forKey: .points)
            try productContainer.encode(product.description, forKey: .description)
        }
    }
}

extension GroceryStore: Decodable {
    init(from decoder: Decoder) throws {
        var products: [Product] = []
        let container = try decoder.container(keyedBy: ProductKey.self)
        for key in container.allKeys {
            let productContainer = try container.nestedContainer(keyedBy: ProductKey.self, forKey: key)
            let points = try productContainer.decode(Int.self, forKey: .points)
            let description = try productContainer.decode(String.self, forKey: .description)
            let product = Product(name: key.stringValue, points: points, description: description)
            products.append(product)
        }
        self.init(products: products)
    }
}

var encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let store = GroceryStore(products: [
    .init(name: "Grapes", points: 20, description: "A mixture of red and green grapes."),
    .init(name: "Lemons", points: 10, description: "An extra sour lemon.")
    ])
let encodedStore = try encoder.encode(store)
print(String(data: encodedStore, encoding: .utf8)!)
print()
let decoder = JSONDecoder()
let decodedStore = try decoder.decode(GroceryStore.self, from: json)
for product in decodedStore.products {
    print("name:\(product.name), desc:\(product.description)")
}

//时间格式化
struct Person: Encodable{
    var name: String
    var birthdayDate: Date
}

let p = Person(name: "Michael", birthdayDate: Date())
var encoder1 = JSONEncoder()
let dateformatter = DateFormatter()
dateformatter.dateStyle = .full
dateformatter.timeStyle = .full
encoder1.dateEncodingStrategy = .formatted(dateformatter)
encoder.outputFormatting = .prettyPrinted
let encodedPerson = try encoder1.encode(p)
if let jsonStr = String(data: encodedPerson, encoding: .utf8) {
    print(jsonStr)
}
//浮点类型处理
let numberJson = """
{
    "a": "NaN",
    "b": "+Infinity",
    "c": "-Infinity"
}
""".data(using: .utf8);








