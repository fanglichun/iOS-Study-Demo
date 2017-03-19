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

import Foundation

public class DataManager {
  
  public class func getTopAppsDataFromFileWithSuccess(success: @escaping ((_ data: Data) -> Void)) {
    DispatchQueue.global(qos: .background).async {
      let filePath = Bundle.main.path(forResource: "topapps", ofType:"json")
      let data = try! Data(contentsOf: URL(fileURLWithPath:filePath!), options: .uncached)
      
      success(data)
    }
  }
  
  public class func loadDataFromURL(url: URL, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
    let loadDataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let _ = error {
        completion(nil, error)
      } else if let response = response as? HTTPURLResponse {
        if response.statusCode != 200 {
          let statusError = NSError(domain: "com.raywenderlich",
                                    code: response.statusCode,
                                    userInfo: [NSLocalizedDescriptionKey: "HTTP status code has unexpected value."])
          completion(nil, statusError)
        } else {
          completion(data, nil)
        }
      }
    }
    loadDataTask.resume()
  }
}
