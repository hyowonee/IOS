//: Playground - noun: a place where people can play

import UIKit

protocol Subscriber { // Subscriber는 Publisher에 의존한다.
    func receive()
}

protocol Publisher { // Publisher는 Subscriber에게 이벤트를 전달한다.
    func add(subscriber: Subscriber)
    func delete(index: Int)
    func publish()
}

class NewsSubscriber: Subscriber { // Subscriber protocol을 상속받아서 method override를 해준다.
    func receive() {
        print("받았습니다~") // Publisher로부터 받은 이벤트를 처리하는 부분
    }
}

class NewsSubscriber2: Subscriber {
    func receive() {
        print("I got it~") // 이벤트 내용을 다르게 바꿀 수 있다.
    }
}

class NewsPublisher: Publisher { // Publisher protocol을 상속받아서 method override를 해준다.
    var subscribers: [Subscriber] = []
    
    func add(subscriber: Subscriber) { // Subscriber를 추가할 수 있다.
        self.subscribers.append(subscriber)
    }
    
    func delete(index: Int) { // Subscriber를 삭제할 수 있다.
        self.subscribers.remove(at: index)
    }
    
    func publish() { // Subscriber들에게 이벤트를 전달하는 method
        print("발행 시작!")
        for subscriber in subscribers {
            subscriber.receive()
        }
    }
}

let newsPublisher = NewsPublisher() // NewsPublisher 추가
newsPublisher.add(subscriber: NewsSubscriber()) // Subscriber 추가
newsPublisher.add(subscriber: NewsSubscriber2()) // Subscriber 추가
newsPublisher.add(subscriber: NewsSubscriber()) // Subscriber 추가

print("Publisher 생성")

print("Publish 시작")
newsPublisher.publish()
