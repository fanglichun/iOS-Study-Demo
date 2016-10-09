//
//  ViewController.swift
//  辗转相除法
//
//  Created by flc on 16/10/9.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(getGreatestCommonDivisor(a: 4, b: 25))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

fileprivate extension ViewController {
    
    //辗转相除法， 又名欧几里得算法（Euclidean algorithm），目的是求出两个正整数的最大公约数
    //两个正整数a和b（a>b），它们的最大公约数等于a除以b的余数c和b之间的最大公约数。
    private func gcd(dividend: Int, divisor: Int) ->Int {
        return dividend % divisor == 0 ? divisor : gcd(dividend: divisor, divisor: dividend % divisor)
    }
    
    func getGreatestCommonDivisor(a: Int, b: Int) -> Int {
        var result = 1
        result = a > b ? gcd(dividend: a, divisor: b) : gcd(dividend: b, divisor: a)
        return result
    }
    //更相减损术， 出自于中国古代的《九章算术》，也是一种求最大公约数的算法。
    //两个正整数a和b（a>b），它们的最大公约数等于a-b的差值c和较小数b的最大公约数
}

