/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Contacts
import AddressBook

let names = ["Lincoln", "Einstein", "Darwin", "Galilei", "Khan", "Newton", "Caesar", "Gandhi", "Bonaparte", "Mandela", "McCartney"]

class PersonPopulator {
    
    @available(iOS 9.0, OSX 10.11, *)
    class func generateContactInfo() -> (contact: CNContact, imageData: Data) {
        let randomName = names[Int(arc4random_uniform(UInt32(names.count)))]
        guard let path = Bundle.main.path(forResource: randomName, ofType: "vcf"),
            let contacts = try? CNContactVCardSerialization.contacts(with: Data(contentsOf: URL(fileURLWithPath: path))),
            let contact = contacts.first else {
                fatalError()
        }
        guard let imagePath = Bundle.main.path(forResource: randomName, ofType: "jpg"),
            let imageData = try? Data(contentsOf: URL(fileURLWithPath: imagePath)) else {
                fatalError()
        }
        return (contact, imageData)
    }
    
    @available(iOS, deprecated: 9.0, message: "Use generateContactInfo()")
    @available(OSX, deprecated:10.11, message:"Use generateContactInfo()")
    
    class func generateRecordInfo() -> (record: ABRecord, imageData: Data ) {
        let randomName = names[Int(arc4random_uniform(UInt32(names.count)))]
        guard let path = Bundle.main.path(forResource: randomName, ofType: "vcf") else { fatalError() }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) as CFData else { fatalError() }
        #if os(iOS)
            let person = ABPersonCreate().takeRetainedValue()
            let people = ABPersonCreatePeopleInSourceWithVCardRepresentation(person, data).takeRetainedValue()
            let record = NSArray(array: people)[0] as ABRecord
        #elseif os(OSX)
            let person = ABPersonCreateWithVCardRepresentation(data).takeRetainedValue() as AnyObject
            guard let record = person as? ABRecord else {
                fatalError()
            }
        #else
            fatalError()
        #endif
        guard let imagePath = Bundle.main.path(forResource: randomName, ofType: ".jpg"), let imageData = try? Data(contentsOf: URL(fileURLWithPath: imagePath)) else { fatalError() }
        return (record, imageData)
    }
    
}
