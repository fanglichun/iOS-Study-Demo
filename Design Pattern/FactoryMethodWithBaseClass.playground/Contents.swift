//: Playground - noun: a place where people can play


import Foundation
import UIKit

public enum ColorTheme {
    case whiteboard
    case blackboard
    case milkCoffee
    case nightSwimming
}

public class ColorPalette {
    
    fileprivate var backgroundColorInternal: UIColor
    fileprivate var textColorInternal: UIColor
    
    
    final public var backgroundColor: UIColor {
        get {
            return backgroundColorInternal
        }
    }
    final public var textColor: UIColor {
        get {
            return textColorInternal
        }
    }
    
    public init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColorInternal = backgroundColor
        self.textColorInternal = textColor
    }
    
    public class func make(theme: ColorTheme) -> ColorPalette {
        var result: ColorPalette
        switch theme {
        case .blackboard:
            result = BlackBoardPalette()
        case .whiteboard:
            result = WhiteBoardPalette()
        case .milkCoffee:
            result = MilkCoffeeBoardPalette()
        case .nightSwimming:
            result = NightSwimmingBoardPalette()
        }
        return result
    }
}

class WhiteBoardPalette: ColorPalette {
    fileprivate init() {
        super.init(backgroundColor: UIColor.white, textColor: UIColor.black)
    }
}

class BlackBoardPalette: ColorPalette {
    
    fileprivate init() {
        super.init(backgroundColor: UIColor.black, textColor: UIColor.white)
    }
}

class MilkCoffeeBoardPalette: ColorPalette {
    
    fileprivate init() {
        super.init(backgroundColor: UIColor.brown, textColor: UIColor.white)
    }
}

class NightSwimmingBoardPalette: ColorPalette {
    
    fileprivate init() {
        super.init(backgroundColor: UIColor.black, textColor: UIColor.cyan)
    }
}

let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 600, height: 44)))
label.textAlignment = .center

let whiteBoardPalette = WhiteBoardPalette.make(theme: .whiteboard)
label.backgroundColor = whiteBoardPalette.backgroundColor
label.textColor = whiteBoardPalette.textColor
label.text = "white Board Palette"

let blackBoardPalette = BlackBoardPalette.make(theme: .blackboard)
label.backgroundColor = blackBoardPalette.backgroundColor
label.textColor = blackBoardPalette.textColor
label.text = "black Board Palette"





