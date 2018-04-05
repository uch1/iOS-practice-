//: [Previous](@previous)

import Foundation

/*
Functional Programming
Intro to Functional Paradigm
 
 Problem: What is functional programming?

 Note: Functional Programming is nothing more than using functions to derive results
*/


// Non-functional programming

// Somewhere in ViewController
let numbers = [1, 2, 3]
var sum = 0
for number in numbers {
    sum += number
}
print(sum)

// Somewhere in NextViewController
let newNumbers = [4, 5, 6]
var newSum = 0
for newNumber in newNumbers {
    newSum += newNumber
}

func saveMeFromMadness(elements: [Int]) -> Int {
    var sum = 0
    for element in elements {
        sum += element
    }
    return sum
}

/*  Declarative: Functional
    The user does not care about the process
    Ex) Jump off from an airplace vs climbing
 
    Imperative: Non-Functional
    It tells you how you got the answer from A -> B.
    Ex) the for-in loop
 */

/*
 ### Benefits of Functional Programming
 - A functional paradigm ensures no mutability or no changes in state when used/No explicit state management
 - Modularity
 - Fewer lines of code
 - Conventional Communication 
*/































//: [Next](@next)
