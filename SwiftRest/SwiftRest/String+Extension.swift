//
//  String+Extension.swift
//  Pods
//
//  Created by mfang032 on 2017/6/23.
//
//

import Foundation

extension String {
    func splitStringToArray() -> [String] {
        var outputArray = [String]()
        
        let components = self.components(separatedBy: ",")
        for component in components {
            let trimmedComponent = component.trimmingCharacters(in: CharacterSet.whitespaces)
            outputArray.append(trimmedComponent)
        }
        
        return outputArray
    }
}

