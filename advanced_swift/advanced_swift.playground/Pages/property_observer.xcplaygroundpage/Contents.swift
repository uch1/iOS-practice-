//: [Previous](@previous)

import Foundation


// Property Observer
// Problem: How can I add observer/tracker to a property?

// willSet is called just before the value is stored.
// didSet is called immediately after the new value has been stored.

var myGrade: Int = 80 {
    willSet(newGrade) {
        print("About to change your grade to \(newGrade)")
    }
    didSet(oldGrade) {
        print("You had \(oldGrade) previously. Now you have \(myGrade)")
    }
}

myGrade = 100

// Step Counter
var totalSteps: Int = 20 {
    
    willSet(newTotalSteps) {
        print("About to set totalSteps to \(newTotalSteps)")
    }
    
    didSet(oldTotalSteps) {
        if totalSteps > oldTotalSteps {
            print("Added \(totalSteps - oldTotalSteps) steps")
        }
    }
    
}

totalSteps = 50
totalSteps = 45



// Application
var isUserLoggedIn: Bool = false {
    willSet(newValue) {
        print("The user has tried logging in")
    }
    
    didSet(userNotLoggedIn) {
        if isUserLoggedIn {
            print("The user has switched from \(userNotLoggedIn) to \(isUserLoggedIn)")
            // background color
            // Animation
            // Pop Up
            // All kinds of stuff
        }
    }
}

// Similarity with Computed Property
/*
    1. Always recalculated 
*/

// What makes Property Observers different
/*
    1. There is a default value and it is observed rather than calculated.
    2. willSet and didSet will not get called when you initialize it 
*/





























































//: [Next](@next)
