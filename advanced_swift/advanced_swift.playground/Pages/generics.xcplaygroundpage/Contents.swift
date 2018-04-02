/*
 Intro to Generics: making Reusable and Scalable codebase
*/

// Problem: I smell something

let highSchoolGPA = [3.56, 3.22, 2.00]
let favoritePeople = ["Ghadi", "MLK"]
let favoriteNumbers = [24, 23]

//: Worst
highSchoolGPA[0]
highSchoolGPA[1]
highSchoolGPA[2]

// Typical solution
func printGPA(array: [Double]) {
    for number in array {
        print("I like \(number)")
    }
}

printGPA(array: highSchoolGPA)

// Introducing Generics
func genericFunction<anything>(value: anything) {
    print(value)
}

func genericFunctions<T>(value: T) {
    print(value)
}

func printElement<T>(array: [T]) {
    for element in array {
        print(element)
    }
}

printElement(array: highSchoolGPA)
printElement(array: favoritePeople)

/*
 Note: Generics code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define.
*/

//: Struct Met Generics

struct Family {
    var members = [String]()
    
    mutating func push(member: String) {
        members.append(member)
    }
}

var myFam = Family()
myFam.push(member: "uchenna")
myFam.members


struct GenericFamily<T> {
    var members = [T]()
    
    mutating func push(member: T) {
        members.append(member)
    }
}

//: Generic Initialization
// T Implicitly Defined
let myHappyFamily = GenericFamily(members: [1, 2, 4, 4])

// T Explicityly Defined
var genericsFamily = GenericFamily<Int>()
genericsFamily.push(member: 10)

// Generic Extension
extension GenericFamily {
    var firstElement: T? {
        if members.isEmpty {
            return nil
        } else {
            return members[0]
        }
    }

}

genericsFamily.firstElement

//: Type Constraint

class LOL {}
class BabyLol: LOL {}

let example = LOL()

func addLOLClassOnly<T: LOL>(array: [T]) {}
addLOLClassOnly(array: [example])
addLOLClassOnly(array: [BabyLol(), BabyLol()])
//addLOLClassOnly(array: [1, 2, 3, 4])


















