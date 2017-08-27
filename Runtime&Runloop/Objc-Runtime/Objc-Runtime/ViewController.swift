//
//  ViewController.swift
//  Objc-Runtime
//
//  Created by mfang032 on 2017/8/20.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        functionA()
        // Do any additional setup after loading the view, typically from a nib.
        let p1 = Person(name: "Michael", age: 27)
        print("p1: \(p1?.name ?? ""), age: \(p1?.age ?? 0)")
        
        
        let p2 = Person.initWithName("Bob", age: 25)
        print("p1: \(p2?.name ?? ""), age: \(p2?.age ?? 0)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func functionA() {
        let before = "before exchange"
        print(before)
    }
    
    @objc private func functionB() {
        let after = "after exchange"
        print(after)
    }
    
    
}

