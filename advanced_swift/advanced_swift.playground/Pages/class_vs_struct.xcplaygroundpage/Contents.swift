/*
    Class vs Struct
 
 Problem:
 1. What are the differences besides inheritance?
 2. When to use Structs over Classes? 
*/

// Design Class
class Human {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var humanObject = Human(name: "Uchenna")
humanObject.name

var newHumanObject = humanObject
newHumanObject.name = "Uche"
newHumanObject.name

// Design Struct
struct HumanStruct {
    var name: String
    init(name: String) {
        self.name = name
    }
}




























