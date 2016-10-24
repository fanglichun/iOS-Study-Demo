//
//  MFViewController.swift
//  DelegateChangeDifferentViewControllers
//
//  Created by mfang032 on 16/10/23.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class MFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let profileVC = MFSwitchProfileTypeViewController(nibName: "MFSwitchProfileTypeViewController", bundle: nil) as MFSwitchProfileTypeViewController
        let nvc = UINavigationController(rootViewController: profileVC)
        self.present(nvc, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
