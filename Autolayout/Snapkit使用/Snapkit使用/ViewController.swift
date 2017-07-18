//
//  ViewController.swift
//  Snapkit使用
//
//  Created by mfang032 on 2017/6/25.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(PhotoCell.self, forCellReuseIdentifier: "PhotoCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as? PhotoCell
        if (cell == nil) {
            cell = PhotoCell(style: .default, reuseIdentifier: "PhotoCell")
        }
        cell?.photoTitleLabel.text = "Michael"
        cell?.photoDateLabel.text = "\(Date())"
        print(memoryUtil.address(&cell))
        return cell!
    }
}

