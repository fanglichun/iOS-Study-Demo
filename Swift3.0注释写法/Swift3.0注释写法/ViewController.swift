//
//  ViewController.swift
//  Swift3.0注释写法
//
//  Created by flc on 16/9/24.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: -setter & getter
    var value: Double {
        get {//get方法在读值的时候调用
            return  (NumberFormatter().number(from: "1234")?.doubleValue)!
        }
        set {//set方法在赋值的时候调用
        }
    }
    
    //FIXME: fix load data bug
    private func laodData() {
    }
    
    //TODO: reload data
    private func reloadData() {
        
    }


}

