//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by mfang032 on 1/23/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    let kDetailedViewControllerID = "DetailView"
    let kCellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func  numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail"
        let selectedIndexPath = self.collectionView?.indexPathsForSelectedItems()[0]
        
    }
 
}

