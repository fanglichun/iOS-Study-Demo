//
//  ViewController.swift
//  ThreadCommunications
//
//  Created by mfang032 on 2017/6/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        delay1()
        //        delay2()
//        queueGroups1()
        queueGroups2()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func test1() {
        
        DispatchQueue.global().async {
            //执行耗时的异步操作
            //回到主线程，执行UI刷新UI操作
            DispatchQueue.main.async {
                
            }
        }
    }
    
    private func delay1() {
        
        perform(#selector(run), with: nil, afterDelay: 2.0)
    }
    
    private func delay2() {
        DispatchQueue.main.asyncAfter(wallDeadline: DispatchWallTime.now() + 2, qos: DispatchQoS.default, flags: DispatchWorkItemFlags.noQoS) {
            self.run()
        }
    }
    
    private func queueGroups1() {
        //对于queue中所执行的代码不一定在main thread中。如果queue是在主线程中创建的，那么所执行的代码就是在主线程中执行。如果是在子线程中创建的，那么就不会在main thread中执行。
        //对于main queue就是在主线程中的，因此一定会在主线程中执行。获取main queue就可以了，不需要我们创建，获取方式通过调用方法dispatchgetmain_queue来获取。
        let group = DispatchGroup()
        let queue = DispatchQueue.global()
        group.enter()
        queue.async(group: group) {
            print("耗时操作1")
            group.leave()
        }
        group.enter()
        queue.async(group: group) {
            print("耗时操作2")
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {
            print("在主线程刷新UI")
        }
        
    }
    
    private func queueGroups2() {
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3//设置最大并发数
        //OperationQueue支持KVO，可以监测operation是否正在执行（isExecuted）、是否结束（isFinished），是否取消（isCanceld）
        //OperationQueue存放NSOperation的集合类。不能说队列，不是严格的先进先出
        
        weak var image1: UIImage?
        let op1 = BlockOperation {
            //download first image
            guard
                let url = URL(string: "http://imgcache.mysodao.com/img1/M02/EE/B5/CgAPDE-kEtqjE8CWAAg9m-Zz4qo025-22365300.JPG")
                else {
                    return
            }
            
            do {
                let data = try Data(contentsOf: url)
                image1 = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imgView1.image = image1
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
        weak var image2: UIImage?
        let op2 = BlockOperation {
            //download second image
            guard
                let url = URL(string: "http://imgcache.mysodao.com/img1/M02/EE/B5/CgAPDE-kEtqjE8CWAAg9m-Zz4qo025-22365300.JPG")
                else {
                    return
            }
            do {
                let data = try Data(contentsOf: url)
                image2 = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imgView1.image = image2
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        weak var img: UIImage?
        let op3 = BlockOperation {
            //merge two images
            UIGraphicsBeginImageContext(CGSize(width: 200, height: 200))
            image1?.draw(in: CGRect(x: 0, y: 0, width: 100, height: 200))
            image2?.draw(in: CGRect(x: 100, y: 0, width: 100, height: 200))
            img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        OperationQueue.main.addOperation { 
            self.imgView2.image = img
        }
        
        op3.addDependency(op1)
        op3.addDependency(op2)
        queue.addOperation(op1)
        queue.addOperation(op2)
        queue.addOperation(op3)
        
    }
    
    func run() {
        print("delay 2 seconds")
    }
    
    
}



