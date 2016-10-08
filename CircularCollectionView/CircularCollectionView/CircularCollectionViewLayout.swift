//
//  CircularCollectionViewLayout.swift
//  CircularCollectionView
//
//  Created by mfang032 on 16/10/7.
//  Copyright © 2016年 Rounak Jain. All rights reserved.
//

import UIKit

class CircularCollectionViewLayout: UICollectionViewLayout {
  
  var attributesList = [CircularCollectionViewLayoutAttributes]()
  
  let itemSize = CGSize(width: 133, height: 173)
  
  var angleAtExtreme: CGFloat {
    return collectionView!.numberOfItems(inSection: 0) > 0 ?
      -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
  }
  var angle: CGFloat {
    return angleAtExtreme * collectionView!.contentOffset.x / (collectionViewContentSize.width -
      collectionView!.bounds.width)
  }
  
  var radius: CGFloat = 500 {
    didSet {
      invalidateLayout()
    }
  }
  
  var anglePerItem: CGFloat  {
    return atan(itemSize.width / radius)
  }
  
  override var collectionViewContentSize: CGSize {
    return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.width,
                  height: collectionView!.bounds.height)
  }
  
  //The first time the collection view appears on screen, the UICollectionViewLayout method prepareLayout() is called. This method is also called each time the layout is invalidated
  
  override func prepare() {
    super.prepare()
    let centerX = collectionView!.contentOffset.x + (collectionView!.bounds.width / 2.0)
    let anchorPointY = (itemSize.height / 2.0  + radius) / itemSize.height
    // 1
    let theta = atan2(collectionView!.bounds.width / 2.0,
                      radius + (itemSize.height / 2.0) - (collectionView!.bounds.height / 2.0))
    // 2
    var startIndex = 0
    var endIndex = collectionView!.numberOfItems(inSection: 0) - 1
    // 3
    if (angle < -theta) {
      startIndex = Int(floor((-theta - angle) / anglePerItem))
    }
    // 4
    endIndex = min(endIndex, Int(ceil((theta - angle) / anglePerItem)))
    // 5
    if (endIndex < startIndex) {
      endIndex = 0
      startIndex = 0
    }
    attributesList = (startIndex...endIndex).map { (i)
      -> CircularCollectionViewLayoutAttributes in
      // 1
      let attributes = CircularCollectionViewLayoutAttributes(forCellWith: NSIndexPath(item: i, section: 0) as IndexPath)
      attributes.size = self.itemSize
      // 2
      attributes.center = CGPoint(x: centerX, y: self.collectionView!.bounds.midY)
      // 3
      attributes.angle = self.angle + self.anglePerItem * CGFloat(i)
      attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
      
      
      return attributes
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return attributesList
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return attributesList[indexPath.row]
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
}


class CircularCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
  // 1
  var anchorPoint = CGPoint(x: 0.5, y: 0.5)
  var angle: CGFloat = 0 {
    // 2
    didSet {
      zIndex = Int(angle * 1000000)
      transform = CGAffineTransform(rotationAngle: angle)
    }
  }
  //3
  override func copy(with zone: NSZone? = nil) -> Any {
    let copiedAttributes: CircularCollectionViewLayoutAttributes = super.copy(with: zone) as! CircularCollectionViewLayoutAttributes
    copiedAttributes.anchorPoint = self.anchorPoint
    copiedAttributes.angle = self.angle
    return copiedAttributes
  }
}
