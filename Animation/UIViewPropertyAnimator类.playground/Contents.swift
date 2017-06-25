//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let point1 = CGPoint(x: 0, y: 0)
let point2 = CGPoint(x: 10, y: 0)

let animator = UIViewPropertyAnimator(duration: 0.5, controlPoint1: point1, controlPoint2: point1) { 
    
}

animator.startAnimation()

