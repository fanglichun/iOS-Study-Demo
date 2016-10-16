//
//  ViewController.swift
//  InitialWay
//
//  Created by flc on 16/10/16.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    func action() {
        print("Bing!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        
        let mySwitch : UISwitch = {
            view.addSubview($0)
            $0.addTarget(self, action: #selector(ViewController.action), for: .touchUpInside)
            return $0
        }(UISwitch())
        
        let label : UILabel = {
            view.addSubview($0)
            $0.text = "Toggle me"
            $0.font = UIFont.boldSystemFont(ofSize: 36)
            return $0
        }(UILabel())
        
        mySwitch.frame = CGRect(x: (view.frame.size.width - 100) / 2, y: (view.frame.size.height - 40) / 2, width: 100, height: 40)
        print(label)
        print(mySwitch)
    }
}




