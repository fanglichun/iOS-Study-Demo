//: Playground - noun: a place where people can play

import UIKit



public class ThemeBuilder {
    
    public var backgroundColor: UIColor
    public var textColor: UIColor
    public var font = UIFont.systemFont(ofSize: 15)
    
    public init() {
        backgroundColor = UIColor.white
        textColor = UIColor.black
    }
    
    
    public var theme: Theme {
        get {
            return Theme(backgroundColor: self.backgroundColor, textColor: self.textColor, font: self.font)
        }
    }
}

public class Theme {
    
    public let backgroundColor: UIColor
    public let textColor: UIColor
    public let font: UIFont
    
    public init(backgroundColor: UIColor, textColor: UIColor, font: UIFont) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.font = font
    }
    
//    public convenience init(backgroundColor: UIColor, textColor: UIColor) {
//        self.init(backgroundColor: backgroundColor, textColor: textColor, font: UIFont.systemFont(ofSize: 15))
//    }
//    public convenience init(backgroundColor: UIColor) {
//        self.init(backgroundColor: backgroundColor, textColor: UIColor.black, font: UIFont.systemFont(ofSize: 15))
//    }
//    
//    public convenience init() {
//        self.init(backgroundColor: UIColor.white)
//    }
}

let defaultTheme = Theme(backgroundColor: UIColor.white, textColor: UIColor.black, font: UIFont.systemFont(ofSize: 15))

let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 888, height: 44)))
label.backgroundColor = defaultTheme.backgroundColor
label.textColor = defaultTheme.textColor
label.font = defaultTheme.font
label.text = "Hello, I am Michael"



//let alertTheme = Theme(backgroundColor: UIColor.white, textColor: UIColor.red, font: .systemFont(ofSize: 15))
//
//
//
//let alertLabel = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 888, height: 44)))
//alertLabel.backgroundColor = alertTheme.backgroundColor
//alertLabel.textColor = alertTheme.textColor
//alertLabel.font = alertTheme.font
//alertLabel.text = "Hello, I am Michael"



let themeBulider = ThemeBuilder()
let defaultTheme2  = themeBulider.theme
label.backgroundColor = defaultTheme2.backgroundColor
label.textColor = defaultTheme2.textColor
label.font = defaultTheme.font
label.text = "Label with default theme"
themeBulider.backgroundColor = UIColor.yellow
let yellowTheme = themeBulider.theme
label.backgroundColor = defaultTheme2.backgroundColor
label.textColor = yellowTheme.textColor
label.font = yellowTheme.font
label.text = "Label with yellow background theme"

