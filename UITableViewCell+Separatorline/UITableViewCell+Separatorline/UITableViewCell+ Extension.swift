//
//  UITableViewCell+ Extension.swift
//  UITableViewCell+Separatorline
//
//  Created by flc on 16/10/13.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

private var topSeparatorColorKey: Void?
private var bottomSeparatorColorKey: Void?

private var topSeparatorHeightKey: Void?
private var bottomSeparatorHeightKey: Void?

private var topSeparatorLeftMarginKey: Void?
private var topSeparatorRightMarginKey: Void?

private var bottomSeparatorLeftMarginKey: Void?
private var bottomSeparatorRightMarginKey: Void?

private var topSeparetorView: UIView?
private var bottomSeparetorView: UIView?

extension UITableViewCell {
    
  
    var topSepartorColor: UIColor? {
        
        get {
            return objc_getAssociatedObject(self, &topSeparatorColorKey) as! UIColor?
        }
        set(newValue) {
            objc_setAssociatedObject(self, &topSeparatorColorKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var bottomSepartorColor: UIColor? {
        
        get {
            return objc_getAssociatedObject(self, &bottomSeparatorColorKey) as! UIColor?
        }
        set(newValue) {
            objc_setAssociatedObject(self, &topSeparatorColorKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var topSeparatorHeight: CGFloat?{
        
        get {
            return objc_getAssociatedObject(self, &topSeparatorHeightKey) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &topSeparatorHeightKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var bottomSeparatorHeight: CGFloat?{
        
        get {
            return objc_getAssociatedObject(self, &bottomSeparatorHeightKey) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &bottomSeparatorHeightKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var topSeparatorLeftMargin: CGFloat?{
        
        get {
            return objc_getAssociatedObject(self, &topSeparatorLeftMarginKey) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &topSeparatorLeftMarginKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var topSeparatorRightMargin: CGFloat?{
        
        get {
            return objc_getAssociatedObject(self, &topSeparatorRightMarginKey) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &topSeparatorRightMarginKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var bottomSeparatorLeftMargin: CGFloat?{
        
        get {
            return objc_getAssociatedObject(self, &bottomSeparatorLeftMarginKey) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &bottomSeparatorLeftMarginKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var bottomSeparatorRightMargin: CGFloat?{
        
        get {
            return objc_getAssociatedObject(self, &bottomSeparatorRightMarginKey) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &bottomSeparatorRightMarginKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
