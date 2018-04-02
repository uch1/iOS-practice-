//: [Previous](@previous)

import Foundation

// Type Property and Method
// Im confused about by Static, Final, Class. What are those?


// Struct: Only Static
struct SomeStructure {
    static var storedProperty = "Some Value"
    static var computedProperty: Int {
        get {
            return 120
        }
        set(newValue) {
            print("You've set to \(newValue)")
        }
    }
    
    static func hello() {
        print("hello")
    }
    
}

SomeStructure.storedProperty
SomeStructure.computedProperty
SomeStructure.hello()


// Class: class and static
class GrandParent {
    static var numberOfYearsInMarriage = 30
    static func introduce() {
        print("We've been married for \(numberOfYearsInMarriage)")
    }
    
    class func introduced() {
        print("We've been married for \(numberOfYearsInMarriage)")
    }
    
    final func cantOverride() {
        print("You can't change me.")
    }
}
GrandParent.introduce()

// Static can't be overriden
class Parent: GrandParent {
    override class func introduced() {
        print("I am your father")
    }
    
}


// Application
struct BluetoothID {
    struct iPhone {
        static let iPhone4 = ""
        static let iPhone5 = ""
        static let iPhone6 = ""
    }
}
BluetoothID.iPhone.iPhone4

// Alternative
enum AirDropID: String {
    case iPhone4 = "4"
    case iPhone5 = "5"
    case iPhone6 = "6"
    
    var description: String {
        return self.rawValue
    }
}

AirDropID.iPhone6.description



//: [Next](@next)
