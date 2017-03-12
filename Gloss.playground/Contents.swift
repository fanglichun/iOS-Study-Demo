/**
 * Copyright (c) 2017 Razeware LLC
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
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

DataManager.getTopAppsDataFromItunesWithSuccess { (data) -> Void in
  
  var json: Any
  do {
    json = try JSONSerialization.jsonObject(with: data)
  } catch {
    print(error)
    PlaygroundPage.current.finishExecution()
  }
  
  guard let dictionary = json as? [String: Any] else {
    PlaygroundPage.current.finishExecution()
  }

  guard let topApps = TopApps(json: dictionary) else {
    print("Error initializing object")
    PlaygroundPage.current.finishExecution()
  }
    
  guard let firstItem = topApps.feed?.entries?.first else {
    print("No such item")
    PlaygroundPage.current.finishExecution()
  }
    
  print(firstItem)
    
  PlaygroundPage.current.finishExecution()
}
