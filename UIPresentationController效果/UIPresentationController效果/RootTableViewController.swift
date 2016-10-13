//
//  RootTableViewController.swift
//  UIPresentationController效果
//
//  Created by mfang032 on 16/10/11.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    @IBOutlet weak var popButton: UIButton!
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.estimatedRowHeight = 44
       
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
    @IBAction func pop2(_ sender: UIButton) {
        let contentController = DestinatinViewController()
        contentController.modalPresentationStyle = .popover
        let popPresentationVC = contentController.popoverPresentationController
        //        popPresentationVC?.barButtonItem = doneBarButtonItem
        popPresentationVC?.sourceView = view
        popPresentationVC?.sourceRect = CGRect(x: (UIScreen.main.bounds.width - 400) / 2, y: (UIScreen.main.bounds.height - 500) / 2, width: 100, height: 100)
        //        popPresentationVC?.permittedArrowDirections = .any
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
        popPresentationVC?.sourceView = view
        popPresentationVC?.sourceRect = CGRect(x: (UIScreen.main.bounds.width - 400) / 2, y: (UIScreen.main.bounds.height - 400) / 2, width: 400, height: 500)
                popPresentationVC?.permittedArrowDirections = .any
        popPresentationVC?.delegate = self
        present(contentController, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftDetail", for: indexPath)
            return cell
        }
       
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




extension RootTableViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .fullScreen //if set style to be none,both iPhone and iPad support pop effect;if set style to be fullScreen,iPad supports pop effect but iPhone only shows present effect
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
