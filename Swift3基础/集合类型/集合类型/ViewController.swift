//
//  ViewController.swift
//  集合类型
//
//  Created by mfang032 on 10/25/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        super.viewDidLoad()
        //switichBreak()
        switchFallthrough()
        var somsInts = [Int]()
        somsInts.append(3)
        somsInts = []
        
        print("somsInts'count:\n\(somsInts.count)")
        
        //创建一个带有默认值的数组
        var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
        var threeInts = [Int](count: 3, repeatedValue: 0)
        print("threeDoubles:\(threeDoubles)  threeInts:\(threeInts)")
        //通过两个数组相加创建一个数组
        var anotherThreeDoubles = Array(count: 3, repeatedValue: 0.3)
        var sixDoubles = threeDoubles + anotherThreeDoubles
        print(sixDoubles)
        
        //用字面量来构造数组
        //var shoppingList: [String] = ["Dog","Pig"]
        var shoppingList = ["Eggs","Milk"]
        print(shoppingList)
        shoppingList.append("Pig")
        print("The shoppingList contains \(shoppingList) items")
        shoppingList.isEmpty ? print("The shopping list is empty"):print("The shopping list isn't empty")
        shoppingList += ["Dogs"]
        print(shoppingList)
        print(shoppingList[0])
        shoppingList[0...1] = ["Man","Woman"]
        print(shoppingList)
        shoppingList.insert("Michal", atIndex: 0)
        print(shoppingList)
        let name = shoppingList.removeAtIndex(0)
        print(name)
        let dogs = shoppingList.removeLast()
        print(dogs)
        
        for(index, value) in shoppingList.enumerate() {
            print("Item \(String(index + 1)): \(value)")
            
        }
        
        //集合(Set)用来存储相同类型并且没有确定顺序的值
        
        var letters = Set<Character>()
        letters.insert("A")
        print("letters:\(letters)")
        //var favouriate: Set<String> = ["A","B","C"]
        var favouriate: Set = ["A","B","C","D"]
        print(favouriate)
        print("I have \(favouriate.count) favorite music genres.")
        print(favouriate.remove("A"))
        print(favouriate.contains("B"))
        
        for gerner in favouriate {
            print("\(gerner)\t")
            
        }
        for gerner in favouriate.sort() {
            print("\(gerner)\t")
        }
        
        
        let addDigits: Set = [1,2,3,5,7,9]
        let evenDigits: Set = [0,2,4,6,8]
        print(addDigits.union(evenDigits).sort())
        print(addDigits.intersect(evenDigits).sort())
        print(addDigits.subtract(evenDigits).sort())
        print(addDigits.exclusiveOr(evenDigits).sort())
        
        
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        
        print(houseAnimals.isSubsetOf(farmAnimals))
        print(farmAnimals.isSubsetOf(houseAnimals))
        print(farmAnimals.isDisjointWith(cityAnimals))
        
        var namesOfIntegers = [Int: String]()
        
        print(namesOfIntegers)
        
        var dic: [String: String] = [:]
        print(dic)
        namesOfIntegers[16] = "Name"
        namesOfIntegers = [:]
        print(namesOfIntegers)
        var airports = ["Name": "flc", "age": "24"]
        print(airports)
        dic["LHR"] = "London"
        print(dic)
        dic["LHR"] = nil
        print(dic)
        let removedValued = airports.removeValueForKey("Name")
        print(airports)
        
        //遍历字典
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
            
        }
        
        for airportCode in airports.keys {
            print("\(airportCode)")
            
        }
        for airportName in airports.values {
            print("\(airportName)")
            
        }
        
//        while (true) {
//            print("NO NO NO")
//            
//        }
        
        let finalSquare = 25
        var board = [Int](count: finalSquare + 1, repeatedValue: 0)
        
        
        
        if #available(iOS 9, OSX 10.10, *) {
            // 在 iOS 使用 iOS 9 APIs , 并且在 OS X 使用 OS X v10.10 APIs
        } else {
            // 回滚至早前 iOS and OS X 的API
        }
        
    }
    
    func switichBreak() {
        let numberSymbol: Character = "三"  // 简体中文里的数字 3
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
        }
        if let integerValue = possibleIntegerValue {
            print("The integer value of \(numberSymbol) is \(integerValue).")
        } else {
            print("An integer value could not be found for \(numberSymbol).")
        }
    }
    
    
    func switchFallthrough() {
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

