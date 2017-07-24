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
    
    let subscriptionTwo = subject
        .subscribe({ (event) in
        print("2)", event.element ?? event)
    })
    subject.onNext("3")
    subscriptionOne.dispose()
    subject.onNext("4")
    
    subject.onCompleted()
    subject.onNext("5")
    subscriptionTwo.dispose()
    
    let disposeBag = DisposeBag()
    subject
        .subscribe({
            print("3)", $0.element ?? $0)
        })
        .addDisposableTo(disposeBag)
    subject.onNext("?")
}






