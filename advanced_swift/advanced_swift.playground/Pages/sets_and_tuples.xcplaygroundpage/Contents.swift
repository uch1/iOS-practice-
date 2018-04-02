/*
    Set and Tuple
 Problem:
 1. I'd love to eliminate duplicate items (set)
 2. I'd love to combine all kinds of types (tuple)
*/



// Multiple ways to create Sets
var setOne: Set = [1, 2, 3, 4, 5, 6, 6]
var setTwo: Set<String> = ["Uchenna", "Aguocha", "Aguocha"]
var setThree = Set<String>()
var setFour = Set(["Uchenna", "Aguocha", "Aguocha"])

// Built in Set Methods
setThree.insert("hello")
setThree.contains("hello")
setThree.remove("hello")


var oddNumbers = [1, 3, 5, 7, 9, 11]
var evenNumbers = [2, 4, 6, 8 , 10, 12]

var oddNumberSet = Set(oddNumbers)
var evenNumberSet = Set(evenNumbers)

//Set methods
//: Union
print(oddNumberSet.union(evenNumberSet))

//: SymmetricDifference
oddNumberSet.symmetricDifference(evenNumberSet)

//: Intersection
oddNumberSet.intersection(evenNumberSet)

//: Subtraction
oddNumberSet.subtract(evenNumberSet)


//: Filter/Sort
// Convert sets to sorted array
let sortedArray = evenNumberSet.sorted()
print(sortedArray)

// Functional Programming
let sortedArrayFromHighToLow = evenNumberSet.sorted { $0 > $1 }
print(sortedArrayFromHighToLow)

//: Practical Usage of Set
// 1. Finding unique letters
// 2. Finding unique visitors
// 3. Any game logic


let firstScore = (name: "Bob", score: 9)
firstScore.0
firstScore.1

firstScore.name
firstScore.score

//: Practical Usage
let httpSuccess = (code: 200, description: "success")
httpSuccess.code


//: Bonus Tips
// Okay
var dog = "dog", cat = "cat"
print(dog)

var (x, y, z) = (1, 2, 3)
print(x)

var shoppingList = ["Eggs", "Milk", "Rice"]

for (index, value) in shoppingList.enumerated() {
    print(index, value)
}














