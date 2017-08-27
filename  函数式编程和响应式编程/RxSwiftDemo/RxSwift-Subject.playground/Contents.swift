//: Playground - noun: a place where people can play

import UIKit
import RxSwift

public func example(of description:String, action:() ->Void) {
    print("\n--- Example of:", description, "---")
    action()
}


example(of: "") { 
    let subject = PublishSubject<String>()
    subject.onNext("Is anyone listening?")
    let subscriptionOne = subject.subscribe(onNext: { (string) in
        print(string)
    })
    subject.on(.next("1"))
    subject.onNext("2")
    let subscriptTwo = subject
        .subscribe({ (event) in
        print("2)", event.element ?? event)    })
    subject.onNext("3")
    subscriptionOne.dispose()
    subject.onNext("4")
    
    //When a publish subject receives a .completed or .error event, aka a stop event, it
    //will emit that stop event to new subscribers and it will no longer emit .next events.
    subject.onCompleted()
    subject.onNext("5")
    subscriptTwo.dispose()
    
    let disposeBag = DisposeBag()
    
    subject
        .subscribe({
        print("3)", $0.element ?? $0)
    })
        .addDisposableTo(disposeBag)
    subject.onNext("?")
}

enum MyError: Error {
    case anError
}

func print<T: CustomStringConvertible>(label: String, event: Event<T>) {
    
    print(label, event.element ?? event.error ?? event)
}

example(of: "BehaviorSubject") { 
    let subject = BehaviorSubject(value: "Initial Value")
    let disposeBag = DisposeBag()
    subject.onNext("X")
    subject
        .subscribe({
            print(label: "1)", event: $0)
        })
        .addDisposableTo(disposeBag)
    subject.onError(MyError.anError)
    subject
        .subscribe({
            print(label: "2)", event: $0)
        })
        .addDisposableTo(disposeBag)
}

example(of: "ReplaySubject") {
    // 1
    let subject = ReplaySubject<String>.create(bufferSize: 2)
    let disposeBag = DisposeBag()
    // 2
    subject.onNext("1")
    subject.onNext("2")
    subject.onNext("3")
    // 3
    subject
        .subscribe {
            print(label: "1)", event: $0)
        }
        .addDisposableTo(disposeBag)
    subject
        .subscribe {
            print(label: "2)", event: $0)
        }
        .addDisposableTo(disposeBag)
    
    subject.onNext("4")
    subject
        .subscribe {
            print(label: "3)", event: $0)
        }
        .addDisposableTo(disposeBag)
    subject.onError(MyError.anError)
    subject.dispose()
    
}

example(of: "Variable") {
    // 1
    var variable = Variable("Initial value")
    let disposeBag = DisposeBag()
    variable.value = "New initial value"
    
    variable.asObservable()
        .subscribe({
            print(label: "1", event: $0)
        })
        .addDisposableTo(disposeBag)
    variable.value = "1"
    
    variable.asObservable()
        .subscribe({
            print(label: "2", event: $0)
        })
        .addDisposableTo(disposeBag)
    variable.value = "3"
    
    
}

















