//: Playground - noun: a place where people can play

import UIKit

//: Playground - noun: a place where people can play

import UIKit
typealias AddBlock = (Int, Int) ->Int


let add: (Int, Int) -> Int = {
    $0 + $1
}

let add1: AddBlock = {
    $0 + $1
}


let result = add(100, 100)

let result1 = add1(100, 100)
print(result)
func post(urlString: String, success: (String) ->Void) {
    success("request completed")
}


post(urlString: "") { (json) in
    print(json)
}
post(urlString: "", success:  {
    print($0)
})


func requestData(urlString:String,succeed: @escaping (Any?)->(Void),failure:@escaping (Any?)->(Void)){
    
    let request = URLRequest(url: URL(string: urlString)!);
    
    //发送网络请求
    
    NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue()) { (_, data, error) in
        if error == nil {
            //请求成功，执行成功的回调，并把数据传递出去
            succeed(data);
        }else{
            //请求失败，执行失败的回调，并把错误传递出去
            failure(error);
        }
    }
}