//
//  TimeViewController.swift
//  ContainerViewChangeDifferentControllerView
//
//  Created by mfang032 on 16/10/14.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configTableView()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

fileprivate extension TimeViewController {
    
    func configTableView() {
        let nib = UINib(nibName: "TimeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TimeTableViewCell")
        tableView.estimatedRowHeight = 44
    }
    
}

extension TimeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

extension TimeViewController: UITableViewDelegate {
    
}
