//: Playground - noun: a place where people can play

import UIKit

class Apple : NSObject {
    
    var color : String
    
    init(color: String) {
        self.color = color
        super.init()
    }
    
    override convenience init() {
        self.init(color: "Red")
    }
}


class GoldenApple : Apple {
    
    var epic : Bool
    
    init(color: String, epic: Bool) {
        self.epic = epic
        super.init(color: color)
    }
    
    override convenience init(color: String) {
        self.init(color: color, epic: true)
    }
    
    
    convenience init() {
        self.init(color: "Golden")
    }
    
    //this could be also a designated init if i wanted to...
    //init() {
    //    self.epic = true
    //
    //    super.init(color: "Red")
    //}
}

class myViewController: UIViewController {
    
    var example: String
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.example = ""
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
  
    required init?(coder aDecoder: NSCoder) {
        self.example = ""
        super.init(coder: aDecoder)
    }
    
    init() {
        self.example = ""
        super.init(nibName: nil, bundle: nil)
    }
}


class ViewController: UIViewController {
    
    var example : String!
    
//    required convenience init?(coder aDecoder: NSCoder) {
//        self.init(coder: aDecoder)
//    }
//    required convenience init(coder aDecoder: NSCoder) {
//        self.init(aDecoder)
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        self.example = ""
//    }
    
    
    
//    init(_ coder: NSCoder? = nil) {
//        self.example = "Common init example"
//        
//        if let coder = coder {
//            super.init(coder: coder)
//        }
//        else {
//            super.init(nibName: nil, bundle:nil)
//        }
//    }
}

class ChildViewController : ViewController
{
    var name : String
    
    override required init?(coder aDecoder: NSCoder) {
        self.name = ""
        super.init(coder: aDecoder)
    }
    
}



