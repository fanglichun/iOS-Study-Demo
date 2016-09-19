//
//  YSYGuideViewController.swift
//  AppGuidePage
//
//  Created by flc on 16/9/18.
//  Copyright © 2016年 flc. All rights reserved.
//

import UIKit

func screenSize() -> (width: CGFloat, height: CGFloat) {
    return (UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
}


class YSYGuideViewController: UIViewController {
    
    
    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scrollView.contentSize = CGSize(width: screenSize().width * CGFloat(self.courses.count), height: screenSize().height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        let origin = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 100)
        let size = CGSize(width: 100, height: 30)
        pageControl.frame = CGRect(origin: origin, size: size)
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.numberOfPages = self.courses.count
        pageControl.addTarget(self, action: #selector(pageChanged(pageControl:)), for: .valueChanged)
        return pageControl
    }()
    
    lazy var startButton: UIButton = {
        let btn = UIButton()
        
        btn.frame = CGRect(x: screenSize().width / 2, y: screenSize().height - 160, width: 100, height: 30)
        btn.setTitle("马上体验", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        //btn.setBackgroundImage(UIImage(named: "StartButton"), for: .normal)
        btn.backgroundColor = UIColor.black
        btn.addTarget(self, action: #selector(start), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    let courses = ["swift.png", "scala.png", "java.png"]
    
    @objc private func pageChanged(pageControl: UIPageControl) {
        let currentPage = pageControl.currentPage
        let offsetX = CGFloat(currentPage) * screenSize().width
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    @objc private func start() {
        let mainVC = UINavigationController(rootViewController: UITableViewController())
        navigationController?.present(mainVC, animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index, item) in courses.enumerated() {
            let image = UIImage(named: item)
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: CGFloat(index) * screenSize().width, y: 0, width: screenSize().width, height: screenSize().height)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
        }
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(startButton)
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension YSYGuideViewController: UIScrollViewDelegate {
    
   /* func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        pageControl.currentPage = Int(offset.x / screenSize().width)
        startButton.isHidden = pageControl.currentPage == courses.count - 1
    }*/
 
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        pageControl.currentPage = Int(offset.x / screenSize().width)
        UIView.animate(withDuration: 0.5, animations: { 
            self.startButton.isHidden = !(self.pageControl.currentPage == self.courses.count - 1)
            }, completion: nil)

    }
    
}
