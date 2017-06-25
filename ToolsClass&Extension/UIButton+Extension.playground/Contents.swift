//: Playground - noun: a place where people can play

import UIKit

import UIKit


fileprivate var key: Void?
func createImageWithColor(_ color: UIColor) -> UIImage? {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let theImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return theImage
}

extension UIButton {
    
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &key) as? UIColor
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &key) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layer.borderWidth = borderWidth ?? 0
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &key) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layer.cornerRadius = cornerRadius ?? 0
            layer.masksToBounds = cornerRadius != 0
        }
    }
    
    
    @IBInspectable var normalColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &key) as? UIColor
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            setBackGroundColor(normalColor ?? UIColor.white, state: UIControlState())
        }
    }
    
    @IBInspectable var highlightedColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &key) as? UIColor
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            setBackGroundColor(highlightedColor ?? UIColor.lightGray, state: .highlighted)
        }
    }
    
    fileprivate func setBackGroundColor(_ backGroundColor: UIColor, state: UIControlState) {
        let image = createImageWithColor(backGroundColor)
        setBackgroundImage(image, for: state)
    }
    
    
}