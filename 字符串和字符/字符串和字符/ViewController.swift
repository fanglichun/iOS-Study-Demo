//
//  ViewController.swift
//  字符串和字符
//
//  Created by mfang032 on 10/23/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //init empty string
//        let emptyStr = ""
//        let anotheremptyStr = String()
//        
//        print("emptyStr:\(emptyStr)\nanotherEmptyStr:\(anotheremptyStr)")
//        emptyStr.isEmpty ? print("It is empty str"):print("It isn't empty str")
//        var varStr = "Horse"
//        varStr += " and dog"
//        print(varStr)
//        for character in "DogPigDonkey".characters {
//            print(character)
//            
//        }
//        
//        let characters: [Character] = ["C", "a", "t", "!", "🐱"]
//        let catString = String(characters)
//        print(catString)
//        //连接字符串
//        let str1 = "PM"
//        let str2 = "AM"
//        let welcome = str1 + str2
//        print(welcome)
        let greeting = "MY name is FangLichun"
        print(greeting)
        print(greeting[greeting.endIndex.predecessor()])
        for index in greeting.characters.indices {
            print("\(greeting[index])", terminator: "")
            
        }
        print("\n")
        
        let dogString = "Dog‼🐶"
        for codeUnit in dogString.utf16 {
            print("\(codeUnit)",terminator:" ")
            
        }
        print("\n")

        for scalar in dogString .unicodeScalars {
            print("\(scalar.value) ", terminator:" ")
            
        }
        print("\n")

        var somsOne = [Int]()
        print("somsOne count:\(somsOne.count)")
        
        
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

