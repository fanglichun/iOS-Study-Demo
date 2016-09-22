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
    //as callback when pageControl responsed to clicking event 
    var currentPageCallback: ( (MFGuidePageViewController, NSInteger) ->Void)?
    
    private(set) lazy var allViewControllers:[UIViewController] = {
        return [MFGuideImageViewController(imgName: "start1Background",frame: self.view.bounds, showBtn:false),
                MFGuideImageViewController(imgName: "start2Background",frame: self.view.bounds, showBtn:false),
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
        if let firstViewController = allViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        pageViewControllerUpdatePageCount?(self, allViewControllers.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



extension MFGuidePageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let firstViewController = viewControllers?.first, let index = allViewControllers.index(of: firstViewController) {
            pageViewControllerUpdatePageIndex?(self, index)
        }
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        print(pendingViewControllers.count)

    }
}

extension MFGuidePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard allViewControllers.count > previousIndex else {
            return nil
        }
        return allViewControllers[previousIndex]
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.index(of: viewController) else {
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
        return allViewControllers[nextIndex]
    }
}
