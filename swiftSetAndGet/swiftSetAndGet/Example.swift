//
//  Example.swift
//  swiftSetAndGet
//
//  Created by mfang032 on 16/5/13.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}


// About to set totalSteps to 896
// Added 536 steps
