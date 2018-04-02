//: [Previous](@previous)

import Foundation

/*
Protocol Orient Swift
Intro to Protocols

Problem: Protocols, who are you?
*/

/*
Drawbacks of OOP
 1. When you subclass, you have to inherit properties and methods which you may not need. The object becomes unnecessarily bloated.
 2. When you make a lot of super classes, it becomes extremely hard to navigate between each class and fix bugs/edit.
 3. Since objects are referencing to the same place in memory, if you make a copy and create a small change its property, it can mess up the rest. (Mutability due to reference)
 */

/*
 Note: Protocol is like a basketball coach. He/she tells players what to do, but he/she doesn't know how to dunk.
*/

protocol Human {
    var name: String { get set }
    var race: String { get set }
    func sayHi()
}

//: Protocol Inheritance
protocol SuperHuman: Human {
    var canFly: Bool { get set }
    func puch()
}

struct Nigeria: Human {
    var name: String = "Uchenna Aguocha"
    var race: String = "African"
    func sayHi() {
        print("My name is \(name) and I'm an \(race)")
    }
}

// { get set } only applies to computed properties
protocol Breathable {
    var isBreathing: Bool { get set }
    var isLiving: Bool { get }
}

struct Person: Breathable {
    var isBreathing: Bool {
        get { return true }
        set {}
    }
    
    var isLiving: Bool {
        get { return true }
        set {}
    }
}

// { get }
// Stored Property (Okay)
// Computed Property --> Gettable, Settable (Optional)

// { get set }
// Stored Property (Okay)
// Computed Property --> Gettable, Settable (Must)





















