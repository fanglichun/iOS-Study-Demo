//
//  ElasticView.swift
//  FlexibleAnimation
//
//  Created by mfang032 on 1/16/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ElasticView1: UIView {
//    
//    private let topControlPointView = UIView()
//    private let leftControlPointView = UIView()
//    private let bottomControlPointView = UIView()
//    private let rightControlPointView = UIView()
//    
//    private let elasticShape = CAShapeLayer()
//    
//    override var backgroundColor: UIColor? {
//        willSet {
//            if let newValue = newValue {
//                elasticShape.fillColor = newValue.CGColor
//                super.backgroundColor = UIColor.clearColor()
//            }
//        }
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUpComponent()
//        //positionControlPoints()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setUpComponent()
//        //positionControlPoints()
//    }
//    
//    /**
//     配置图形图层，设置它的填充色和ElasticView的背景色一样，填充的路径的和视图的边界一样。最后把它添加到图层结构上。
//     */
//    private func setUpComponent() {
//        elasticShape.fillColor = backgroundColor?.CGColor
//        elasticShape.path = UIBezierPath(rect: self.bounds).CGPath
//        layer.addSublayer(elasticShape)
//        for controlPoint in [topControlPointView,leftControlPointView,bottomControlPointView,rightControlPointView] {
//            //视图上添加了四个控制点
//            addSubview(controlPoint)
//            controlPoint.frame = CGRectMake(0.0, 0.0, 5.0, 5.0)
//            controlPoint.backgroundColor = UIColor.blueColor()
//        }
//        positionControlPoints()
//    }
//    /**
//     这个函数在视图边界上将每个控制点移到正确的位置
//     */
//    private func positionControlPoints() {
//        topControlPointView.center = CGPointMake(bounds.minX, 0.0)
//        leftControlPointView.center = CGPointMake(0.0, bounds.minY)
//        bottomControlPointView.center = CGPointMake(bounds.midX, bounds.maxY)
//        rightControlPointView.center = CGPointMake(bounds.maxX, bounds.midY)
//        
//    }
//    
//    /**
//     绘制图层形状
//     - returns: 路径的CGPathRef
//     */
//    private func bezierPathForControlPoints() ->CGPathRef {
//        //创建一个UIBezierPath类对象来保存你的形状。
//        let path = UIBezierPath()
//        
//        //提取四个控制点的位置分别为top、left、bottom和right四个常量
//        let top = topControlPointView.layer.presentationLayer()?.position
//        let left = leftControlPointView.layer.presentationLayer()?.position
//        let bottom = bottomControlPointView.layer.presentationLayer()?.position
//        let right = rightControlPointView.layer.presentationLayer()?.position
//        let width = frame.size.width
//        let height = frame.size.height
//        
//        //通过长方形的顶点和4个控制点，绘制曲线，来创建路径
//        path.moveToPoint(CGPointMake(0.0, 0.0))
//        path.addQuadCurveToPoint(CGPointMake(width, 0), controlPoint: top!)
//        path.addQuadCurveToPoint(CGPointMake(width, height), controlPoint: right!)
//        path.addQuadCurveToPoint(CGPointMake(0, height), controlPoint: bottom!)
//        path.addQuadCurveToPoint(CGPointMake(0, 0), controlPoint: left!)
//        //返回路径的CGPathRef
//        return path.CGPath
//    }
//    /**
//     屏幕更新
//     */
//    func updateLoop() {
//        elasticShape.path = bezierPathForControlPoints()
//    }
//    
//    /**
//     *  创建一个CADisplayLink对象名为displayLink的变量
//     */
//    
//    private lazy var displayLink : CADisplayLink = {
//        let displayLink = CADisplayLink(target: self, selector: Selector("updateLoop"))
//        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
//        return displayLink
//    }()
//    
//    private func startUpdateLoop() {
//        displayLink.paused = false
//    }
//    
//    private func stopUpdateLoop() {
//        displayLink.paused = true
//    }
//    
//    /**
//     *  得控制点的运动轨迹
//     */
//    func animateControlPoints() {
//        //1: 控制点移动的偏移量。
//        let overshootAmount : CGFloat = 10.0
//        UIView.animateWithDuration(0.25, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.5, options: UIViewAnimationOptions.Repeat    , animations: { () -> Void in
//            //上下左右移动控制点，将会产生动画
//            self.topControlPointView.center.y -= overshootAmount
//            self.leftControlPointView.center.x -= overshootAmount
//            self.bottomControlPointView.center.y += overshootAmount
//            self.rightControlPointView.center.x += overshootAmount
//            }) { (success) -> Void in
//                //创建另一个spring animation 动画使视图还原
//                UIView.animateWithDuration(0.45, delay: 0.0, usingSpringWithDamping: 0.15, initialSpringVelocity: 5.5, options: UIViewAnimationOptions.Repeat, animations: { () -> Void in
//                    //重置控制点的位置——这也是一个动画。
//                    self.positionControlPoints()
//                    }, completion: { (_) -> Void in
//                        //动画结束的时候暂停displaylink更新。
//                        self.stopUpdateLoop()
//                })
//        }
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        startUpdateLoop()
//        animateControlPoints()
//    }
}
