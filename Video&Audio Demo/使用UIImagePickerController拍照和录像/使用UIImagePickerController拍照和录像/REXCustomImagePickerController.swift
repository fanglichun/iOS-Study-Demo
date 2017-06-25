//
//  REXCustomImagePickerController.swift
//  使用UIImagePickerController拍照和录像
//
//  Created by mfang032 on 2017/4/17.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

let PHOTOLIBRARYTYPE = UIImagePickerControllerSourceType.photoLibrary
let CAMERATYPE = UIImagePickerControllerSourceType.camera

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}


struct DeviceType {
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD_PRO = UIDevice.current.userInterfaceIdiom  == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom  == .pad
    static let IS_IPAD_1024 = UIDevice.current.userInterfaceIdiom  == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024
}

class REXCustomImagePickerController: UIImagePickerController {

   
    var circleLayer: CAShapeLayer?
    var moveLabel: UILabel?
    var cropOverlay: UIView?
    var cropOverlayBottomBar: UIView?
    var shuttleButton:UIButton?
    
    var customCameraLayer: CAShapeLayer?
    var customCameraLayer_landscape: CAShapeLayer?
    var customCameraLayer_portrait: CAShapeLayer?
    let layerMargin:Float = 70.0
    
    var isClickedShuttleButton: Bool = false
    
