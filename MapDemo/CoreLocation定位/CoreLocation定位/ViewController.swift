//
//  ViewController.swift
//  CoreLocation定位
//
//  Created by mfang032 on 2017/4/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        /*
         kCLLocationAccuracyNearestTenMeters。精确到10米。
         kCLLocationAccuracyHundredMeters。精确到100米。
         kCLLocationAccuracyKilometer。精确到1000米。
         kCLLocationAccuracyThreeKilometers。精确到3000米。
         kCLLocationAccuracyBest。设备使用电池供电时最高的精度。
         kCLLocationAccuracyBestForNavigation。导航情况下最高的精度,一般有外接电源时才能使用。
         */
        locationManager.distanceFilter = 1000.0 //位置信息更新最小距离，只有移动大于这个距离才更新位置信息
        locationManager.allowDeferredLocationUpdates(untilTraveled: <#T##CLLocationDistance#>, timeout: <#T##TimeInterval#>)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentLocation = locations.last
        let latitude = currentLocation?.coordinate.latitude
        let longitude = currentLocation?.coordinate.longitude
        print("经度：\(longitude), 纬度:\(latitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    
}
