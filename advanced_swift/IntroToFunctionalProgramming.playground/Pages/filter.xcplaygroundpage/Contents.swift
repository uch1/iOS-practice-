//: Playground - noun: a place where people can play

import UIKit
import Foundation

/*
Filter
Problem: How to get things done with one line of code?
 
 Note: Most people use Swift functions without knowing the behind implementation
*/
//: Imperative/Non-functional
// Get even numbers
var evens = [Int]()

for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}

//: Declarative/Functional
Array(1...10).filter { (number) in number % 2 == 0 }
Array(1...10).filter { $0 % 2 == 0 }

// Becoming an A student
let recentGrades = ["A", "A", "A", "A", "A", "A", "B", "D"] // It can be any data

//: Imperative/Non-functional
var happyGrades: [String] = []

for grade in recentGrades {
    if grade == "A" {
        happyGrades.append(grade)
    } else {
        print("My mom isn't happy")
    }
}

print(happyGrades)


// Functional Way

// Create closure block that returns true/false

var isMomHappy: (String) -> Bool = { (grade) in
    return grade == "A"
}

isMomHappy = { $0 == "A" }
isMomHappy("A")
isMomHappy("B")


//: Create function that takes the closure

func simpleStringFilter(grades: [String], operation: (String) -> Bool) -> [String] {
    var happyGrades: [String] = []
    
    for grade in grades {
        if operation(grade) {
            happyGrades.append(grade)
        } else {
            print("Not the grade I wanted")
        }
    }
    
    return happyGrades
}

simpleStringFilter(grades: recentGrades, operation: isMomHappy)
simpleStringFilter(grades: recentGrades, operation: { grade in return grade == "A"})
simpleStringFilter(grades: recentGrades) { grade in return grade == "A"}


func myFilter<T>(array: [T], operation: (T) -> Bool) -> [T] {
    var results: [T] = []
    for element in array {
        if operation(element) {
            results.append(element)
        } else {
            print("Not the grade I wanted")
        }
    }
    return results
}

//: Ex 1) Filter Numbers
let AStudent = myFilter(array: Array(1...1000), operation: { $0 > 93 && $0 <= 100 })
print(AStudent)

//: Ex 2) Vote Counting
let answers = [true, false, true, true, false, true, false, true, false, true]
let trueAnswers = myFilter(array: answers, operation: { $0 == true })
print(trueAnswers)

//: Trailing Closure
let falseAnswer = myFilter(array: answers) { $0 == false }

//: The built-in Filter Functional
let zeroToHund = Array(1...100)
zeroToHund.filter { $0 % 2 == 0 }.filter { $0 <= 50 }


extension Array {
    func myFilter(_ logic: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for item in self {
            if logic(item) {
                result.append(item)
            }
        }
        return result
    }
}

let result = Array(1...100).myFilter { $0 % 2 == 0 }
































