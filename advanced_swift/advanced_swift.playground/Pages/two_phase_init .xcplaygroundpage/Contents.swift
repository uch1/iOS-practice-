//: [Previous](@previous)

import Foundation

/*
    Intro to Two Phase Init
    Problem: How can one init init the other?
*/

struct NuclearRocket {
    var meters: Double
    var liters: Double
    
    // Init for 🇳🇬
    init(meters: Double, liters: Double) {
        self.meters = meters
        self.liters = liters
    }
    
    // Init for 🇺🇸
    init(feet: Double, gallon: Double) {
        let convertedMeters = feet / 3.28
        let convertedLiters = gallon * 3.78
        
        self.init(meters: convertedMeters, liters: convertedLiters)
    }
}

// 🇳🇬 Scientist
var rocket = NuclearRocket(meters: 20, liters: 20)
rocket.liters

//  🇺🇸 Scientist
var newRocket = NuclearRocket(feet: 300, gallon: 2)
newRocket.liters
newRocket.meters





























































//: [Next](@next)
