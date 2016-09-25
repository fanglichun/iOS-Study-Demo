//
//  ViewController.swift
//  Swift3枚举写法
//
//  Created by flc on 16/9/24.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let type = ShortcutIdentifier(fullType: ShortcutIdentifier.Third.type)
        print(type?.type)
        print(ShortcutIdentifier.First.hashValue)
        print(ShortcutIdentifier.First.rawValue)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

