//: [Previous](@previous)
import Foundation


/*
 Swift Memory Management
 Intro to Memory Management
 
 Problem: Deallocate and allocate object in ARC

 What is memory?
 1. RAM: Fridge
 2. DISK: Storage 
 
 */


class Passport {
    var human: Human?
    var citizenship: String
    
    init(citizenship: String) {
        self.citizenship = citizenship
        print("\(citizenship) passport generated")
    }
    
    deinit {
        print("I, paper, am gone")
    }
}

class Human {
    weak var passport: Passport?
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) generated")
    }
    
    deinit {
        print("I, \(name), gone")
    }
}


//: Automatic Reference Counting

//: Create Instance
var uchenna: Human? = Human(name: "Uchenna")
var myPassport: Passport? = Passport(citizenship: "American")


uchenna?.passport = myPassport
myPassport?.human = uchenna

uchenna = nil
myPassport = nil

/*
 Note:
 The Only Rule: if the reference count is zero/no relationship, the object gets purged out of memory
*/














//: [Next](@next)
