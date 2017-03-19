//
//  ViewController.swift
//  Dynamics
//
//  Created by mfang032 on 2017/1/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var orbitingView: UIView! {
        willSet {
            newValue.layer.cornerRadius = newValue.frame.width/2.0
            newValue.layer.backgroundColor = UIColor.blue.cgColor
        }
    }
    
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    lazy var center: CGPoint = {
       return CGPoint(x: self.view.frame.minX, y: self.view.frame.minY)
    }()
    
    lazy var radialGravity: UIFieldBehavior = {
        let radialGravity: UIFieldBehavior = UIFieldBehavior.radialGravityField(position: self.center)
        radialGravity.region = UIRegion(radius: 300.0)
        radialGravity.strength = 1.5
        radialGravity.falloff = 4.0
        radialGravity.minimumRadius = 50.0
        return radialGravity
        
    }()
    
    lazy var vortex: UIFieldBehavior = {
        let vortex: UIFieldBehavior = UIFieldBehavior.vortexField()
        vortex.position = self.center
        vortex.region = UIRegion(radius: 200.0)
        vortex.strength = 0.005
        return vortex
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let itemBehavior = UIDynamicItemBehavior(items: [orbitingView])
        itemBehavior.density = 0.5
        animator.addBehavior(itemBehavior)
        
        vortex.addItem(orbitingView)
        radialGravity.addItem(orbitingView)
        
        animator.addBehavior(radialGravity)
        animator.addBehavior(vortex)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

