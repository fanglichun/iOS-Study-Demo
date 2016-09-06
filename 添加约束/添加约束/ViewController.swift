//
//  ViewController.swift
//  添加约束
//
//  Created by mfang032 on 12/25/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var subView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        subView = UIView()
        subView.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(subView)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {
       // self.view.addEdgeConstraints(Subview: subView, Top: 100, Left: 20, Bottom: -300, Right: -20)
        self.view.addSizeConstraints(SubView: subView, Width: 0, Height: 0, CenterX: 0, CenterY: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

