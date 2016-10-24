//
//  MFSwitchProfileTypeViewController.swift
//  DelegateChangeDifferentViewControllers
//
//  Created by mfang032 on 16/10/21.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

protocol MFSwitchProfileTypeViewControllerDelegate: NSObjectProtocol {
    
    func switchProfileType(_ type: MFProfileType)
    
}

class MFSwitchProfileTypeViewController: UIViewController, MFSwitchProfileTypeViewControllerDelegate {
    
    private var currentProfileType: MFProfileType = .resume
    
    lazy var resumeViewController: MFResumeViewController = {
        
        let resumeVC = MFResumeViewController(nibName: "MFResumeViewController", bundle: nil)
        resumeVC.delegate = self
        return resumeVC
    }()
    
    lazy var preferenceViewController: MFPreferenceViewController = {
        let preferenceVC = MFPreferenceViewController(nibName: "MFPreferenceViewController", bundle: nil)
        preferenceVC.delegate = self

        return preferenceVC
    }()
    
    lazy var roleReadinessViewController: MFRoleReadinessViewController = {
        let roleReadinessVC = MFRoleReadinessViewController(nibName: "MFRoleReadinessViewController", bundle: nil)
        roleReadinessVC.delegate = self

        return roleReadinessVC
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addChildViewController(resumeViewController)
        addChildViewController(preferenceViewController)
        addChildViewController(roleReadinessViewController)
        
        
        self.view.addSubview(resumeViewController.view)
        self.view.addSubview(preferenceViewController.view)
        self.view.addSubview(roleReadinessViewController.view)
 
        resumeViewController.view.isHidden = false
        preferenceViewController.view.isHidden = true
        roleReadinessViewController.view.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if currentProfileType == .resume {
            NotificationCenter.default.removeObserver(resumeViewController)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchProfileType(_ type: MFProfileType) {
        switch type {
        case .resume:
            currentProfileType = .resume
            resumeViewController.view.isHidden = false
            preferenceViewController.view.isHidden = true
            roleReadinessViewController.view.isHidden = true
            roleReadinessViewController.tableView.reloadData()
        case .preference:
            currentProfileType = .preference
            resumeViewController.view.isHidden = true
            preferenceViewController.view.isHidden = false
            roleReadinessViewController.view.isHidden = true
            preferenceViewController.tableView.reloadData()
        default:
            currentProfileType = .roleReadiness
            resumeViewController.view.isHidden = true
            preferenceViewController.view.isHidden = true
            roleReadinessViewController.view.isHidden = false
            roleReadinessViewController.tableView.reloadData()
        }
    }
    
}
