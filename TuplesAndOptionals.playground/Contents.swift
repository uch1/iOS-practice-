//: Playground - noun: a place where people can play

import UIKit

// What are tuples?
let regularVariable = 1

let person = ("Billy", "Bob", "Johnson")
print(person.0, person.1, person.2)

let p = (firstName: "Billy", middleName: "Bob", lastName: "Johnson")
print(p.firstName, p.lastName)

func multiply(x: Int, y: Int) -> Int {
    return x * y
}

multiply(x: 4, y: 3)

// will use a tuple as return value

func divide(x: Int, y: Int) -> (Int, Int) {
    let quotient = x / y
    let remainder = x % y
    return (quotient, remainder)
}

let result = divide(x: 7, y: 2)
result.0

// lets try to use optionals inside of tuples somehow

func topTwoLongestNames(names: [String]) -> (String?, String?) {
    // lets sort first
    
    if names.isEmpty {
        return (nil, nil)
    }
    
    let sortedList = names.sorted { (x, y) -> Bool in
        return x.count > y.count
    }
    
    if sortedList.count == 1 {
        return (sortedList[0], nil)
    }
    
    return (sortedList[0], sortedList[1])
}

let returnValue = topTwoLongestNames(names: ["Mike", "Bill", "Steve", "Samantha"])
returnValue.0
returnValue.1








