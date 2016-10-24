//
//  MFResumeViewController.swift
//  DelegateChangeDifferentViewControllers
//
//  Created by mfang032 on 16/10/21.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class MFResumeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: MFSwitchProfileTypeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "MFSwitchProfileTypeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MFSwitchProfileTypeTableViewCell")
        let headerView = UIView()
        headerView.backgroundColor = UIColor.blue
        tableView.tableHeaderView = headerView
        navigationController?.navigationBar.isTranslucent = false
    }
    
    deinit {
        print("denit")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("call viewWillAppear")
    }
    
    dynamic fileprivate func switchProfileType(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        switch sender.selectedSegmentIndex {
        case 0:
            break
        case 1:
            delegate?.switchProfileType(.preference)
//            sender.selectedSegmentIndex = 1
        default:
            delegate?.switchProfileType(.roleReadiness)
//            sender.selectedSegmentIndex = 2
        }
        sender.selectedSegmentIndex = 0
    }
}


extension MFResumeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MFSwitchProfileTypeTableViewCell") as! MFSwitchProfileTypeTableViewCell
            cell.segmentControl.addTarget(self, action: #selector(switchProfileType(_:)), for: .valueChanged)
            cell.segmentControl.selectedSegmentIndex = 0
            return cell

        default:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.red
            return cell
        }
    }
}
