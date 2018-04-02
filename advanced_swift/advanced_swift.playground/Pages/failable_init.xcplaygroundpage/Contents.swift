//: [Previous](@previous)

import Foundation

/*
    Failable Init
    Problem: Can initialization fail?
*/

enum NameError: Error {
    case noName
}

class Course {
    var name: String
    
    init(name: String) throws {
        if name.isEmpty {
            throw NameError.noName
        } else {
            self.name = name
        }
    }
}

do {
    let myCourse = try Course(name: "Uchenna")
} catch NameError.noName {
    print("Uchenna, please enter the name")
}

// Design Failable Init

class Blog {
    let name: String
    init?(name: String) throws {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
}

do {
    let uchennasBlog = try Blog(name: "Uchenna's Blog")
    print(uchennasBlog ?? "")
} catch NameError.noName {
    print("Your blog name wasn't provided.")
}
































































//: [Next](@next)
