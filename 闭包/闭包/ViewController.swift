//
//  ViewController.swift
//  闭包
//
//  Created by mfang032 on 4/16/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
//swift中定义了命名空间,同一个命名空间资源是共享的，默认情况下项目名称就是命名空间
//导入三方框架时，利用cocoapods可以防止命名空间冲突，因为cocoapods导入第三方库到另一个项目中时，命名空间是不一样的
class ViewController: UIViewController {

    var loadData: ( () ->())?
    var loadImage: ((Bool, String) ->Void)?
    
    lazy var dataSource: [String] = {
        //如果别报用于懒加载的话下面第一句可以省略
        () ->[String] in
        return ["Alice"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let p = Person()
        p.name = "Michael"
        p.gender = "Male"
        //p.age = 18 // 只读属性
        print(p.age)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

