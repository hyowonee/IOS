//: Playground - noun: a place where people can play

import UIKit

enum Error {
    case NotFound
    case NotAuth
    case InternalServerError(String)
}

var error = Error.InternalServerError("몰라요")

switch error {
case .NotFound:
    print("없대요")
case .NotAuth:
    print("로그인하세요")
case .InternalServerError(let reason):
    print(reason)
}
