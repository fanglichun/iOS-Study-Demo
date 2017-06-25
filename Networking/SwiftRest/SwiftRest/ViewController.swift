//
//  ViewController.swift
//  SwiftRest
//
//  Created by mfang032 on 2017/6/23.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    fileprivate struct ReuseIdentifier {
        static let cell = "cell"
    }
    
    var tableView: UITableView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if isLandscape {
                tableView?.snp.makeConstraints({ (make) in
                    make.leadingMargin.equalTo(self.view)
                    make.trailingMargin.equalTo(self.view)
                })
            } else {
                tableView?.snp.makeConstraints({ (make) in
                    make.leadingMargin.equalTo(self.view)
                    make.trailingMargin.equalTo(self.view)
                })
            }
        }
    }


}

fileprivate extension ViewController {
    
    
    func configSubViews() {
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        addConstraintsForSubviews()
        
        //register cell for tableView
        tableView?.register(TableViewCell.self, forCellReuseIdentifier: ReuseIdentifier.cell)
    }
    
    func addConstraintsForSubviews() {
        if let tableView = tableView {
            tableView.snp.makeConstraints({ (make) in
                make.leading.equalTo(self.view)
                make.trailing.equalTo(self.view)
                make.top.equalTo(self.view)
                make.bottom.equalTo(self.view)
            })
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var  cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.cell)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ReuseIdentifier.cell)
        }
        cell?.textLabel?.text = "Michael" + "\(indexPath.row)"
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    
    
}
