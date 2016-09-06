//
//  ViewController.swift
//  ViewAnimation
//
//  Created by mfang032 on 4/21/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var heading: UILabel!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var cloud1: UIImageView!
    @IBOutlet var cloud2: UIImageView!
    @IBOutlet var cloud3: UIImageView!
    @IBOutlet var cloud4: UIImageView!
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    let status = UIImageView(image: UIImage(named: "banner"))
    let label = UILabel()
    let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //set up the UI
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
        
        spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.alpha = 0.0
        loginButton.addSubview(spinner)
        
        status.hidden = true
        status.center = loginButton.center
        view.addSubview(status)
        
        label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
        label.font = UIFont(name: "HelveticaNeue", size: 18.0)
        label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
        label.textAlignment = .Center
        status.addSubview(label)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        heading.center.x -= self.view.bounds.width
        username.center.x -= self.view.bounds.width
        password.center.x -= self.view.bounds.width
        self.cloud1.alpha = 0.0
        self.cloud2.alpha = 0.0
        self.cloud3.alpha = 0.0
        self.cloud4.alpha = 0.0

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5) {
            
            self.heading.center.x += self.view.bounds.width
            
        }
        
//        UIView.animateWithDuration(0.5, delay: 0.3, options: [.Repeat, .CurveEaseIn], animations: {
//            self.username.center.x += self.view.bounds.width
//            }, completion: nil)
        
        //if options is empty,default animation type  is CurveEaseInOut
        UIView.animateWithDuration(0.5, delay: 0.3, options: [], animations: {
            self.username.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: [.Repeat, .CurveEaseOut], animations: {
            self.password.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: [.Repeat], animations: {
            self.cloud1.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.7, options: [.Repeat], animations: {
            self.cloud2.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.9, options: [.Repeat], animations: {
            self.cloud3.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 1.1, options: [.Repeat], animations: {
            self.cloud4.alpha = 1.0
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

