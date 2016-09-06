//
//  AnotherViewController.swift
//  代理传值
//
//  Created by mfang032 on 11/1/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

typealias updateViewBackgroundColorBlock = (backColor: UIColor) -> ()
enum EncryptionError: ErrorType {
    case Empty
    case Short
}

protocol AnotherViewControllerDelegate {
    func updateViewColor(color: UIColor)
    
}
class AnotherViewController: UIViewController {

    
    @IBOutlet weak var redView: UIView!
    var delegate: AnotherViewControllerDelegate?
    @IBAction func back(sender: AnyObject) {
        
        if (self.updateViewColorBlock != nil) {
            self.updateViewColorBlock?(backColor: UIColor.yellowColor())
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    var updateViewColorBlock: updateViewBackgroundColorBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let encrypted = encryptString("secret information!", withPassword: "12345")
        do {
            let encrypted = try encryptString("secret information!", withPassword: "")
            print(encrypted)
        } catch EncryptionError.Empty {
            print("You must provide a password.")
        } catch EncryptionError.Short {
            print("Passwords must be at least five characters, preferably eight or more.")
        } catch {
            print("Something went wrong!")
        }

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let delegate = self.delegate {
            delegate.updateViewColor(self.redView.backgroundColor!)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func encryptString(str: String, withPassword password: String) -> String {
        
        // complicated encryption goes here
        let encrypted = password + str + password
        return String(encrypted.characters.reverse())
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
