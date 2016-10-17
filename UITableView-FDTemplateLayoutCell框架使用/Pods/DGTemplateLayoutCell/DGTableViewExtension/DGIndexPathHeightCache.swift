//
//  DGIndexPathHeightCache.swift
//
//  Created by zhaodg on 11/25/15.
//  Copyright © 2015 zhaodg. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


// MARK: - DGIndexPathHeightCache
class DGIndexPathHeightCache {

    fileprivate var heights: [[CGFloat]] = []

    // Enable automatically if you're using index path driven height cache. Default is true
    internal var automaticallyInvalidateEnabled: Bool = true

    init() {
        NotificationCenter.default.addObserver(self, selector: "deviceOrientationDidChange", name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }

    deinit {
         NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }

    // MARK: - public
    subscript(indexPath: IndexPath) -> CGFloat? {
        get {
            if (indexPath as NSIndexPath).section < heights.count && (indexPath as NSIndexPath).row < heights[(indexPath as NSIndexPath).section].count {
                return heights[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
            }
            return nil
        }
        set {
            self.buildIndexPathIfNeeded(indexPath)
            heights[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row] = newValue!
        }
    }

    internal func invalidateHeightAtIndexPath(_ indexPath: IndexPath) {
        self[indexPath] = -1
    }

    internal func invalidateAllHeightCache() {
        self.heights.removeAll()
    }

    internal func existsIndexPath(_ indexPath: IndexPath) -> Bool {
        return self[indexPath] != nil && self[indexPath] > -0.0000000001
    }

    internal func insertSections(_ sections: IndexSet) {
        (sections as NSIndexSet).enumerate({ (index, stop) -> Void in
            self.buildSectionsIfNeeded(index)
            self.heights.insert([], at: index)
        })
    }

    internal func deleteSections(_ sections: IndexSet) {
        (sections as NSIndexSet).enumerate({ (index, stop) -> Void in
            self.buildSectionsIfNeeded(index)
            self.heights.remove(at: index)
        })
    }

    internal func reloadSections(_ sections: IndexSet) {
        (sections as NSIndexSet).enumerate({ (index, stop) -> Void in
            self.buildSectionsIfNeeded(index)
            self.heights[index] = []
        })
    }

    internal func moveSection(_ section: Int, toSection newSection: Int) {
        self.buildSectionsIfNeeded(section)
        self.buildSectionsIfNeeded(newSection)
        swap(&self.heights[section], &self.heights[newSection])
    }

    internal func insertRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            self.buildIndexPathIfNeeded(indexPath)
            self.heights[(indexPath as NSIndexPath).section].insert(-1, at: (indexPath as NSIndexPath).row)
        }
    }

    internal func deleteRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
        let indexPathSorted = indexPaths.sorted { ($0 as NSIndexPath).section > ($1 as NSIndexPath).section || ($0 as NSIndexPath).row > ($1 as NSIndexPath).row }
        for indexPath in indexPathSorted {
            self.buildIndexPathIfNeeded(indexPath)
            self.heights[(indexPath as NSIndexPath).section].remove(at: (indexPath as NSIndexPath).row)
        }
    }

    internal func reloadRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            self.buildIndexPathIfNeeded(indexPath)
            self.invalidateHeightAtIndexPath(indexPath)
        }
    }

    internal func moveRowAtIndexPath(_ indexPath: IndexPath, toIndexPath newIndexPath: IndexPath) {
        self.buildIndexPathIfNeeded(indexPath)
        self.buildIndexPathIfNeeded(newIndexPath)
        swap(&self.heights[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row], &self.heights[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row])
    }

    // MARK: - private 
    fileprivate func buildSectionsIfNeeded(_ targetSection: Int) {
        if targetSection >= heights.count {
            for _ in heights.count...targetSection {
                self.heights.append([])
            }
        }
    }

    fileprivate func buildRowsIfNeeded(_ targetRow: Int, existSextion: Int) {
        if existSextion < heights.count && targetRow >= heights[existSextion].count {
            for _ in heights[existSextion].count...targetRow {
                self.heights[existSextion].append(-1)
            }
        }
    }

    fileprivate func buildIndexPathIfNeeded(_ indexPath: IndexPath) {
        self.buildSectionsIfNeeded((indexPath as NSIndexPath).section)
        self.buildRowsIfNeeded((indexPath as NSIndexPath).row, existSextion: (indexPath as NSIndexPath).section)
    }

    @objc fileprivate func deviceOrientationDidChange() {
        self.invalidateAllHeightCache()
    }
}

// MARK: - UITableView Extension
extension UITableView {

    fileprivate struct AssociatedKey {
        static var DGIndexPathHeightCache = "DGIndexPathHeightCache"
    }

    /// Height cache by index path. Generally, you don't need to use it directly.
    internal var dg_indexPathHeightCache: DGIndexPathHeightCache {
        if let value: DGIndexPathHeightCache = objc_getAssociatedObject(self, &AssociatedKey.DGIndexPathHeightCache) as? DGIndexPathHeightCache {
            return value
        } else {
            let cache: DGIndexPathHeightCache = DGIndexPathHeightCache()
            objc_setAssociatedObject(self, &AssociatedKey.DGIndexPathHeightCache, cache, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return cache
        }
    }
}
