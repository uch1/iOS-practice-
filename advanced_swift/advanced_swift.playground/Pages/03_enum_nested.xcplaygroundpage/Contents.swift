import Foundation

// Intro to Nested Enum
struct Character {
    enum CharacterType {
        case prince
        case warrior
        case priest
    }
    
    enum Skill {
        case airwalk
        case transparency
        case prediction
    }
    
    let type: CharacterType
    let skill: Skill
}

let bob = Character(type: .warrior, skill: .airwalk)

//: Another Game Design
enum Wearable {
    enum Weight: Int {
        case light
        case medium
        case heavy
    }
    enum Price: Int {
        case leather
        case iron
        case steel
    }
    
    case armor(weight: Weight,price: Price)
    
    func getDescription() -> String {
        switch self {
        case let .armor(weight, price):
            return "You've chosen \(weight) and \(price)"
        }
    }
    
}

let myClothes = Wearable.armor(weight: .heavy, price: .steel)
print(myClothes.getDescription())

























































































































































