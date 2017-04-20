//
//  KCAnnotation.swift
//  Mapkit使用
//
//  Created by mfang032 on 2017/4/10.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import MapKit

@objc class KCAnnotation: NSObject  {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }

}

extension KCAnnotation: MKAnnotation {}
