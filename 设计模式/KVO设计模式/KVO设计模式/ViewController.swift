//
//  ViewController.swift
//  KVO设计模式
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var desclabel: UILabel!
    
    var label: UILabel = UILabel()
    
    
//    lazy var walker: Walker =  {
//        let walker = Walker("Michael", 25)
//        return walker
//    }()
    
    var walker = Walker("Michael fang", 27)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        desclabel.text = "\(walker.name)的年龄是: \(walker.age)"
        label.textColor = UIColor.black
        view.addSubview(label)
        
        
        self.walker.addObserver(self, forKeyPath: "age", options: NSKeyValueObservingOptions.new, context: nil)
        //self.label .addObserver(self, forKeyPath: "textColor", options: NSKeyValueObservingOptions.new, context: nil)
        
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "age", context: nil)
    }

    @IBAction func updateAgeAction(_ sender: UIButton) {
        self.walker.age += 1
        
        self.label.textColor = UIColor.orange
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
//        if keyPath == "textColor" {
//            print(label.textColor)
//        }
        
        if keyPath == "age" && object as! Walker == walker {
            desclabel.text = "\(walker.name)的年龄是: \(walker.age)"
        }
        
    }


}

