//: [Previous](@previous)

import Foundation
import UIKit

/*
    Object Orient Swift
    Override Method, Init, Property
 
    Problem: Super...Super.init?
*/

class MyViewController: UIViewController {
    // viewDidLoad() is built-in and it runs automatically
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
    }
}

class Vehicle {
    var description: String {
        return "Hello, I'm moving at 30km/hr"
    }
    
    func warning() {
        print("Be careful, I'm going pretty fast")
    }
}


// Override Method and Property

class ToyCar: Vehicle {
    
    override var description: String {
        return "\(super.description). Hey, but I'm small though"
    }
    
    override func warning() {
        print("hello, don't mind me")
        super.warning()
    }
    
}

print(ToyCar().description)
print(ToyCar().warning())

// super.init
class Human {
    var origin: String
    
    init(enterOrigin: String) {
        origin = enterOrigin
    }
}

//Human(enterOrigin: "Nigeria")

class American: Human {
    var city: String
    
    init(enterCity: String) {
        self.city = enterCity
        super.init(enterOrigin: "America")
    }
    
    init(enterCity: String, origin: String) {
        self.city = enterCity
        super.init(enterOrigin: origin)
    }
}

let uchenna = American(enterCity: "San Francisco", origin: "America")
uchenna.city
uchenna.origin

// Override Init
class Tesla {
    var numberOfWheels: Int
    
    init(enterWheelNumber: Int) {
        numberOfWheels = enterWheelNumber
    }
}

class ModelS: Tesla {
    override init(enterWheelNumber: Int) {
        super.init(enterWheelNumber: enterWheelNumber)
        print("Wow, this is a beautiful car")
    }
}













//: [Next](@next)
