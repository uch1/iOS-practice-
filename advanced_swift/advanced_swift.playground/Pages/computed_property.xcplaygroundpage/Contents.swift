//: [Previous](@previous)

// Computed Property
// Problem: Do we have to make functions all the time to calculate something?

func getDiameter(radius: Double) -> Double {
    return radius * 2
}

func getRadius(diameter: Double) -> Double {
    return diameter / 2
}

getDiameter(radius: 10) // return 20

// Introducing Computed Property
/*
    Note
    computed = calculated
 
    Gettable Property
    Note
    Create a variable that only can be read. It can't be modified
*/

class NumberClass {
    var readableNumber: Double {
        get {
            return 666
        }
    }
    
    var readableNumbers: Double {
        return 7868
    }
}

NumberClass().readableNumber

// Settable Property
var radius: Double = 10

var diameter: Double {
    get {
        return radius * 2
    }
    
    set {
        radius = newValue / 2
    }
}

diameter = 30

//diameter = 50
//radius

import Foundation
// Finding Area
var side: Double = 100

var area: Double {
    get {
        return side * side
    }
    
    set {
        side = sqrt(newValue)
    }
}

area

/* Applications
    1. Grabbing and storing data from the server // unchageable
    2. Propagating relationships between properties
    3. Preventing others from manipulating your code
*/

















//: [Next](@next)
