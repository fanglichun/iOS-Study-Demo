//
//  ViewController.swift
//  通讯录-ContactsUI
//
//  Created by mfang032 on 2017/4/10.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import ContactsUI

//CNContactPickerViewController：展示联系人列表的 controller
//CNContactViewController：展示联系人详细信息的 controller

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectContact(_ sender: AnyObject) {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        contactPicker.predicateForSelectionOfContact = NSPredicate(format: "emailAddresses.@count > 0", argumentArray: nil)
        present(contactPicker, animated: true, completion: nil)
        
    }
    
    @IBAction func selectContacts(_ sender: AnyObject) {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        contactPicker.predicateForSelectionOfContact = NSPredicate(format: "emailAddresses.@count > 0", argumentArray: nil)
        present(contactPicker, animated: true, completion: nil)
        
    }


}

extension ViewController: CNContactPickerDelegate, CNContactViewControllerDelegate {
    
    //单选联系人
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let lastName = contact.familyName
        let firstName = contact.givenName
        print("firstName: \(firstName)")
        print("lastName:\(lastName)")
        let phones = contact.phoneNumbers
        for phone in phones {
            //获得标签名
            let phoneLabel =  CNLabeledValue<NSString>.localizedString(forLabel: phone.label!)
            //获取电话号码
            let phoneValue = phone.value.stringValue
            print("Home:\(phoneLabel) number: \(phoneValue)")
            
        }
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        print("一共选择了\(contacts.count)个联系人。")
        for contact in contacts {
            print("--------------")
            //获取联系人的姓名
            let lastName = contact.familyName
            let firstName = contact.givenName
            print("选中人的姓：\(lastName)")
            print("选中人的名：\(firstName)")
            
            //获取联系人电话号码
            print("选中人电话：")
            let phones = contact.phoneNumbers
            for phone in phones {
                //获得标签名（转为能看得懂的本地标签名，比如work、home）
                let phoneLabel = CNLabeledValue<NSString>.localizedString(forLabel: phone.label!)
                //获取号码
                let phoneValue = phone.value.stringValue
                print("\(phoneLabel):\(phoneValue)")
            }
        }
    }
}

