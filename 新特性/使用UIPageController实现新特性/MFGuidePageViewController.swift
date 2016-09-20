//
//  MFGuidePageViewController.swift
//  使用UIPageController实现新特性
//
//  Created by flc on 16/9/19.
//  Copyright © 2016年 flc. All rights reserved.
//

import UIKit

class MFGuidePageViewController: UIPageViewController {
    
    //as callback when page number has a change
    var pageViewControllerUpdatePageCount: ( (MFGuidePageViewController, NSInteger ) ->Void)?
    //as callback when page index has a change
    var pageViewControllerUpdatePageIndex: ( (MFGuidePageViewController, NSInteger ) ->Void)?
    
    private(set) lazy var allViewControllers:[UIViewController] = {
        return [MFGuideImageViewController(imgName: "start1Background",frame: self.view.bounds, showBtn:true),
                MFGuideImageViewController(imgName: "start2Background",frame: self.view.bounds, showBtn:true),
                MFGuideImageViewController(imgName: "start3Background",frame: self.view.bounds,showBtn:true)]
    }()
    
    init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : AnyObject]?, pageCount:((MFGuidePageViewController,NSInteger)->Void)?, pageIndex:((MFGuidePageViewController,NSInteger)->Void)?) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        self.pageViewControllerUpdatePageCount = pageCount
        self.pageViewControllerUpdatePageIndex = pageIndex
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        delegate = self
        //setup home
        if let firstViewController = viewControllers?.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        pageViewControllerUpdatePageCount?(self, viewControllers?.count ?? 0)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



extension MFGuidePageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let firstViewController = viewControllers?.first, let index = viewControllers?.index(of: firstViewController) {
            pageViewControllerUpdatePageIndex?(self, index)
        }
    }
}

extension MFGuidePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllers?.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard let count = viewControllers?.count else {
            return nil
        }
        guard count > previousIndex else {
            return nil
        }
        return viewControllers?[previousIndex]
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllers?.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = allViewControllers.count
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return viewControllers?[nextIndex]
    }
    

    

}
