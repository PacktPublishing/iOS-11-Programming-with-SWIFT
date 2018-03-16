//: Playground - noun: a place where people can play

import UIKit

enum OurOptional<T> {
    case some(T)
    case none
    
    init(_ value: T) {
        self = .some(value)
    }
    
    init() {
        self = .none
    }
    
    func unwrap() -> T {
        switch self {
        case .some(let x):
            return x
        case .none:
            fatalError()
        }
    }
}

var ourOptionalString = OurOptional("Hello")
var ourNilString = OurOptional<String>()
let string = ourOptionalString.unwrap()

struct Person {
    var givenName: String
    var middleName: String? = nil
    var surname: String
    
    var fullName: String {
        return "\(givenName) \(middleName ?? "") \(surname)"
    }
}

let mike = Person(givenName: "Michael", middleName: "James", surname: "Huber")
print(mike.fullName)