    fileprivate var highlightedKey = "highlighted"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.shuttleButton?.removeObserver(self, forKeyPath: highlightedKey)
        self.shuttleButton?.removeFromSuperview()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if DeviceType.IS_IPAD && isClickedShuttleButton == true {
            let screenWidth = UIScreen.main.bounds.width
            self.moveLabel?.frame = CGRect(x: 0, y: 10, width: screenWidth, height: 50)
            self.moveLabel?.textAlignment = .center
            if self.moveLabel != nil {
                circleLayer?.removeFromSuperlayer()
                self.circleLayer = self.addCircleLayer()
                self.view.layer.insertSublayer(self.circleLayer!, below: self.moveLabel?.layer)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        //REXUtilities.dPrint("denit called")
        // REXUtilities.dPrint("self.shuttleButton:\(shuttleButton): \(shuttleButton?.observationInfo)")
        //        self.shuttleButton?.removeObserver(self, forKeyPath: highlightedKey) //because when page will disappear , the observer has been removed, don't add remove it again
        self.shuttleButton?.removeFromSuperview()
    }
    
    func addShuttleButtonAndAction() {
        if let shuttleButtonIos10Less = self.findViewByName(self.view, name: "CMKShutterButton") as? UIButton {
            self.shuttleButton = shuttleButtonIos10Less
            self.shuttleButton?.addObserver(self, forKeyPath: highlightedKey, options: NSKeyValueObservingOptions.new, context: nil)
        } else if let shuttleButtonIos10 = self.findViewByName(self.view, name: "CUShutterButton") as? UIButton  {
            self.shuttleButton = shuttleButtonIos10
            self.shuttleButton?.addObserver(self, forKeyPath: highlightedKey, options: NSKeyValueObservingOptions.new, context: nil)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == highlightedKey {
            if isClickedShuttleButton == false {//This action executed only once when shuttle button highlighted
                self.shuttleButtonAction()
            }
        }
    }
    
    func shuttleButtonAction() {
        
        let plCropOverlay = self.findViewByName(self.view, name: "PLCropOverlay")
        plCropOverlay?.isHidden = true
        
        let duration = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: duration) {
            self.circleLayer = self.addCircleLayer()
            self.circleLayer?.add(self.showAnimation(), forKey: "opacity")
            self.view.layer.insertSublayer(self.circleLayer!, above: plCropOverlay?.layer)
            self.moveLabel = self.addMoveAndScaleLabel()
            self.moveLabel?.alpha = 0
            self.view.addSubview(self.moveLabel!)
            
            if (self.cropOverlayBottomBar?.subviews.count)! > 0 {
                let cropOverlayPreviewBottomBar = self.findViewByName(self.cropOverlayBottomBar!, name: "PLCropOverlayPreviewBottomBar")
                cropOverlayPreviewBottomBar?.backgroundColor = UIColor.clear
                if (cropOverlayPreviewBottomBar?.subviews.count)! > 2 {
                    let retakeButton = cropOverlayPreviewBottomBar!.subviews[0] as? UIButton
                    retakeButton?.addTarget(self, action: #selector(self.clickRetakeOrUseButton) , for: UIControlEvents.touchUpInside)
                    let useButton = cropOverlayPreviewBottomBar!.subviews[2] as? UIButton
                    useButton?.addTarget(self, action: #selector(self.clickRetakeOrUseButton) , for: UIControlEvents.touchUpInside)
                }
            }
            
            if self.cropOverlayBottomBar != nil {
                self.cropOverlayBottomBar?.alpha = 0
                self.view.addSubview(self.cropOverlayBottomBar!)
            }
            
            UIView.animate(withDuration: 0.3, animations: {
                self.moveLabel?.alpha = 1
                self.cropOverlayBottomBar?.alpha = 1
            })
        }
        self.isClickedShuttleButton = true
    }
    
    func findViewByName(_ view: UIView, name: String) -> UIView? {
        if view.subviews.count > 0 {
            for subview in view.subviews {
                let descriptionStr = subview.self.description
                let stringArr = descriptionStr.components(separatedBy: CharacterSet(charactersIn: "<:"))
                if stringArr.count > 1 {
                    let stringName = stringArr[1]
                    if stringName == name {
                        return subview
                    } else if subview.subviews.count > 0 {
                        if let findView = self.findViewByName(subview, name: name) {//if find this view,return it,or go on.
                            return findView
                        }
                    }
                }
            }
            return nil
        } else {
            return nil
        }
    }
    
    func addCircleLayer() -> CAShapeLayer {
        
        if DeviceType.IS_IPAD && self.sourceType == CAMERATYPE {
            var diadimter: CGFloat
            var ovalPath: UIBezierPath
            let screenHeight = Float(UIScreen.main.bounds.height)
            let screenWidth = Float(UIScreen.main.bounds.width)
            if screenHeight > screenWidth {//portrait
                if self.customCameraLayer_portrait == nil {
                    diadimter = CGFloat(screenWidth - layerMargin * 3)
                    ovalPath = UIBezierPath(ovalIn: CGRect(x: CGFloat(layerMargin*3/2), y: CGFloat(screenHeight/2.0) - diadimter/2, width: diadimter, height: diadimter))
                    ovalPath.usesEvenOddFillRule = true
                    let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height ), cornerRadius: 0)
                    path.append(ovalPath)
                    path.usesEvenOddFillRule = true
                    self.customCameraLayer_portrait = CAShapeLayer()
                    self.customCameraLayer_portrait!.path = path.cgPath
                    self.customCameraLayer_portrait!.fillRule = kCAFillRuleEvenOdd
                    self.customCameraLayer_portrait!.fillColor = UIColor.black.cgColor
                    self.customCameraLayer_portrait!.opacity = 0.7
                }
                self.customCameraLayer_landscape?.removeFromSuperlayer()
                guard self.customCameraLayer_portrait != nil else {return CAShapeLayer()}
                return self.customCameraLayer_portrait!
            } else {//landscape
                if (self.customCameraLayer_landscape == nil) {
                    diadimter = CGFloat(screenHeight - layerMargin * 3)
                    ovalPath = UIBezierPath(ovalIn: CGRect(x: CGFloat(screenWidth/2.0) - diadimter/2, y: CGFloat(layerMargin), width: diadimter, height: diadimter))
                    ovalPath.usesEvenOddFillRule = true
                    let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height ), cornerRadius: 0)
                    path.append(ovalPath)
                    path.usesEvenOddFillRule = true
                    self.customCameraLayer_landscape = CAShapeLayer()
                    self.customCameraLayer_landscape!.path = path.cgPath
                    self.customCameraLayer_landscape!.fillRule = kCAFillRuleEvenOdd
                    self.customCameraLayer_landscape!.fillColor = UIColor.black.cgColor
                    self.customCameraLayer_landscape!.opacity = 0.7
                }
                
                self.customCameraLayer_portrait?.removeFromSuperlayer()
                guard self.customCameraLayer_landscape != nil else {return CAShapeLayer()}
                return self.customCameraLayer_landscape!
            }
        } else {
            let circleLayer = CAShapeLayer()
            let frame = self.view.bounds
            let width = frame.size.width
            let height = frame.size.height
            
            let path2 = UIBezierPath(ovalIn: CGRect(x: 10, y: (height - width - 20)/2 , width: width - 20 ,height: width - 20))
            path2.usesEvenOddFillRule = true
            circleLayer.path = path2.cgPath
            circleLayer.fillColor = UIColor.clear.cgColor
            let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: width , height: height), cornerRadius: 0)
            path.append(path2)
            path.usesEvenOddFillRule = true
            let fillLayer = CAShapeLayer()
            fillLayer.path = path.cgPath
            fillLayer.fillRule = kCAFillRuleEvenOdd
            fillLayer.fillColor = UIColor.black.cgColor
            fillLayer.opacity = 0.7
            return fillLayer
        }
    }
    
    func addMoveAndScaleLabel() -> UILabel {
        let moveLabel = UILabel(frame: CGRect(x: 0, y: 10, width: self.view.frame.width , height: 50))
        moveLabel.text = "Move and Scale"
        moveLabel.textAlignment = NSTextAlignment.center
        moveLabel.textColor = UIColor.white
        return moveLabel
    }
    
    func clickRetakeOrUseButton(){
        moveLabel?.removeFromSuperview()
        circleLayer?.removeFromSuperlayer()
        cropOverlayBottomBar?.removeFromSuperview()
        isClickedShuttleButton = false
    }
    
    func showAnimation() -> CABasicAnimation {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.duration = 0.3
        opacityAnimation.fromValue = 0
        opacityAnimation.toValue = 0.7
        opacityAnimation.isRemovedOnCompletion = false
        opacityAnimation.fillMode = kCAFillModeForwards
        
        return opacityAnimation
    }

}
