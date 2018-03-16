//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello, world!"

print(str)

let str1 = "Hello, world!"

struct Length {
    var inches: Double
    
    var feet: Double {
        get {
            return inches / 12
        }
        set {
            inches = newValue * 12
        }
    }
}

var length = Length(inches: 12)

print(length.inches)
print(length.feet)

length.feet = 2

print(length.inches)
