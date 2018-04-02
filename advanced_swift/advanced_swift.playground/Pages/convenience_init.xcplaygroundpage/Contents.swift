//: [Previous](@previous)

// Convenience Init
// Problem: I'm lasy. Can we initialize quickly?

class Human {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    // Convenience init itializes the designated init method
    convenience init() {
        self.init(name: "Uchenna the Developer")
    }
}

let uchenna = Human(name: "Uchenna")
let uch = Human()
uch.name


/*
    Real life Situation
*/

//import UIKit
//
//extension UIColor {
//    
//    convenience init(r: Float, g: Float, b: Float) {
//        self.init(colorLiteralRed: r/255, green: g/255, blue: b/255, alpha: 1)
//    }
//}
















