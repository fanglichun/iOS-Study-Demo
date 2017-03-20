//
//  ViewController.swift
//  选择器
//
//  Created by mfang032 on 11/22/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    var month = [String]()
    var week = [String]()
    
    
    @IBAction func refresh(sender: AnyObject) {
        
        month = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
        week = ["星期一","星期二","星期三","星期四","星期五","星期六","星期天"]
        pickerView.reloadAllComponents()
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated: true)
    }
    
    @IBAction func recovery(sender: AnyObject) {
        
        month = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        week = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        pickerView.reloadAllComponents()
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(8, inComponent: 1, animated: true)
        
    }
    
    @IBAction func print(sender: AnyObject) {
        
//        let monthIndex = self.pickerView.selectedRowInComponent(0)
//        let weekIndex = self.pickerView.selectedRowInComponent(1)
//       
//        print(monthIndex)
//        print(weekIndex)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        month = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        week = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    deinit {
        self.pickerView.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
         return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if 0 == component {
            return month.count
        } else {
            return week.count
        }
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if 0 == component {
            return month[row]
        } else {
            return week[row]
        }
    }
    
    

}

