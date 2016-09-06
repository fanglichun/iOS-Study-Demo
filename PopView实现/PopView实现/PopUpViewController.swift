//
//  PopUpViewController.swift
//  PopView实现
//
//  Created by mfang032 on 4/23/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

let reuseIdentifier = "ShareWayCollectionViewCell"

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tapGestureRecognizer: UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopUpViewController.dismissController))
        return tap
    }
    
    var imagedataSource: Array<String> {
        let imageArr:Array<String> = ["facebook", "linkedin", "twitter", "wechat", "weibo"]
        return imageArr
    }
    var wayNameDataSource: Array<String> {
        let nameArr:Array<String> = ["Facebook", "LinkedIn", "Twitter", "Wechat", "Weibo"]
        return nameArr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7)

        view.addGestureRecognizer(tapGestureRecognizer)

        self.collectionView.registerNib(UINib(nibName: "ShareWayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal//设置垂直显示
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 30, 0, 30)//设置边距
        self.collectionView.collectionViewLayout = flowLayout
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("denit")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissController() {
        self.dismissViewControllerAnimated(true) { [weak self] in
            self?.view.removeGestureRecognizer((self?.tapGestureRecognizer)!)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension PopUpViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = self.collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? ShareWayCollectionViewCell
        if cell == nil {
            cell = ShareWayCollectionViewCell()
        }
        cell?.populateData(wayName: wayNameDataSource[indexPath.row], wayImageName: imagedataSource[indexPath.item])
        return cell!
    }
    
    //实现UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //        某个Cell被选择的事件处理
        self.dismissViewControllerAnimated(true, completion: nil)
        switch indexPath.row {
        case 0:
            break
        default:
            break
        }
        print(indexPath.row)
    }
    
}

extension PopUpViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 115, height: 127)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 45
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 45
    }
    
    
}
