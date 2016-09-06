//
//  Student+CoreDataProperties.swift
//  Student
//
//  Created by mfang032 on 4/5/16.
//  Copyright © 2016 mfang032. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var name: String?
    @NSManaged var age: NSNumber?
    @NSManaged var iD: NSNumber?
    @NSManaged var classNo: String?

}
