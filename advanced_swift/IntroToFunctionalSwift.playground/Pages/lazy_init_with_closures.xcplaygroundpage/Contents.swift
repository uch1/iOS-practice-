//: [Previous](@previous)

import Foundation
import UIKit
// Lazy init closures
// Problem: How to initialize an object with a closure?

//: Unconventional Way
let box: UIView = {
    let view = UIView()
    return view
}()

// Why do we use lazy init and what are the benefits

class InstenseMathProblem {
    lazy var complexNumber: Int = {
        return 1 * 1
    }()
}

class SortFromDataBase {
    // Data
    lazy var sortNumberFromDatabase: [Int] = {
        // Calculation and Sorting
        [1, 2, 3, 4, 5, 6, 7, 8, 9]
    }()
}

class CompressionManager {
    lazy var compressedImage: UIImage = {
        let image = UIImage()
        // Compress the image
        // Logic
        return image
    }()
}

/*
 
 Lazy Rules:
 1. You can't use lazy with let since there is no initial value, and it is attained later when it is accessed
 2. You can't use it with a Computed property since computed property is always recalculated (required CPU) when you modify any of the variables that has a relationship with the lazy property.
 3. Lazy is only valid for members of a struct or class 
 
*/

















//: [Next](@next)
