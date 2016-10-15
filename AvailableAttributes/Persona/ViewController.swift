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

import UIKit
import Contacts
import AddressBook

class ViewController: UIViewController {

  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    getNewData()
  }
  
  @IBAction func getNewData(){
    if #available(iOS 9.0, *) {
        let (contact, imageData) = PersonPopulator.generateContactInfo()
        profileImageView.image = UIImage(data: imageData)
        titleLabel.text = contact.jobTitle
        nameLabel.text = "\(contact.givenName) \(contact.familyName)"
    } else {
        let (record, imageData) = PersonPopulator.generateRecordInfo()
        let firstName = ABRecordCopyValue(record, kABPersonFirstNameProperty).takeRetainedValue() as? String
        let lastName = ABRecordCopyValue(record, kABPersonLastNameProperty).takeRetainedValue() as? String
        profileImageView.image = UIImage(data: imageData)
        titleLabel.text = ABRecordCopyValue(record, kABPersonJobTitleProperty).takeRetainedValue() as? String
        nameLabel.text = "\(firstName) \(lastName)"
        
    }
    
  }

}

