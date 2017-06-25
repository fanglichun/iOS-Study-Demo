/*
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

import Foundation

// Notification when new photo instances are added
let photoManagerContentAddedNotification = "com.raywenderlich.GooglyPuff.PhotoManagerContentAdded"
// Notification when content updates (i.e. Download finishes)
let photoManagerContentUpdatedNotification = "com.raywenderlich.GooglyPuff.PhotoManagerContentUpdated"

// Photo Credit: Devin Begley, http://www.devinbegley.com/
let overlyAttachedGirlfriendURLString = "http://i.imgur.com/UvqEgCv.png"
let successKidURLString = "http://i.imgur.com/dZ5wRtb.png"
let lotsOfFacesURLString = "http://i.imgur.com/tPzTg7A.jpg"

typealias PhotoProcessingProgressClosure = (_ completionPercentage: CGFloat) -> Void
typealias BatchPhotoDownloadingCompletionClosure = (_ error: NSError?) -> Void

private let _sharedManager = PhotoManager()

class PhotoManager {
  class var sharedManager: PhotoManager {
    return _sharedManager
  }
  
  fileprivate var _photos: [Photo] = []
  
  // Tutorial step: handling readers, writers problem
  fileprivate let concurrentPhotoQueue =
    DispatchQueue(
      label: "com.raywenderlich.GooglyPuff.photoQueue",
      attributes: .concurrent)
  
  var photos: [Photo] {
    // Tutorial step: handling readers, writers problem
    var photosCopy: [Photo]!
    concurrentPhotoQueue.sync {
      photosCopy = self._photos
    }
    return photosCopy
  }
  
  func addPhoto(_ photo: Photo) {
    // Tutorial step: handling readers, writers problem
    concurrentPhotoQueue.async(flags: .barrier) {
      self._photos.append(photo)
      DispatchQueue.main.async {
        self.postContentAddedNotification()
      }
    }
  }
  
  func downloadPhotosWithCompletion(_ completion: BatchPhotoDownloadingCompletionClosure?) {
    var storedError: NSError?
    for address in [overlyAttachedGirlfriendURLString,
                    successKidURLString,
                    lotsOfFacesURLString] {
                      let url = URL(string: address)
                      let photo = DownloadPhoto(url: url!) {
                        _, error in
                        if error != nil {
                          storedError = error
                        }
                      }
                      PhotoManager.sharedManager.addPhoto(photo)
    }
    
    completion?(storedError)
  }
  
  fileprivate func postContentAddedNotification() {
    NotificationCenter.default.post(name: Notification.Name(rawValue: photoManagerContentAddedNotification), object: nil)
  }
}
