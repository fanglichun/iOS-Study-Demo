//
//  NextViewController.swift
//  RxSwift&&MVVM
//
//  Created by mfang032 on 2017/4/5.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func jump(sender: AnyObject) {
        let thirdVC = ThirdViewController()
        
        self.present(thirdVC, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func dismiss(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}
