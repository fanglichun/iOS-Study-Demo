//
//  MFPreferenceViewController.swift
//  DelegateChangeDifferentViewControllers
//
//  Created by mfang032 on 16/10/21.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class MFPreferenceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak  var delegate: MFSwitchProfileTypeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "MFSwitchProfileTypeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MFSwitchProfileTypeTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    dynamic fileprivate func switchProfileType(_ sender: UISegmentedControl) {
//        delegate?.switchProfileType(.preference)
        switch sender.selectedSegmentIndex {
        case 0:
            delegate?.switchProfileType(.resume)
//            sender.selectedSegmentIndex = 0
        case 1:
            delegate?.switchProfileType(.preference)
//            sender.selectedSegmentIndex = 1
        default:
            delegate?.switchProfileType(.roleReadiness)
//            sender.selectedSegmentIndex = 2
        }
//        sender.selectedSegmentIndex = 1
    }

}

extension MFPreferenceViewController: UITableViewDataSource {
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
            cell.segmentControl.selectedSegmentIndex = 1
            return cell
            
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.blue
            return cell        }
    }
}

