//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Blah {
    func action()
}

extension Blah where Self: NSObject {
    func say() {
        print("Say")
    }
}

class Object: NSObject, Blah {
    override init() {
        super.init() 
        self.action()
        self.say()
    }
    
    func action() {
        print("Action")
    }
}

class Object2: Blah {
    init() {
        self.action()
    }
    
    func action() {
        print("Action2")
    }
}

let object = Object()
let object2 = Object2()
