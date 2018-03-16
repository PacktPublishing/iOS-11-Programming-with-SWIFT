import UIKit

struct MyStruct {
    var myProperty: String
    
    func myMethod() {
        print(myProperty)
    }
    
    mutating func changeProperty() {
        myProperty = "Something else"
    }
}

var myStruct = MyStruct(myProperty: "Hello there")
var myStruct2 = myStruct
myStruct.myProperty = "Goodbye"
myStruct.myMethod()
myStruct2.myMethod()

class MyClass {
    var myProperty: String
    
    init(myProperty: String) {
        self.myProperty = myProperty
    }
    
    func myMethod() {
        print(myProperty)
    }
    
    func changeProperty() {
        myProperty = "Something else"
    }
}

let myClass = MyClass(myProperty: "Hello there")
let myClass2 = myClass
myClass.myProperty = "Goodbye"
myClass.myMethod()
myClass2.myMethod()

