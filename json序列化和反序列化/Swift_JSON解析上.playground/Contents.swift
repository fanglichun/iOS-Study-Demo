//: A UIKit based Playground to present user interface
  
import Foundation

//1、Read Data From Arrays
/*
let json = """
[
    {
        "name": "Banana",
        "points": 200,
        "description": "A banana grown in Ecuador."
    },
    {
        "name": "Orange",
        "points": 100,
        "description": "An orange."
    }
]
""".data(using: .utf8)!
print(json)

struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String
}

let decoder = JSONDecoder()
let products = try decoder.decode([GroceryProduct].self, from: json)
for (index, item) in products.enumerated() {
    print("index:\(index)\r\n")
    print("name: \(item.name)")
    print("points: \(item.points)")
    print("description: \(item.description)")
}
*/
//2、Change Key Names
/*
let json1 = """
[
    {
        "product_name": "Bananas",
        "product_cost": 200,
        "description": "A banana grown in Ecuador."
    },
    {
        "product_name": "Oranges",
        "product_cost": 100,
        "description": "A juicy orange."
    }
]
""".data(using: .utf8)!
print(json1)

struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "product_name"
        case points = "product_cost"
        case description
    }
}

let decoder = JSONDecoder()
let products1 = try decoder.decode([GroceryProduct].self, from: json1)
for product in products1 {
    print("\t\(product.name),\(product.points),\(product.description)")
}*/

//3、Access Nested Data
struct GroceryStore {
    var name: String
    var products: [Product]
//    init(products: [Product] = []) {
//        self.products = products
//    }
    
    struct Product: Codable {
        var name: String
        var points: Int
        var description: String
    }
}


let json2 = """
[
    {
        "name": "Home Town Market",
        "aisles": [
            {
                "name": "Produce",
                "shelves": [
                    {
                        "name": "Discount Produce",
                        "product": {
                            "name": "Banana",
                            "points": 200,
                            "description": "A banana that's perfectly ripe."
                        }
                    }
                ]
            }
        ]
    },
    {
        "name": "Big City Market",
        "aisles": [
            {
                "name": "Sale Aisle",
                "shelves": [
                    {
                        "name": "Seasonal Sale",
                        "product": {
                            "name": "Chestnuts",
                            "points": 700,
                            "description": "Chestnuts that were roasted over an open fire."
                        }
                    },
                    {
                        "name": "Last Season's Clearance",
                        "product": {
                            "name": "Pumpkin Seeds",
                            "points": 400,
                            "description": "Seeds harvested from a pumpkin."
                        }
                    }
                ]
            }
        ]
    }
]
""".data(using: .utf8)!
print(json2)

struct GroceryStoreService: Decodable {
    let name: String
    let aisles: [Aisle]
    
    struct Aisle: Decodable {
        let name: String
        let shelves: [Shelf]
        
        struct Shelf: Decodable {
            let name: String
            let product: GroceryStore.Product
        }
    }
}
extension GroceryStore {
    init(from service: GroceryStoreService) {
        name = service.name
        products = []
        for aisle in service.aisles {
            for shelf in aisle.shelves {
                products.append(shelf.product)
            }
        }
    }
}

let decoder = JSONDecoder()
let serviceStores = try decoder.decode([GroceryStoreService].self, from: json2)
let stores = serviceStores.map { GroceryStore(from: $0)}
for store in stores {
    for product in store.products {
        print("product.name:\(product.name),product.points:\(product.points),product.desc:\(product.description)")
    }
}























