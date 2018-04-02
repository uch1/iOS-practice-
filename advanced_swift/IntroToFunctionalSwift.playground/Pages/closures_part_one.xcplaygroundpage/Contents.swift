//: [Previous](@previous)

import Foundation


//: Introduction to functional programming in Swift
//: Intro to Closures Part 1

// Problem: Who are you closures, () -> ()?

/*
 Note:
    - A closure is a function without a name and func keyword
    - Quick and easy to carry around as variable/constant or just as a parameter
*/

// Function and two ints
func addTwoNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

addTwoNumbers(number1: 2, number2: 3)

// variable function
var addFunction = addTwoNumbers
addFunction(3, 3)

var addClosures: (Int, Int) -> (Int) = { (number1: Int, number2: Int) in
    return number1 + number2
}
addClosures(10, 10)

var addClosuresTwo = { (number1: Int, number2: Int) in
    return number1 + number2
}

var addClosuresThree: (Int, Int) -> (Int) = { $0 + $1 }
addClosuresThree(2, 3)

var addClosuresFour = { (num1: Int, num2: Int) in
    return num1 + num2
}

//: One example with () -> String
func callString() -> String {
    return "closures are better"
}
callString()

var callStringTwo: () -> String = { () in
    return "closures are cool"
}
callStringTwo()

var callStringThree = { () in
    return "closures are cool"
}

// Skip the return and shorter version 
var callStringFour: () -> String = {
    "closures look weird"
}

var callStringFive = { "closures look weird" }











//: [Next](@next)
