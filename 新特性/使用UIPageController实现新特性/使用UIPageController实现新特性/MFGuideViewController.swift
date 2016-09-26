//
//  MFGuideViewController.swift
//  使用UIPageController实现新特性
//
//  Created by flc on 16/9/20.
//  Copyright © 2016年 flc. All rights reserved.
//

import UIKit

class MFGuideViewController: UIViewController {
    
    private(set) lazy var pageControl: UIPageControl = {
        let rect = CGRect(x: (self.view.bounds.width - 200) / 2, y: self.view.bounds.height - 50, width: 200, height: 20)
        let pageControl = UIPageControl(frame: rect)
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.addTarget(self, action: #selector(nextGuideImagePage(pageControl:)), for: .valueChanged)
        return pageControl
    }()
    
    var updateRootVCCallback: ( ()-> Void)?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(removeGuidePageView), name: NSNotification.Name(rawValue: "beginExperience"), object: nil)
        view.backgroundColor = UIColor.white
        view.addSubview(pageControl)
        loadGuidePageView()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    dynamic private func removeGuidePageView() {
       view.removeFromSuperview()
        self.removeFromParentViewController()
        updateRootVCCallback?()
    }
    
    dynamic private func nextGuideImagePage(pageControl: UIPageControl) {
        
    }
    
    
    private func loadGuidePageView() {
        let guideViewController = MFGuidePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil, pageCount: { (guide:MFGuidePageViewController, count: NSInteger) in
            self.pageControl.numberOfPages = count
        }) { (guide: MFGuidePageViewController, index: NSInteger) in
                self.pageControl.currentPage = index
        }
        
        guideViewController.view.frame = view.bounds
        view.addSubview(guideViewController.view)
        addChildViewController(guideViewController)
        view.bringSubview(toFront: pageControl)
        
    }
    
}
