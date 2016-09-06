/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

// A delay function
func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}

func tintBackgroundColor(layer: CALayer, toColor: UIColor) {
    let backgroundColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
    backgroundColorAnimation.fromValue  = layer.backgroundColor
    backgroundColorAnimation.toValue = toColor.CGColor
    backgroundColorAnimation.duration = 1.0
    layer.addAnimation(backgroundColorAnimation, forKey: nil)
}

func roundCorners(layer: CALayer, toRadius: CGFloat) {
    let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
    cornerRadiusAnimation.toValue = toRadius
    cornerRadiusAnimation.duration = 0.33
    layer.addAnimation(cornerRadiusAnimation, forKey: nil)
    
    
    layer.addAnimation(cornerRadiusAnimation, forKey: nil)
}

class ViewController: UIViewController {
    
    // MARK: IB outlets
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var heading: UILabel!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var cloud1: UIImageView!
    @IBOutlet var cloud2: UIImageView!
    @IBOutlet var cloud3: UIImageView!
    @IBOutlet var cloud4: UIImageView!
    
    // MARK: further UI
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    let status = UIImageView(image: UIImage(named: "banner"))
    let label = UILabel()
    let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
    
    // MARK: view controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        //    heading.center.x  -= view.bounds.width
        //    username.center.x -= view.bounds.width
        //    password.center.x -= view.bounds.width
        
        let cloudAnimation = CABasicAnimation(keyPath: "opacity")
        cloudAnimation.fillMode = kCAFillModeBackwards
        cloudAnimation.fromValue = 0.0
        cloudAnimation.toValue = 1.0
        cloudAnimation.duration = 0.5
        
        //add animation on cloud1
        cloudAnimation.beginTime = CACurrentMediaTime()  + 0.5
        cloud1.layer.addAnimation(cloudAnimation, forKey: nil)
        
        cloudAnimation.beginTime = CACurrentMediaTime() + 0.7
        cloud2.layer.addAnimation(cloudAnimation, forKey: nil)
        
        cloudAnimation.beginTime = CACurrentMediaTime() + 0.9
        cloud3.layer.addAnimation(cloudAnimation, forKey: nil)
        
        cloudAnimation.beginTime = CACurrentMediaTime() + 1.1
        cloud4.layer.addAnimation(cloudAnimation, forKey: nil)
        
        
        
        
        
        //    cloud1.alpha = 0.0
        //    cloud2.alpha = 0.0
        //    cloud3.alpha = 0.0
        //    cloud4.alpha = 0.0
        
        loginButton.center.y += 30.0
        loginButton.alpha = 0.0
        //    delay(seconds: 5) {
        //        print("where are the fields?")
        //    }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let flyRight = CABasicAnimation(keyPath: "position.x")
        flyRight.beginTime = CACurrentMediaTime() // beginTime为动画绝对开始时间 + 0.3表示delay0.3秒后执行
        flyRight.fillMode = kCAFillModeBoth  //kCAFillModeForwards kCAFillModeBackwards
        flyRight.fromValue = -self.view.bounds.width/2
        flyRight.toValue = self.view.bounds.width/2
        flyRight.duration = 0.5
        heading.layer.addAnimation(flyRight, forKey: nil)
        //keep animation in screen,default is true,represnet removed after execued animation
        //    flyRight.removedOnCompletion = false
        
        //    UIView.animateWithDuration(0.5, animations: {
        //      self.heading.center.x += self.view.bounds.width
        //    })
        
        flyRight.beginTime = CACurrentMediaTime() + 0.3
        username.layer.addAnimation(flyRight, forKey: nil)
        username.layer.position.x = view.bounds.width/2
        //    UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
        //      self.username.center.x += self.view.bounds.width
        //    }, completion: nil)
        
        flyRight.beginTime = CACurrentMediaTime() + 0.4
        password.layer.addAnimation(flyRight, forKey: nil)
        password.layer.position.x = view.bounds.width/2
        //    UIView.animateWithDuration(0.5, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
        //      self.password.center.x += self.view.bounds.width
        //    }, completion: nil)
        
        
        
        /*
         UIView.animateWithDuration(0.5, delay: 0.5, options: [], animations: {
         self.cloud1.alpha = 1.0
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
         */
        
        UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.center.y -= 30.0
            self.loginButton.alpha = 1.0
            }, completion: nil)
        
    }
    
    // MARK: further methods
    
    @IBAction func login() {
        
        UIView.animateWithDuration(1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.bounds.size.width += 80.0
            }, completion: nil)
        
        UIView.animateWithDuration(0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.center.y += 60.0
            self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
            self.spinner.center = CGPoint(x: 40.0, y: self.loginButton.frame.size.height/2)
            self.spinner.alpha = 1.0
            }, completion: { _ in
                //                let tintColor = UIColor.orangeColor()
                let tintColor = UIColor(red: 0.63, green: 0.84, blue: 0.35, alpha: 1.0)
                tintBackgroundColor(self.loginButton.layer, toColor: tintColor)
        })
        
        let tintColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
        tintBackgroundColor(loginButton.layer,
                            toColor: tintColor)
        roundCorners(loginButton.layer, toRadius: 25.0)
    }
    
}

