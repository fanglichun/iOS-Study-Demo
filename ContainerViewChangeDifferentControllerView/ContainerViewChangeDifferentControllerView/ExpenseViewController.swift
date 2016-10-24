//
//  ExpenseViewController.swift
//  ContainerViewChangeDifferentControllerView
//
//  Created by mfang032 on 16/10/14.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
//    weak var delegate: SwitchTypeDelegate?
    
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

}

fileprivate extension ExpenseViewController {
    
    func configTableView() {
        var nib = UINib(nibName: "ExpenseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ExpenseTableViewCell")
        nib = UINib(nibName: "SegmentControlTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SegmentControlTableViewCell")
        tableView.estimatedRowHeight = 44

    }
}

extension ExpenseViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell", for: indexPath) as! ExpenseTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.brown
        return cell
    }
}

extension ExpenseViewController: UITableViewDelegate {
    
}
