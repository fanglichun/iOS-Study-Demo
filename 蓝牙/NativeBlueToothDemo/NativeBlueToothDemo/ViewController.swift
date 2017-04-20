//
//  ViewController.swift
//  NativeBlueToothDemo
//
//  Created by mfang032 on 2017/4/13.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    var manager: CBCentralManager = CBCentralManager()
    
    var peripheral: CBPeripheral?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: CBCentralManagerDelegate, CBPeripheralDelegate {
    
    //开始查看服务 蓝牙开启
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
        case .poweredOn:
            break
        case .poweredOff:
            break
        case .unauthorized, .resetting, .unsupported:
            break
        default:
            break
        }
    }
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        
     
    }
    
    //检测到外设后，停止扫描，连接设备
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        self.peripheral = peripheral
        manager.connect(peripheral, options: nil)
        //扫描到外设后停止扫描
        manager.stopScan()
    }
    
    //连接外设后的处理
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
        self.peripheral?.delegate = self
        self.peripheral?.discoverServices(nil)
        
    }
    
    //连接设备
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
    }
    
    //已经发现的服务
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
    }
    
    //已经搜索到的服务
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
    }
    
    func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        
    }
    
    
    
}

