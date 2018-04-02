//: Playground - noun: a place where people can play

import UIKit

// Protocol Extension
// The best code is no code at all. DRY

// Problem: I don't even want to type anymore.

protocol MathGenius {
    func calculateGPA()
}

extension MathGenius {
    func calculateGPA() {
        print("I'm too cool for school")
    }
}

struct Uchenna: MathGenius {
    func calculateGPA() {
        print("1.2 GPA")
    }
}
Uchenna().calculateGPA()

//: Practical Protocol Extension
protocol FindArea {
    func calulateArea(side: Double, length: Double) -> String
}

extension FindArea {
    func calulateArea(side: Double, length: Double) -> String {
        let area = side * length
        return "The area is \(area)"
    }
}

struct Square: FindArea {}
struct Hexagon: FindArea {}

Square().calulateArea(side: 3, length: 10)
Hexagon.init().calulateArea(side: 4, length: 30)

//: Usage Case
/*
 1. UILabel, UIImageView, UIView --> Animation
 2. Storyboard Identifier
 3. Reusable table and collection view cells
*/






















