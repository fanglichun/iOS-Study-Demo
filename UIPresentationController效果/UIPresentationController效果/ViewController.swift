//
//  ViewController.swift
//  UIPresentationController效果
//
//  Created by flc on 16/9/25.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var popButton: UIButton!
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pop(_ sender: UIButton) {
        let contentController = DestinatinViewController()
        contentController.modalPresentationStyle = .popover
        let popPresentationVC = contentController.popoverPresentationController
        popPresentationVC?.sourceView = popButton
        popPresentationVC?.sourceRect = popButton.bounds
        if #available(iOS 9.0, *) {
            popPresentationVC?.canOverlapSourceViewRect = true
        } else {
            // Fallback on earlier versions
        }
        popPresentationVC?.permittedArrowDirections = .any
        popPresentationVC?.delegate = self
        present(contentController, animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        let contentController = DestinatinViewController()
        //1.use UIPopoverController to show pop effect
        /*if UIDevice.current.userInterfaceIdiom == .pad {
         let popVC = UIPopoverController(contentViewController: contentController)
         //            popVC.setContentSize(CGSize(width: 400, height: 500), animated: true)
         popVC.contentSize = CGSize(width: 400, height: 500)
         popVC.present(from: doneBarButtonItem, permittedArrowDirections: .any, animated: true)
         } else {//iPhone
         present(contentController, animated: true, completion: nil)
         }*/
        
        //2.use UIPopoverPresentationController
        contentController.modalPresentationStyle = .popover
        let popPresentationVC = contentController.popoverPresentationController
        popPresentationVC?.barButtonItem = doneBarButtonItem
        popPresentationVC?.sourceView = view
        popPresentationVC?.permittedArrowDirections = .any
        popPresentationVC?.delegate = self
        present(contentController, animated: true, completion: nil)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none //if set style to be none,both iPhone and iPad support pop effect;if set style to be fullScreen,iPad supports pop effect but iPhone only shows present effect
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navController = UINavigationController(rootViewController: controller.presentedViewController)
        //with iPhone device,after presented presentedController,need a action used to return last stage page,so adding a done BarButtonItem,with iPad device,not show the navigationBar
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissAction))
        navController.topViewController?.navigationItem.rightBarButtonItem = doneBarButtonItem
        return navController
    }
    
    dynamic private func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("call")
    }
    
//    func popoverPresentationController(_ popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverTo rect: UnsafeMutablePointer<CGRect>, in view: AutoreleasingUnsafeMutablePointer<UIView>) {
//        popoverPresentationController.sourceRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 600))
//    }
}



