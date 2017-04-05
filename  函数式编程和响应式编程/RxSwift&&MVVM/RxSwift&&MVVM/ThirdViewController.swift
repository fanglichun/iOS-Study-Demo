//
//  ThirdViewController.swift
//  RxSwift&&MVVM
//
//  Created by mfang032 on 2017/4/5.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var dismissBtn: UIButton =  {
        let rect = CGRect(x: UIScreen.main.bounds.size.width - 16, y: 100 , width: 60, height: 30)
        let btn = UIButton(frame: rect)
        btn.addTarget(self, action: #selector(dismiss(sender:)), for: UIControlEvents.touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        view.addSubview(dismissBtn)
        
        UIImage(named: "")
        UIImage(contentsOfFile: "")
        

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    func dismiss(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
