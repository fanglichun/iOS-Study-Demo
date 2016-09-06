//
//  REXCheckButton.swift
//  REX
//
//  Created by appledev028 on 16/3/10.
//  Copyright © 2016年 PwC Inc. All rights reserved.
//

import UIKit

import UIKit

class REXCheckButton: UIButton {
    
    var checkedImageName:String?
    var uncheckedImageName: String?
    
    private var checkedImage:UIImage{
        if let checkedImageNameString = checkedImageName{
            return UIImage(named: checkedImageNameString)!
        }
        return UIImage(named: "checked")!
    }
    
    private var uncheckedImage:UIImage{
        
        if let uncheckedImageNameString = uncheckedImageName{
            return UIImage(named: uncheckedImageNameString)!
            
        }
        return UIImage(named: "unchecked")!
    }
    
    var isChecked:Bool = false{
        didSet{
            
            if isChecked == true{
                setImage(checkedImage, forState: .Normal)
            }else {
                setImage(uncheckedImage, forState: .Normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        settings()
    }
    
    func settings(){
        
        isChecked = false
        addTarget(self, action: "clicked:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func clicked(sender: REXCheckButton){
        
        if sender == self{
            if isChecked == true{
                isChecked = false
            }else {
                isChecked = true
            }
        }
    }
}

