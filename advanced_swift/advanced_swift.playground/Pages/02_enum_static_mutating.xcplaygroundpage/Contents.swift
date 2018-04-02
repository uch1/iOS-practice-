import Foundation

/*
 Advanced Enumeration:
 Static and mutating methods with self
*/

//: Practical with Storyboard
enum Storyboard: String {
    case profile
    case setting
    case newsfeed
    
    var identifier: String {
        return self.rawValue
    }
}

let profile = Storyboard.profile
profile.identifier


//: API Guideline Goal
func describeStoryboard(storyboard: Storyboard) -> String {
    switch storyboard {
    case .profile:
        return "\(storyboard.identifier): Profile picture, followers"
    case .setting:
        return "\(storyboard.identifier): Logout, invite"
    case .newsfeed:
        return "\(storyboard.identifier): videos, texts"
    }
}


//: Mutating Methods
enum MealProcess: String {
    case breakfast, lunch, dinner
    
    var description: String {
        return self.rawValue
    }
    
    mutating func nextMeal() {
        
        print("Time to move on from \(self.description)")
        
        switch self {
        case .breakfast:
            self = .lunch
            print("I had a nice lunch.")
        case .lunch:
            self = .dinner
            print("I had a nice dinner.")
        case .dinner:
            self = .breakfast
            print("I had a nice breakfast.")
        }
    }
}

var currentMeal = MealProcess.breakfast
currentMeal.nextMeal()
currentMeal.nextMeal()
currentMeal.nextMeal()

// static methods

// not DRY

//enum AppleDevices {
//    case appleWatch, iPhone, iPad, iMac
//
//    static func getAppleDevice(name: String) -> AppleDevices? {
//        switch name {
//        case "appleWatch":
//            return .appleWatch
//        case "iPhone":
//            return .iPhone
//        case "iPad":
//            return .iPad
//        case "iMac":
//            return .iMac
//        default:
//            return nil
//        }
//    }
//}
//
//let userProduct = AppleDevices.getAppleDevice(name: "MacPro")

// refactored version of the function above
//enum AppleDevices: String {
//    case appleWatch, iPhone, iPad, iMac
//
//    static func getProduct(name: String) -> AppleDevices? {
//        return AppleDevices(rawValue: name)
//    }
//
//    static func getAppleDevice(enteredName: String) -> AppleDevices? {
//        switch enteredName {
//        case "appleWatch", "iPhone", "iPad", "iMac":
//            return getProduct(name: enteredName)
//        default:
//            return nil
//        }
//    }
//}

//: Custom Init(falliable method)
enum AppleDevices: String {
    case appleWatch, iPhone, iPad, iMac
    
    init?(name: String) {
        if name == "appleWatch" {
            self = .appleWatch
        } else {
            return nil
        }
    }
    
}

AppleDevices(name: "appleWatch")
AppleDevices(rawValue: "appleWatch")

enum IntCategory {
    case small, medium, big, weird
    
    init(number: Int) {
        switch number {
        case 0..<1000:
            self = .small
        case 1000..<100000:
            self = .medium
        case 100000..<1000000:
            self = .big
        default:
            self = .weird
        }
    }
}

IntCategory(number: 122299292929292)

//: ### Another Practical Case
enum HttpError: String {
    case Code400 = "Bad Request"
    case Code401 = "Unauthorized"
    case Code402 = "Payment Required"
    case Code403 = "Forbidden"
    case Code404 = "Page Not Found"
    
    var description: String {
        return self.rawValue
    }
}

let code400 = HttpError.Code400.description
let code401 = HttpError.Code401.description
let code402 = HttpError.Code402.description
let code403 = HttpError.Code403.description

//: Cell Identifier
enum CellType: String {
    case ButtonValueCell
    case UnitEditCell
    case LabelCell
    case ResultLabelCell
    
    var name: String {
        return self.rawValue
    }
}


//: UIKit
import UIKit

enum NavigationTheme {
    case Placid, Warning, Danger
    
    var barTintColor: UIColor {
        switch self {
        case .Placid: return UIColor.clear
        case .Warning: return UIColor.blue
        case .Danger: return UIColor.red
        }
    }
}

let colorSituation = NavigationTheme.Placid
colorSituation.barTintColor

extension NavigationTheme {
    init(numberOfTasks: Int) {
        switch numberOfTasks {
        case 0...3:
            self = .Placid
        case 4...9:
            self = .Warning
        default:
            self = .Danger
        }
    }
}

let currentColor = NavigationTheme(numberOfTasks: 10).barTintColor

































