//: Playground - noun: a place where people can play

import UIKit


let set1: Set = [1, 2, 3, 4];
let set2: Set = [3, 4, 5, 6];

print(set1.subtract(set2))


var arrayA = ["Mike", "James", "Stacey", "Steve"]
var arrayB = ["Steve", "Gemma", "James", "Lucy"]
for word in arrayB {
    if let ix = arrayA.indexOf(word) {
        arrayA.removeAtIndex(ix)
    }
}
print(arrayA)


class Team: NSObject{
    var id: Int!
    var name: NSString!
    var shortname: NSString!
    
    
    init(id: Int, name:NSString, shortname: NSString) {
        self.id = id
        self.name = name
        self.shortname = shortname
    }
    
    
//    required convenience init(coder aDecoder: NSCoder) {
//        let id = aDecoder.decodeIntegerForKey("id")
//        let name = aDecoder.decodeObjectForKey("name") as! String
//        let shortname = aDecoder.decodeObjectForKey("shortname") as! String
//        self.init(id: id, name: name, shortname: shortname)
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeInteger(id, forKey: "id")
//        aCoder.encodeObject(name, forKey: "name")
//        aCoder.encodeObject(shortname, forKey: "shortname")
//    }    
}

var t1 = Team(id: 1, name: "Adria", shortname: "Ad")
var t2 = Team(id: 2, name: "Roger", shortname: "Ro")
var t3 = Team(id: 3, name: "Raquel", shortname: "Ra")

var array: [Team] = [t1, t2, t3];

var arrayMap: Array = array.map(){ String($0.id) }


print(arrayMap) // 1,2,3

var array1 = ["a", "b", "f"]
let array2 = ["a", "c", "d"]
var arr = array1
arr = arr.filter { !array2.contains($0) }
print(arr)














