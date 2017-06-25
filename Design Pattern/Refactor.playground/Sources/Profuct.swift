import Foundation


public class Profduct {
    public var quantity: Int
    public var itemPrice: Double
    
    public init(quantity: Int, price: Double) {
        self.quantity = quantity
        self.itemPrice = price
    }
    
    public func getPrice() -> Double {
        let basePrice: Double = Double(quantity) * itemPrice
        var discountFactor: Double = 1;
        
        if basePrice > 1000.0 {
            discountFactor = 0.95
        } else {
            discountFactor = 0.98
        }
        
        return basePrice * discountFactor
    }
}




