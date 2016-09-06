//
//  ViewController.swift
//  CAEmitterLayer和CAEmitterCell学习
//
//  Created by mfang032 on 5/2/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
import QuartzCore
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let snowEmitter = CAEmitterLayer()
        //例子发射位置
        snowEmitter.emitterPosition = CGPointMake(120,20)
        //发射源的尺寸大小
        snowEmitter.emitterSize = CGSizeMake(self.view.bounds.size.width * 20, 20)
        //发射模式
        snowEmitter.emitterMode = kCAEmitterLayerSurface
        //发射源的形状
        snowEmitter.emitterShape = kCAEmitterLayerLine
        
        //创建雪花类型的粒子
        let snowflake = CAEmitterCell()
        //粒子的名字
        snowflake.name = "snow"
        //粒子参数的速度乘数因子
        snowflake.birthRate = 1.0
        snowflake.lifetime = 120.0
        //粒子速度
        snowflake.velocity = 10.0
        //粒子的速度范围
        snowflake.velocityRange = 10
        //粒子y方向的加速度分量
        snowflake.yAcceleration = 2
        //周围发射角度
        snowflake.emissionRange = CGFloat(0.5 * M_PI)
        //子旋转角度范围
        snowflake.spinRange = CGFloat(0.25 * M_PI)
        snowflake.contents = UIImage(named: "DazFlake")?.CGImage
        //设置雪花形状的粒子的颜色
        snowflake.color = UIColor(red: 0.2, green: 0.258, blue: 0.543, alpha: 1).CGColor
        
        //创建星星形状的粒子
        let snowflake1 = CAEmitterCell()
        //粒子的名字
        snowflake1.name = "snow"
        //粒子参数的速度乘数因子
        snowflake1.birthRate = 1.0
        snowflake1.lifetime = 120.0
        //粒子速度
        snowflake1.velocity = 10.0
        //粒子的速度范围
        snowflake1.velocityRange = 10;
        //粒子y方向的加速度分量
        snowflake1.yAcceleration = 2;
        //周围发射角度
        snowflake1.emissionRange = CGFloat(0.5 * M_PI)
        //子旋转角度范围
        snowflake1.spinRange = CGFloat(0.25 * M_PI)
        //粒子的内容和内容的颜色
        snowflake1.contents = UIImage(named: "DazStarOutline")?.CGImage
        snowflake1.color = UIColor(red: 0.600, green: 0.658, blue: 0.743, alpha: 1.000).CGColor
        snowEmitter.shadowOpacity = 1.0
        snowEmitter.shadowRadius = 0.0
        snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0)
        //粒子边缘的颜色
        snowEmitter.shadowColor = UIColor.redColor().CGColor
        snowEmitter.emitterCells = [snowflake, snowflake1]
        self.view.layer.insertSublayer(snowEmitter, atIndex: 0)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

