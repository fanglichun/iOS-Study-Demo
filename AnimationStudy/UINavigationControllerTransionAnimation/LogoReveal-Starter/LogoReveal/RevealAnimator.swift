//
//  RevealAnimator.swift
//  LogoReveal
//
//  Created by mfang032 on 16/9/6.
//  Copyright © 2016年 Razeware LLC. All rights reserved.
//

import UIKit

class RevealAnimator: NSObject {
    
    let animationduration = 2.0
    var operation: UINavigationControllerOperation = .Push
    weak var storedContext: UIViewControllerContextTransitioning?
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if let context = storedContext {
            context.completeTransition(!context.transitionWasCancelled())
            //reset logo
            let fromVC = context.viewControllerForKey(UITransitionContextFromViewControllerKey) as? MasterViewController
            
            fromVC?.logo.removeAllAnimations()
        }
        storedContext = nil
    }
}

extension RevealAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animationduration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        storedContext = transitionContext
        if operation == .Push {
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! MasterViewController
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! DetailViewController
            transitionContext.containerView()?.addSubview(toVC.view)
            
            let transform = CABasicAnimation(keyPath: "transform")
            transform.fromValue = NSValue(CATransform3D: CATransform3DIdentity)
            let translation = CATransform3DMakeTranslation(0.0, -10.0, 0.0)
            let scale = CATransform3DMakeScale(150.0, 150.0, 1.0)
            transform.toValue = NSValue(CATransform3D: CATransform3DConcat(translation, scale))
            transform.duration = animationduration
            transform.delegate = self
            transform.fillMode = kCAFillModeForwards
            transform.removedOnCompletion = false
            transform.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            toVC.maskLayer.addAnimation(transform, forKey: nil)
            fromVC.logo.addAnimation(transform, forKey: nil)
            
            let fadeIn = CABasicAnimation(keyPath: "opacity")
            fadeIn.duration = animationduration
            fadeIn.fromValue = 1.0
            fadeIn.toValue = 0.0
            toVC.view.layer.addAnimation(fadeIn, forKey: nil)
        } else {
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
            transitionContext.containerView()?.insertSubview(toView, belowSubview: fromView)
            UIView.animateWithDuration(animationduration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                fromView.transform = CGAffineTransformMakeScale(0.01, 0.01)
                }, completion: { (_) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        }
    }
}

extension RevealAnimator: UIViewControllerInteractiveTransitioning {
    
    func startInteractiveTransition(transitionContext: UIViewControllerContextTransitioning) {
        
    }
}




