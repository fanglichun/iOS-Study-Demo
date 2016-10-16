//: Playground - noun: a place where people can play

import UIKit

//Functional programming;
struct Counter {
    let count: Int
    init(count: Int = 0) {
        self.count = count
    }
    func countByIncresementing() -> Counter {
        let newCount = count + 1
        return Counter(count: newCount)
    }
}

var counter = Counter(count: 0)
print(counter.count)
counter = counter.countByIncresementing()
print(counter.count)
//functional programming make variable become constant,but sometims code readability could become bad

//Mutaing function
/*struct Counter {
    private(set) var count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
    
    mutating func increment() {
        count += 1
    }
}
var counter = Counter(count: 0)
print(counter.count)
counter.increment()
print(counter.count)*/
//mutaing function could improve code readability,although it could become unsafe, we could use private of fileprivate feature to cover the shortage.


