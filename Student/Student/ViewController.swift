//
//  ViewController.swift
//  Student
//
//  Created by mfang032 on 4/5/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var student: Student?
    var buffer: NSManagedObjectContext?
    @IBOutlet weak var iDText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var ClassNoText: UITextField!

    override func viewDidLoad() {
      super.viewDidLoad()
        buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnClicked(sender: UIButton) {
        if sender.tag == 0 {// Read
            var students:[Student] = []
            let request = NSFetchRequest(entityName: "Student")
            let sd = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sd]
            let predicate = NSPredicate(format: "name like %@", "Michael")
            request.predicate = predicate
            do {
                try students = buffer?.executeFetchRequest(request) as! [Student]
                guard students.count > 0 else { return}
                self.student = students[0]
                iDText.text = String(student?.iD!)
                ageText.text = String(student?.age!)
                nameText.text = student?.name!
                ClassNoText.text = student?.classNo!
            } catch {
                print(error)
            }

        } else if sender.tag == 1 { //Delete
            var students:[Student] = []
            let request = NSFetchRequest(entityName: "Student")
            let sd = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sd]
            do {
                try students = buffer?.executeFetchRequest(request) as! [Student]
                for student in students {
                    buffer?.deleteObject(student)
                }
              try buffer?.save()
                clearData()
            } catch {
                print(error)
            }

        } else if sender.tag == 2 {//Insert
            student = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: buffer!) as? Student
            student?.name = nameText.text!
            student?.iD = Int(iDText.text!)
            student?.classNo = ClassNoText.text!
            student?.age = Int(ageText.text!)
            do {
                try buffer?.save()
                clearData()
            } catch {
                print(error)
            }
        } else { // Update
            var students:[Student] = []
            let request = NSFetchRequest(entityName: "Student")
            let sd = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sd]
            do {
                try students = buffer?.executeFetchRequest(request) as! [Student]
                guard students.count > 0 else { return}
                self.student = students[0]
                self.student?.name = nameText.text!
                try buffer?.save()
                self.clearData()
            } catch {
                print(error)
            }
        }
    }
    
    func clearData() {
        iDText.text = ""
        ageText.text = ""
        nameText.text = ""
        ClassNoText.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

