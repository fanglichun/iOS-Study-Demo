//
//  ViewController.swift
//  SocketDemo
//
//  Created by mfang032 on 2017/4/14.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class ViewController: UIViewController {
    
    @IBOutlet weak var hostAddress: UITextField!
    @IBOutlet weak var port: UITextField!
    

    
    var socket: GCDAsyncSocket = GCDAsyncSocket()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.socket.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connect(_ sender: Any) {
        
        do {
            try self.socket.connect(toHost: hostAddress.text!, onPort:8080)
            
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    @IBAction func disconnect(_ sender: Any) {
        
    }

}



extension ViewController: GCDAsyncSocketDelegate {
    
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        
    }
    
    func socket(_ sock: GCDAsyncSocket, didConnectTo url: URL) {
        
    }
    
    func socket(_ sock: GCDAsyncSocket, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {
        
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        
    }
    
    func socket(_ sock: GCDAsyncSocket, didReadPartialDataOfLength partialLength: UInt, tag: Int) {
        
    }
    
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        
    }
    
}

