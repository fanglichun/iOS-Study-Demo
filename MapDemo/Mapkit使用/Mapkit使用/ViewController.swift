//
//  ViewController.swift
//  Mapkit使用
//
//  Created by mfang032 on 2017/4/10.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation//主要包含了定位、地理编码（包括反编码）功能

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let localManager: CLLocationManager = CLLocationManager()//定位服务
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //请求定位服务
        if !CLLocationManager.locationServicesEnabled() || CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            localManager.requestWhenInUseAuthorization()
            
        }
        
       
        localManager.desiredAccuracy = kCLLocationAccuracyBest//设置定位精度
        let distance: CLLocationDistance = 10.0
        localManager.distanceFilter = distance
//         localManager.distanceFilter = kCLDistanceFilterNone//位置信息更新最小距离，只有移动大于这个距离才更新位置信息，默认为kCLDistanceFilterNone：不进行距离限制
        localManager.startUpdatingLocation()
        //除了提供定位功能，CLLocationManager还可以调用startMonitoringForRegion:方法对指定区域进行监控。
        localManager.startMonitoring(for: CLRegion())
        
        
        localManager.delegate = self

        //设置地图类型
        mapView.mapType = .standard
        mapView.delegate = self
        //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
        mapView.userTrackingMode = .follow
        
        
        
        //添加大头针
        addAnnotations()
        
        
//        initMapView()
        
        //地理编码：根据给定的位置（通常是地名）确定地理坐标(经、纬度)。
//        locationEncode()
        
        //逆地理编码：可以根据地理坐标（经、纬度）确定位置信息（街道、门牌等）。
//        reverseGeocode()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.animatesDrop = true
            pinView?.pinTintColor = UIColor.red
            pinView?.rightCalloutAccessoryView = UIButton(type: UIButtonType.detailDisclosure)
        } else {
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        print("地图缩放级别发送改变时")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("地图缩放完毕触法")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("开始加载地图")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("地图加载结束")
    }
    
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        print("地图加载失败")
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("开始渲染下载的地图块")
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        print("渲染下载的地图结束时调用")
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        print("正在跟踪用户的位置")
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        print("停止跟踪用户的位置")
    }
    
    //更新用户位置，只要用户改变则调用此方法（包括第一次定位到用户位置）
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("更新用户的位置")
    }
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        print("跟踪用户的位置失败")
    }
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode,
                 animated: Bool) {
        print("改变UserTrackingMode")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         print("设置overlay的渲染")
        return MKPolylineRenderer()
        
    }
    
    func mapView(_ mapView: MKMapView, didAdd renderers: [MKOverlayRenderer]) {
        print("地图上加了overlayRenderers后调用")
    }
    
    /*
     下面试大头针标注相关
     */
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print("添加注释视图")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("点击注释视图按钮")
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("点击大头针视图")
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("取消点击大头针视图")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        print("移动annotation位置时调用")
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    //位置发生改变后执行（第一次定位到某个位置之后也会执行）
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //返回数组是因为有些时候一个位置点可能包含多个位置
        //每个元素一个CLLocation代表地理位置信息（包含经度、纬度、海报、行走速度等信息）
        let currentLocation = locations.first
        if let latitude = currentLocation?.coordinate.latitude, let longitude = currentLocation?.coordinate.longitude {
            print(latitude)
            print(longitude)
        }
    }
    
    //导航方向发生变化后执行
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
    }
    //进入某个区域之后执行
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
    
    //走出某个区域之后执行
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
    
}

extension ViewController {
    
    func initMapView() {
        let currentLocationSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let center = CLLocation(latitude: 32.029171, longitude: 118.788231)
        let currentRegion: MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
        mapView.setRegion(currentRegion, animated: true)//设置显示区域
        
        let objectAnimation = MKPointAnnotation()
        //设置大头针的显示位置
        objectAnimation.coordinate = CLLocation(latitude: 32.029171, longitude: 118.788231).coordinate
        //设置大头针显示之后的标题
        objectAnimation.title = "南京夫子庙"
        objectAnimation.subtitle = "南京市秦淮区秦淮河北岸中华路"
        mapView.addAnnotation(objectAnimation)
    }
    
    func locationEncode() {
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("南京市新街口大洋百货") { (placemarks: [CLPlacemark]?, error) in
            if error != nil {
                print("error desc:\(error?.localizedDescription ?? "")")
                return
            }
            print("placemarks:\(placemarks?.count ?? 0)")
            if let p = placemarks?.first {
                if let location = p.location {
                    print("经度:\(String(describing: location.coordinate.longitude))" + " 维度:\(String(describing: location.coordinate.latitude))")
                }
                
                if let region = p.region {
                    print("regison:\(region.identifier)")
                }
                
                if let addressDictionary = p.addressDictionary {
                    print("addressDictionary:\(addressDictionary)")
                }
                
                if let name = p.name {//地名
                    print("name:\(name)")
                }
                
                if let thoroughfare = p.thoroughfare {//街道
                    print("thoroughfare:\(thoroughfare)")
                }
                
                if let locality = p.locality {//城市
                    print("city:\(locality)")
                }
                
                if let subLocality = p.subLocality {//城市相关信息
                    print("subLocality:\(subLocality)")
                }
                if let administrativeArea = p.administrativeArea {//州
                    print("administrativeArea:\(administrativeArea)")
                }
                
                if let subAdministrativeArea = p.subAdministrativeArea {
                    print("subAdministrativeArea:\(subAdministrativeArea)")
                }
                
                if let postCode = p.postalCode {
                    print("postCode:\(postCode)")
                }
                
                if let ISOcountryCode = p.isoCountryCode {//國家編碼
                    print("ISOcountryCode:\(ISOcountryCode)")

                }
                
                if let country = p.country {
                    print("country:\(country)")

                }
                
                if let inlandWater = p.inlandWater {//水源 船泊
                    print("inlandWater:\(inlandWater)")

                }
                
                if let ocean = p.ocean {
                    print("ocean:\(ocean)")

                }
                
                if let areasOfInterest = p.areasOfInterest {
                    print("areasOfInterest:\(areasOfInterest)")
                }
                
            } else {
                print("No placemarks")
            }
            
        }
        
    }
    
    func reverseGeocode() {
        let geocoder = CLGeocoder()
        let currentLocation = CLLocation(latitude: 32.029171, longitude: 118.788231)
        geocoder.reverseGeocodeLocation(currentLocation) { (placemarks: [CLPlacemark]?, error) in
            let array = NSArray(object: "zh-hans")
            UserDefaults.standard.set(array, forKey: "AppleLanguages")
            if error != nil {
                if error != nil {
                    print("error desc:\(error?.localizedDescription ?? "")")
                    return
                }
            }
            
            if let p = placemarks?.first {
               print("Address: \(p.name ?? "")")
            } else {
                print("No placemarks")
            }
        }
    }
    
    func addAnnotations() {
        let location1 = CLLocationCoordinate2D(latitude: 39.95, longitude: 116.35)
        let annotation1 = MKPointAnnotation()
        annotation1.title = "CMJ Studio"
        annotation1.subtitle = "Kenshin Cui's Studios"
        annotation1.coordinate = location1
        mapView.addAnnotation(annotation1)
        
        let location2 = CLLocationCoordinate2D(latitude: 39.95, longitude: 116.35)
        let annotation2 = MKPointAnnotation()
        annotation2.title = "Kenshin&Kaoru"
        annotation2.subtitle = "Kenshin Cui's Home"
        annotation2.coordinate = location2
        mapView.addAnnotation(annotation2)
        
        
        
    }
}

