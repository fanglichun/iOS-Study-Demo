//
//  ViewController.swift
//  ContainerViewChangeDifferentControllerView
//
//  Created by mfang032 on 16/10/14.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeContainerView: UIView!
    
    @IBOutlet weak var expenseContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeContainerView.isHidden = false
        expenseContainerView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchTimeExpenseState(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            timeContainerView.isHidden = false
            expenseContainerView.isHidden = true
        default:
            timeContainerView.isHidden = true
            expenseContainerView.isHidden = false
        }
    }
}

