//: Playground - noun: a place where people can play

import UIKit

extension UIColor {
    
    convenience init(hex: UInt32) {
        let divisor = Float(255)
        let red = Float(hex & 0xff0000 >> 16)/divisor
        let green = Float(hex & 0xff0000 >> 8)/divisor
        let blue = Float(hex & 0xff0000)/divisor
        self.init(colorLiteralRed: red, green: green, blue: blue, alpha: 1)
    }
    
}

public protocol ColorPalette {
    
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    
}

struct WhiteBoardPalette: ColorPalette {
    
    public var backgroundColor: UIColor {
        get {
            return UIColor.white
        }
    }
    
    public var textColor: UIColor {
        get {
            return UIColor.black
        }
    }
}


struct BlackBoardPalette: ColorPalette {
    
    public var backgroundColor: UIColor {
        get {
            return UIColor.black
        }
    }
    
    public var textColor: UIColor {
        get {
            return UIColor.white
        }
    }
}

struct MilkCoffeeBoardPalette: ColorPalette {
    
    public var backgroundColor: UIColor {
        get {
            return UIColor.brown
        }
    }
    
    public var textColor: UIColor {
        get {
            return UIColor.white
        }
    }
}

struct NightSwimmingBoardPalette: ColorPalette {
    
    public var backgroundColor: UIColor {
        get {
            return UIColor.black
        }
    }
    
    public var textColor: UIColor {
        get {
            return UIColor.lightGray
        }
    }
}

public enum ColorTheme {
    case whiteboard
    case blackboard
    case milkCoffee
    case nightSwimming
}

func makePalette(theme: ColorTheme) ->ColorPalette {
    switch theme {
    case .whiteboard:
        return WhiteBoardPalette()
    case .blackboard:
        return BlackBoardPalette()
    case .milkCoffee:
        return MilkCoffeeBoardPalette()
    case .nightSwimming:
        return NightSwimmingBoardPalette()
    }
}

public class PaletteFactory {
    public class func makePalette(theme: ColorTheme) ->ColorPalette {
        switch theme {
        case .whiteboard:
            return WhiteBoardPalette()
        case .blackboard:
            return BlackBoardPalette()
        case .milkCoffee:
            return MilkCoffeeBoardPalette()
        case .nightSwimming:
            return NightSwimmingBoardPalette()
        }
    }
}

let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 600, height: 44)))

let whiteBoardPalette = PaletteFactory.makePalette(theme: .whiteboard)
label.backgroundColor  = whiteBoardPalette.backgroundColor
label.textColor = whiteBoardPalette.textColor
label.text = "white Board Palette"

let blackBoardPalette = PaletteFactory.makePalette(theme: .blackboard)
label.backgroundColor  = whiteBoardPalette.backgroundColor
label.textColor = whiteBoardPalette.textColor
label.text = "black Board Palette"













