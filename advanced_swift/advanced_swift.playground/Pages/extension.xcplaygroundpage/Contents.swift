/* Extension
 Problem:
 1. I like to keep it short and modularlized
 2. Prevent anything massive
*/


//: Design Struct
struct Uchenna {
    var name = "Uchenna"
    var skill = "workd"
    
    init() {}
}

Uchenna().name

extension Uchenna {
    var description: String {
        let myName = self.name
        let mySkill = self.skill
        return "I'm \(myName). I know \(skill)"
    }
    
    init(mySkillSet: String) {
        self.skill = mySkillSet
    }
}

let uchenna = Uchenna()
print(uchenna.description)


//: Extension to Swift Types
let number = Int(12334)

extension Int {
    var squared: Int {
        return self * self
    }
}

Int(123).squared

// Rule in the swift Extension
// You may not have a stored property


/*
    Extension in Swift
 1. 
*/














