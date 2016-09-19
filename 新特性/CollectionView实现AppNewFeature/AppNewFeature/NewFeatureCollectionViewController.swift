//
//  NewFeatureCollectionViewController.swift
//  AppNewFeature
//
//  Created by flc on 16/9/17.
//  Copyright © 2016年 flc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class NewFeatureCollectionViewController: UICollectionViewController {
    
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.addTarget(self, action: #selector(pageControlChanged(pageControl:)), for: UIControlEvents.valueChanged)
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = UIScreen.main.bounds.size
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10.0
        layout.scrollDirection = .horizontal
        collectionView?.collectionViewLayout = layout
        view?.addSubview(pageControl)
        
        // Register cell classes
        self.collectionView!.register(NewFeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let centerX = collectionView?.center.x
        pageControl.center = CGPoint(x: centerX!, y: UIScreen.main.bounds.size.height - 100)
        pageControl.frame.size = CGSize(width: 300, height: 30)
        
    }
    
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset
        let currentPage = Int(offSet.x / scrollView.frame.size.width)
        pageControl.currentPage = currentPage

    }
    
    @objc private func pageControlChanged(pageControl: UIPageControl)  {
        let currentIndex = pageControl.currentPage
        let offsetX = CGFloat(currentIndex) * UIScreen.main.bounds.size.width
        collectionView?.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewFeatureCell
        // Configure the cell
        cell.index = indexPath.item
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let indexPath = collectionView.indexPathsForVisibleItems.last else { return }
        let cell = collectionView.cellForItem(at: indexPath) as? NewFeatureCell
    }*/
}
