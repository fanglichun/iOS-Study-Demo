//
//  ViewController.swift
//  Alamfire
//
//  Created by mfang032 on 31/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        ServiceManager.shared.downloadImage("https://httpbin.org/image/png")
        
        ServiceManager.shared.request(URL: "https://httpbin.org/get") { (success, data, error) in
            if success {
                if let dict = data as? [String: AnyObject] {
                    print(dict)
                }
            } else {
                print("error desc:\(error?.localizedDescription ?? "")")
            }
        }
 */
        
        
//        ServiceManager.shared.validate()
        
//        ServiceManager.shared.getRequest(URL: "") { (succes, response, error) in
//            print(response ?? "")
//        }
        
        
//        authorizate()
        
        URLRequest
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController {
    
    
    func ncodingParameters() {
        let url = URL(string: "https://httpbin.org/get")
        let urlRequest = URLRequest(url: url!)
        let parameter: Parameters = ["name": ""]
        do {
            let encodeURLRequest = try URLEncoding.queryString.encode(urlRequest, with: parameter)
            print(encodeURLRequest)
        } catch {
        }
        
        let header: HTTPHeaders = ["Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
                                   "Accept": "application/json"]
        
        
        Alamofire.request("", method: HTTPMethod.get, parameters: parameter, headers: header).responseJSON { (response) in
            
        }
    }
    
    func authorizate() {
        let user = "user"
        let password = "password"
        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request("https://httpbin.org/basic-auth/user/password",headers: headers).responseJSON { (resposne) in
            debugPrint(resposne)
        }
        
        
        
    }
}
