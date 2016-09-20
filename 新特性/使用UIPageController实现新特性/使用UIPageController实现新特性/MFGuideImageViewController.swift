//
//  MFGuideImageViewController.swift
//  使用UIPageController实现新特性
//
//  Created by flc on 16/9/20.
//  Copyright © 2016年 flc. All rights reserved.
//

import UIKit

class MFGuideImageViewController: UIViewController {
    
    private(set) lazy var imageView: UIImageView = {
      return UIImageView(frame: self.view.bounds)
    }()
    
    private(set) lazy var beginBtn: UIButton = {
       return  UIButton(type: .custom)
    }()
    
    init(imgName: String, frame: CGRect, showBtn: Bool) {
        super.init(nibName: nil, bundle: nil)
        view.frame = frame
        view.addSubview(self.imageView)
        imageView.image = UIImage(named: imgName)
        
        beginBtn.frame = CGRect(x: (view.bounds.width - 174) / 2, y: view.bounds.height - 40 - 42, width: 174, height: 42)
        beginBtn.setImage(UIImage(named:"home_btn_startup"), for: .normal)
        beginBtn.addTarget(self, action:#selector(beginBtnClicked), for: .touchUpInside)
        view.addSubview(self.beginBtn)
        beginBtn.isHidden = !showBtn
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        
    }
    
    dynamic private func beginBtnClicked() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "beginExperience"), object: nil)
    }
}
