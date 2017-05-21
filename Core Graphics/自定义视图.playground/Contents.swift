//: Playground - noun: a place where people can play

import UIKit

class CircleView: UIView {
    
    override func draw(_ rect: CGRect) {
        let lineWidth: CGFloat = 2
        let insetRect = rect.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath(ovalIn: insetRect)
        path.lineWidth = lineWidth
        UIColor.orange.setFill()
        path.fill()
        UIColor.red.setStroke()
        path.stroke()
    }
}

let v1 = CircleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

