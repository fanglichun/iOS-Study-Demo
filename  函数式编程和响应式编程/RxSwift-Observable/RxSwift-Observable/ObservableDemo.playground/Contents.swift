//: Playground - noun: a place where people can play

import UIKit

import RxSwift

public func example(of description:String, action:() ->Void) {
    print("\n--- Example of:", description, "---")
    action()
}

let observer = NotificationCenter.default.addObserver(
    forName: .UIKeyboardDidChangeFrame,
    object: nil,
    queue: nil
)   { (notification) in
    
}

let sequence = 0..<3
var iterator = sequence.makeIterator()
while let n = iterator.next() {
        print(n)
}




example(of: "just, of, from") {
    let one = 1
    let two = 2
    let three = 3
    let observable: Observable<Int> = Observable<Int>.just(one)
    let observable2 = Observable.of(one, two, three)
    let observable3 = Observable.of([one, two, three])
    let observable4 = Observable.from([one, two, three])
    observable.subscribe({ (event) in
        if let element = event.element {
            print(element)
        }
    })
    observable.subscribe(onNext: { (element) in
        print(element)
    })
}
example(of: "empty") {
    let observable = Observable<Void>.empty()
    observable.subscribe(onNext: { (element) in
        print(element)
    }, onError: { (error) in
        print(error)
    }, onCompleted: {
        print("Completed")
    }, onDisposed: {
    })
}
example(of: "Never") {
    //As opposed to the empty operator,
    //the never operator creates an observable
    //that doesn’t emit anything and never terminates.
    
    let observable = Observable<Any>.never()
    observable.subscribe(onNext: { (element) in
        print(element)
    }, onCompleted: {
        print("Completed")
    })
}
example(of: "Range") {
    let observable = Observable<Int>.range(start: 1, count: 10)
    observable.subscribe(onNext: { (i) in
        //        print(i)
        let n = Double(i)
        let fibonacci = Int(((pow(1.61803, n) - pow(0.61803, n)) /
            2.23606).rounded())
        print(fibonacci)
    })
}

example(of: "Dispose") {
    let observable = Observable.of("A", "B", "C")
    let subscription = observable.subscribe({ (event) in
        print(event)
    })
    subscription.dispose()
}

example(of: "DisposeBag") {
    let disposeBag = DisposeBag()
    Observable.of("A", "B", "C")
        .subscribe {
            print($0)
        }
        .addDisposableTo(disposeBag)
}


example(of: "Create") {
    enum MyError: Error {
        case anError
    }
    let disposeBag = DisposeBag()
    Observable<String>.create({ (observe) -> Disposable in
        observe.onNext("1")
        //        observe.onError(MyError.anError)
        //        observe.onCompleted()
        observe.onNext("?")
        return Disposables.create()
    })
        .subscribe(onNext: { print($0) },
                   onError: { print($0) },
                   onCompleted: { print("Completed") },
                   onDisposed: { print("Disposed")}
    )
    //    .addDisposableTo(disposeBag)
}

example(of: "deferred") {
    let disposeBag = DisposeBag()
    var flip = false
    let factory: Observable<Int> = Observable.deferred({
        flip = !flip
        if flip {
            return Observable.of(1, 2, 3)
        } else {
            return Observable.of(4, 5, 6)
        }
    })
    for _ in 0...3 {
        factory.subscribe(onNext: {
            print($0, terminator: "")
        })
            .addDisposableTo(disposeBag)
        print()
    }
}

example(of: "never") {
    
    let observable = Observable<Any>.never()
    
    let disposeBag = DisposeBag()
    
    observable
        .do(onSubscribe: {
            print("Subscribed")
        })
        .subscribe(
            onNext: { element in
                print(element)
        },
            onCompleted: {
                print("Completed")
        },
            onDisposed: {
                print("Disposed")
        }
        )
        .addDisposableTo(disposeBag)
}

example(of: "never") {
    
    let observable = Observable<Any>.never()
    
    let disposeBag = DisposeBag()
    
    observable
        .debug()
        .subscribe(
            onNext: { element in
                print(element)
        },
            onCompleted: {
                print("Completed")
        },
            onDisposed: {
                print("Disposed")
        }
        )
        .addDisposableTo(disposeBag)
}

