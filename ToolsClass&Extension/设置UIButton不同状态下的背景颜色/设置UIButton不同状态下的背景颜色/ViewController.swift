//
//  ViewController.swift
//  设置UIButton不同状态下的背景颜色
//
//  Created by flc on 16/9/28.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit


private func createImageWithColor(_ frame: CGRect, color: UIColor) -> UIImage?
{
    
    UIGraphicsBeginImageContext(frame.size)
    if let context = UIGraphicsGetCurrentContext() {
        context.setFillColor(color.cgColor)
        context.fill(frame)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }
    return nil
    }


class ViewController: UIViewController {

    @IBOutlet weak var setButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       /* if !setButton.isSelected {
            setButton.layer.cornerRadius = 10
            setButton.layer.masksToBounds =  true
        } else {
            setButton.layer.cornerRadius = 0
            setButton.layer.masksToBounds =  false
        }
        setButton.layer.borderColor = UIColor.gray.cgColor
        
        let normalColor = UIColor.green
        let highlightedColor = UIColor.gray
        setButton.setBackgroundImage(createImageWithColor(setButton.frame, color: normalColor), for: .normal)
        setButton.setBackgroundImage(createImageWithColor(setButton.frame, color: highlightedColor), for: .highlighted)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

