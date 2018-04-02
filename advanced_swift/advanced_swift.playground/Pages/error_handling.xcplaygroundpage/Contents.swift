
/*
    Intro to Error handling
 
 1. Warn your co-workers the function can cause dangerous results
 2. Understanding of a do-try block
 3. Distinguish between try?, try!, and try
*/


func checkHeight(height: Int) {
    if height > 200 {
        print("You are too tall")
    } else if height < 140 {
        print("Right height")
    } else {
        print("too short")
    }
}

// Problem with if-else statement
// Problem 1: bloated function
// Problem 2: Modurality

// Note: Error Handling is just another way to write an else-if statement to deal with error message

// Design Error (1/3)
enum HeightError: Error {
    case maxHeight
    case minHeight
}

// Call function (2/3)
func checkHeightError(height: Int) throws {
    if height > 200 {
        throw HeightError.maxHeight
    } else if height < 140 {
        throw HeightError.minHeight
    } else {
        print("enjoy")
    }
}

// Handle with error (3/3)
do {
    try checkHeightError(height: 400)
} catch HeightError.maxHeight {
    print("You're too tall")
} catch HeightError.minHeight {
    print("You're too short")
}


//: Error handling with Object Initialization

// Design Error
enum NameError: Error {
    case noName
}

class Course {
    var name: String
    
    init(name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("you created an object")
        }
    }
}

do {
    let myCourse = try Course(name: "Uchenna")
    print(myCourse)
} catch NameError.noName {
    print("Make sure you entered your name please")
    // More code
}


//: Distinguish try?, try!, and try

let newCourse = try? Course(name: "")

let myNewCourse = try! Course(name: "Uchenna")













