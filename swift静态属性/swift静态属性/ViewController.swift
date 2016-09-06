//
//  ViewController.swift
//  swift静态属性
//
//  Created by mfang032 on 12/1/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

enum REXDateStringFormat: Int {
    case YYYY
    case MMM
    case MMM_YYYY
    case MMMM
    case MM
    case DD
    case MM_DD_YYYY
    case MM_YYYY
    case MMMM_DD__YYYY
    case YYYY_MM_DDT_HH_MM_SS
    
    var stringValue : String {
        switch self {
        case YYYY: return "yyyy"
        case MMM: return "MMM"
        case MMM_YYYY: return "MMM yyyy"
        case MMMM: return "MMMM"
        case MM: return "MM"
        case DD: return "dd"
        case MM_DD_YYYY: return "MM/dd/yyyy"
        case MM_YYYY: return "MM/yyyy"
        case MMMM_DD__YYYY: return "MMMM dd, yyyy"
        case YYYY_MM_DDT_HH_MM_SS: return "yyyy-mm-ddTHH:mm:ss"
        }
    }
}

class ViewController: UIViewController {
    
    class var dateFormatter : NSDateFormatter {
        return  NSDateFormatter()
    }
    func convertFromDateStringToDateString(fromDate: String?, fromDateFormatter: String, toDateFormatter: String) -> String {
        guard var dateString = fromDate
            else {
                return ""
        }
        dateString = dateString.substringToIndex(dateString.startIndex.advancedBy(10))
        ViewController.dateFormatter.dateFromString(dateString)
        ViewController.dateFormatter.dateFormat = fromDateFormatter
        ViewController.dateFormatter.locale = NSLocale(localeIdentifier: "US_en")
        
        return ""
    }
    func convertDateString(dateFormatter: String) -> String {
        ViewController.dateFormatter.dateFormat = dateFormatter
        ViewController.dateFormatter.locale = NSLocale(localeIdentifier: "US_en")
        return  ViewController.dateFormatter.stringFromDate(NSDate())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(ViewController.dateFormatter)
        let dateFormatter = "MMMM dd, yyyy"
        print(self.convertDateString(dateFormatter))
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

