/*
    Intro to subscripts
 
 Problem:
 1. When I create an object, I want a shortcut without calling a method.
*/


// Normal Method

struct HelloKitty {
    func saySomething() -> String {
        return "I'm cute"
    }
}

HelloKitty().saySomething()

//: iNtroducing Subscripts
struct WeekDays {
    var days = ["Monday", "Tuesday", "Wednesday"]
    
    subscript(index: Int) -> String {
        return days[index]
    }
}

let myDays = WeekDays()
//myDay.days[1]
myDays[0]

// Dictionary Type
var info = ["Height": 168, "Body Fat": 10, "Weight": 76]

let height = info["Height"]

struct HealthInfo {
    var info = ["Height": 168, "Body Fat": 10.5, "Weight": 76]
    
    subscript(key: String) -> Double {
        if let newInfo = info[key] {
            return newInfo
        } else {
            return 0
        }
    }
}

let uchennaInfo = HealthInfo()
let uchennaHeight = uchennaInfo["Height"]
let uchennaBodyFat = uchennaInfo["Body Fat"]

/*
    Usage Case
    1. Get the number of rows in table/collection
    2. Anything has to do with pair and value
*/

// Shortcoming of subscript
// No context = bad

















