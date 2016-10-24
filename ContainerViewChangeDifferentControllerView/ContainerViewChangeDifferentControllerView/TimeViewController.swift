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
    
    weak var delegate: SwitchTypeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configTableView()
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    dynamic fileprivate func  typeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            delegate?.switchToTimeViewController?()
        } else {
            delegate?.switchToExpenseViewController?()
        }
        tableView.reloadData()
    }
}

fileprivate extension TimeViewController {
    
    func configTableView() {
        var nib = UINib(nibName: "TimeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TimeTableViewCell")
        nib = UINib(nibName: "SegmentControlTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SegmentControlTableViewCell")
        tableView.estimatedRowHeight = 44
    }
    
    
    
}

extension TimeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath) as! TimeTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.orange
        return cell
    }
}

extension TimeViewController: UITableViewDelegate {
    
}
