//: Playground - noun: a place where people can play

import UIKit
import RxSwift


public func example(of description:String, action:() ->Void) {
    print("\n--- Example of:", description, "---")
    action()
}
//Subjects act as both an observable and an observer
example(of: "PublishSubject") { 
    let subject = PublishSubject<String>()
    subject.onNext("Is anyone listening?")
    let subscriptionOne = subject
        .subscribe(onNext: { (string) in
        print(string)
    })
    subject.on(.next("1"))
    subject.onNext("2")
}


