//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str1 = "Hello, world!"

if true {
    print("This statement is true")
} else {
    print("This statement will never be run.")
}

let x = 5

if x == 5 {
    print("X is 5")
} else {
    print("X is not 5")
}

let y = 5

if x == 5 && y == 5 {
    print("X and Y are both 5")
} else if x == 5 && y != 5 {
    print("X is 5, but Y is not")
} else if x != 5 && y == 5 {
    print("X is not 5, but Y is")
} else {
    print("X and Y are not 5")
}

switch (x, y) {
case (5, 5): print("X and Y are both 5")
case (5, _): print("X is 5, but Y is not")
case (_, 5): print("X is not 5, but Y is")
default: print("X and Y are not 5")
}

let arrayOfNumbers = [1, 3, 5, 6, 8, 10, 12, 13]
for number in arrayOfNumbers {
    if number % 2 == 0 {
        print("\(number) is even.")
    } else {
        print("\(number) is odd.")
    }
}
