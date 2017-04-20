//
//  ViewController.swift
//  通讯录-Contacts
//
//  Created by mfang032 on 2017/4/10.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        CNContactStore().requestAccess(for: CNEntityType.contacts) { [weak self] (isAccess, error) in
            if isAccess {
                //添加新的通讯联系人
                self?.addContact()
                //授权成功加载数据。
                self?.loadContactsData()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    
    func loadContactsData() {
        let status = CNContactStore.authorizationStatus(for: .contacts)
        guard status == .authorized else {
            return
        }
        
        //创建通讯录对象
        let store = CNContactStore()
        let keys = [CNContactFamilyNameKey, CNContactGivenNameKey, CNContactNicknameKey,
                    CNContactOrganizationNameKey, CNContactJobTitleKey,
                    CNContactDepartmentNameKey, CNContactNoteKey, CNContactPhoneNumbersKey,
                    CNContactEmailAddressesKey, CNContactPostalAddressesKey,
                    CNContactDatesKey, CNContactInstantMessageAddressesKey]
        //创建请求对象
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        //遍历联系人
        do {
            try store.enumerateContacts(with: request, usingBlock: { (contact: CNContact, stop: UnsafeMutablePointer<ObjCBool>) in
                let lastName = contact.familyName
                let firstName = contact.givenName
                let nickName = contact.nickname
                let organization = contact.organizationName
                let jobTitle = contact.jobTitle
                let department = contact.departmentName
                let note = contact.note
                print("firstName:\(firstName), lastName: \(lastName), nickName:\(nickName), organization:\(organization), jobTitle:\(jobTitle) department:\(department), note:\(note)")
                //获取电话
                let phones = contact.phoneNumbers
                for phone in phones {
                    let phoneLabel = CNLabeledValue<NSString>.localizedString(forLabel: phone.label ?? "")
                    let phoneValue = phone.value.stringValue
                    print("label:\(phoneLabel), phoneValue:\(phoneValue)")
                }
                
                //获取email
                let emails = contact.emailAddresses
                for email in emails {
                    let emailLabel = CNLabeledValue<NSString>.localizedString(forLabel: email.label ?? "")
                    let emailValue = CNLabeledValue<NSString>.localizedString(forLabel: email.value as String)
                    print("emialLabel:\(emailLabel), emailValue:\(emailValue)")
                }
                
                //获取地址
                for address in contact.postalAddresses {
                    let addressLabel = CNLabeledValue<NSString>.localizedString(forLabel: address.label ?? "")
                    let detail = address.value
                    let country = detail.country
                    let state = detail.state
                    let city = detail.city
                    let street = detail.street
                    let postCode = detail.postalCode
                    let desc = "label:\(addressLabel), 国家:\(country), state:\(state), city:\(city), street:\(street), postCode:\(postCode)"
                    print(desc)
                }
                //获取date
                let dates = contact.dates
                for date in dates {
                    let label = CNLabeledValue<NSString>.localizedString(forLabel: date.label ?? "")
                    let dateComponents = date.value as DateComponents
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
                    if let value = Calendar.current.date(from: dateComponents) {
                        print("dateLabel: \(label), value:\(dateFormatter.string(from: value))")
                    }
                }
                
                //获取IM
                let ims = contact.instantMessageAddresses
                for im in ims {
                    let label = CNLabeledValue<NSString>.localizedString(forLabel: im.label ?? "")
                    let detail = im.value
                    let username = detail.username
                    let service = detail.service
                    print("label:\(label), username:\(username), service:\(service)")
                }
                
            })
        } catch {
            
        }
        
    }
    
    func addContact() {
        //创建通讯录对象
        let store = CNContactStore()
        //创建CNMutableContact类型的实例
        let mutableContact = CNMutableContact()
        mutableContact.familyName = "Michael"
        mutableContact.givenName = "Fang"
        if let img = UIImage(named: "michael") {
            mutableContact.imageData = UIImagePNGRepresentation(img)
        }
        let phoneNumber = CNPhoneNumber(stringValue: "5851009")
        let phoneValue = CNLabeledValue(label: CNLabelPhoneNumberiPhone, value: phoneNumber)
        let mobileNumber = CNPhoneNumber(stringValue: "18601760235")
        let mobileValue = CNLabeledValue(label: CNLabelPhoneNumberMobile, value: mobileNumber)
        mutableContact.phoneNumbers = [phoneValue, mobileValue]
        
        //设置email
        let email = CNLabeledValue(label: CNLabelHome, value: "feifei@163.com" as NSString)
        mutableContact.emailAddresses = [email]
        
        //添加联系人请求
        let saveRequest = CNSaveRequest()
        saveRequest.add(mutableContact, toContainerWithIdentifier: nil)
        do {
            try store.execute(saveRequest)
        } catch {
            print(error)
        }
    }
    
    func editContact() {
        //创建通讯录对象
        let store = CNContactStore()
        
        //获取Fetch,并且指定要获取联系人中的什么属性
        let keys = [CNContactFamilyNameKey, CNContactGivenNameKey, CNContactNicknameKey]
        
        //创建请求对象，需要传入一个(keysToFetch: [CNKeyDescriptor]) 包含'CNKeyDescriptor'类型的数组
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        //遍历所有联系人
        do {
            try store.enumerateContacts(with: request, usingBlock: {
                (contact : CNContact, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
                
                let mutableContact = contact.mutableCopy() as! CNMutableContact
                
                //获取姓名
                let lastName = mutableContact.familyName
                let firstName = mutableContact.givenName
                //判断是否符合要求
                if lastName == "张" && firstName == "飞"{
                    //设置昵称
                    mutableContact.nickname = "小飞飞"
                    
                    //修改联系人请求
                    let request = CNSaveRequest()
                    request.update(mutableContact)
                    do {
                        //修改联系人
                        try store.execute(request)
                        print("修改成功!")
                    } catch {
                        print(error)
                    }
                }
            })
        } catch {
            print(error)
        }
    }
    
    func deleteContact() {
        //创建通讯录对象
        let store = CNContactStore()
        
        //获取Fetch,并且指定要获取联系人中的什么属性
        let keys = [CNContactFamilyNameKey, CNContactGivenNameKey, CNContactNicknameKey]
        
        //创建请求对象，需要传入一个(keysToFetch: [CNKeyDescriptor]) 包含'CNKeyDescriptor'类型的数组
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        //遍历所有联系人
        do {
            try store.enumerateContacts(with: request, usingBlock: {
                (contact : CNContact, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
                
                let mutableContact = contact.mutableCopy() as! CNMutableContact
                
                //获取姓名
                let lastName = mutableContact.familyName
                let firstName = mutableContact.givenName
                //判断是否符合要求
                if lastName == "张" && firstName == "飞"{
                    //删除联系人请求
                    let request = CNSaveRequest()
                    request.delete(mutableContact)
                    
                    do {
                        //执行操作
                        try store.execute(request)
                        print("删除成功!")
                    } catch {
                        print(error)
                    }
                }
            })
        } catch {
            print(error)
        }
    }
    
}

