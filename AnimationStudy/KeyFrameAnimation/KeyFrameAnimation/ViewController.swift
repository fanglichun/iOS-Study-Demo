//
//  ViewController.swift
//  KeyFrameAnimation
//
//  Created by mfang032 on 5/3/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        // function 1
        //        UIView.animateWithDuration(0.5, animations: {
        //            self.headImageView.center.x += 200.0
        //            }) { (_) in
        //                UIView.animateWithDuration(0.5, animations: {
        //                    self.headImageView.center.y += 100.0
        //
        //                    }, completion: { (_) in
        //                      UIView.animateWithDuration(0.5, animations: {
        //
        //                        }, completion: { (_) in
        //                            UIView.animateWithDuration(0.5, animations: {
        //                                self.headImageView.center.x -= 200.0
        //
        //                                }, completion: { (_) in
        //                                    self.headImageView.center.y -= 100
        //                            })
        //                      })
        //                })
        //        }
        // function 2
        //        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
        //            self.headImageView.center.x += 80.0
        //            self.headImageView.center.y -= 10.0
        //            }) { (_) in
        //
        //        }
        // function 3
        UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.25, animations: {
            self.headImageView.center.x += 80.0
            self.headImageView.center.y -= 10.0
        })
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

