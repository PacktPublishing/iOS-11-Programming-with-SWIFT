//: Playground - noun: a place where people can play

import UIKit

func doSomething() {
    print("Do Something")
}

doSomething()

func doSomethingWithAParameter(aParameter: String) {
    print(aParameter)
}

doSomethingWithAParameter(aParameter: "Something")

func doSomethingWithoutAnExternalParameter(_ aParameter: String) {
    print(aParameter)
}

doSomethingWithoutAnExternalParameter("No external Parameter")

func doSomethingWithAReturnValue() -> String {
    return "DoSomething"
}

print(doSomethingWithAReturnValue())

struct AMethodInAStruct {
    func doSomething() {
        print("Do Something")
    }
}












