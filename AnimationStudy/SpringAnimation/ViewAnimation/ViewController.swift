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
        username.center.y -= 5
        password.center.x -= self.view.bounds.width
        password.center.y -= 5
        
        self.cloud1.alpha = 0.0
        self.cloud2.alpha = 0.0
        self.cloud3.alpha = 0.0
        self.cloud4.alpha = 0.0
        
        loginButton.center.y += 100
        loginButton.alpha = 0.0
        
        
        

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
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: [.CurveEaseOut], animations: {
            self.password.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: [], animations: {
            self.cloud1.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.7, options: [], animations: {
            self.cloud2.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.9, options: [], animations: {
            self.cloud3.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 1.1, options: [], animations: {
            self.cloud4.alpha = 1.0
            }, completion: nil)
        
        //spring animation
//        UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: { 
//            self.loginButton.alpha = 1
//            self.loginButton.center.y -= 100
//            }, completion: nil)
        
//        UIView.animateWithDuration(3.0, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.0, options: [], animations: {
//            self.loginButton.alpha = 1
//            self.loginButton.center.y -= 100
//            }, completion: nil)
        
//        UIView.animateWithDuration(3.0, delay: 0.5, usingSpringWithDamping: 0.01, initialSpringVelocity: 0.1, options: [], animations: {
//            self.loginButton.alpha = 1
//            self.loginButton.center.y -= 100
//            self.loginButton.bounds.size.width += 15
//            }, completion: nil)
        
        UIView.animateWithDuration(0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.center.y -= 100
            self.loginButton.alpha = 1.0
            self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: [.Repeat], animations: {
            self.username.center.y += 5
            self.password.center.y += 5
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: [], animations: { 
            
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login() {
        self.spinner.center = CGPointMake(40.0, self.loginButton.frame.size.height/2)
        self.spinner.alpha = 1
    }


}

