//
//  ViewController.swift
//  SwiftBasic
//
//  Created by mfang032 on 10/21/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

typealias AudioSample = UInt16




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(f)
        let possibleNumber = "123"
        let convertedNum = Int(possibleNumber)
        print(convertedNum)
        //如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为nil
        //在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
        var serverResponseCode: Int?
        print(serverResponseCode)
        
        let i = 1
        if i == 1 {
            print("The value is \(i)")
        }
        var friendlyWelcome = "Hello!"
        friendlyWelcome = "Bonjour!"
        
        print(friendlyWelcome)
        print("The current of  is \(friendlyWelcome)")
        
        let cat = "🐱"; print(cat)
       // let cannotBeNagative: UInt8 = -1
        
//        let tooBig : Int8 = Int8.max + 1
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let turnipsAreDelicious = true
        if turnipsAreDelicious {
            print("hello")
        } else {
           // print("not good")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func f () {
            let http404Error = (404,"Not Error")
        print(http404Error)
        
        let (statusCode, statusMessage) = http404Error
        print("The status code is \(statusCode)")
        // 输出 "The status code is 404"
        print("The status message is \(statusMessage)")
        // 输出 "The status message is Not Found"
    }
    
    func  optionalAndNotOptional() {
    let possibleString: String? = "An optional string."
    let forcedString: String = possibleString! // 需要惊叹号来获取值
    print(forcedString)
    let assumedString: String! = "An implicitly unwrapped optional string."
    let implicitString: String = assumedString  // 不需要感叹号
        print(implicitString)
    }
  


}

