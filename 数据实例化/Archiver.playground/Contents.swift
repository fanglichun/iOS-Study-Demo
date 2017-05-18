//: Playground - noun: a place where people can play

import UIKit

import Foundation

class Student: NSCoding {
    
    var stuNum: String?
    var personInfo: PersonInfo?
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stuNum, forKey: "stuNum")
        aCoder.encode(personInfo, forKey: "personInfo")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.stuNum = aDecoder.decodeObject(forKey: "stuNum") as? String
        self.personInfo = aDecoder.decodeObject(forKey: "personInfo") as? PersonInfo

    }
}

class PersonInfo: NSCoding {
    
    private static let nameKey = "Name"
    private static let ageKey = "Age"
    private static let IDNumberKey = "IDNumber"
    
    var name: String?
    var age: NSInteger = 0
    var IDNumber: String?
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: PersonInfo.nameKey)
        aCoder.encode(age, forKey: PersonInfo.ageKey)
        aCoder.encode(IDNumber, forKey: PersonInfo.IDNumberKey)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: PersonInfo.nameKey) as? String
        self.age = aDecoder.decodeObject(forKey: PersonInfo.ageKey) as? NSInteger ?? 0
        self.IDNumber = aDecoder.decodeObject(forKey: PersonInfo.IDNumberKey) as? String
    }
}


