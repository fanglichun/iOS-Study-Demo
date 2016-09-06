//
//  ViewController.swift
//  PopOverController1
//
//  Created by mfang032 on 16/5/14.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    lazy var availablePopVC: UIPopoverController = {
        let vc = UIViewController()
        let nav = UINavigationController(rootViewController: vc)
        let popVC = UIPopoverController(contentViewController: nav)
        return popVC
    }()
    
    var popPresentVC: UIPopoverPresentationController?

    
    @IBAction func clickAction(sender: AnyObject) {
//        availablePopVC.popoverContentSize = CGSizeMake(400, 500)
//        availablePopVC.presentPopoverFromRect(CGRectMake(UIScreen.mainScreen().bounds.width/2-200, UIScreen.mainScreen().bounds.height/2-300, 400, 600), inView: self.view, permittedArrowDirections: UIPopoverArrowDirection(), animated: true)
        
        let tableViewController = UITableViewController()
        let nav = UINavigationController(rootViewController: tableViewController)

        tableViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        let popoverPresentationController = nav.popoverPresentationController
        popoverPresentationController?.sourceView = sender as? UIView
        
        presentViewController(nav, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let vc = UIViewController()

        popPresentVC = UIPopoverPresentationController(presentedViewController: vc, presentingViewController: self)
        popPresentVC?.delegate = self
        
//        UIPopoverController
//        UIModalPresentationPopover
//        UIPopoverPresentationController
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func prepareForPopoverPresentation(popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func popoverPresentationController(popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverToRect rect: UnsafeMutablePointer<CGRect>, inView view: AutoreleasingUnsafeMutablePointer<UIView?>) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



