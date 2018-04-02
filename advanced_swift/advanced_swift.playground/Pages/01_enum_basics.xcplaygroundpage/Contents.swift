
//: Basic Enumerations
enum Compass {
    case north, east, south, west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earth = Planet.earth // init

switch earth {
case .earth:
    print("Mostly safe")
default:
    print("Not a safe place for me")
}



/*
 Swift supports the following types for the value of an enum:
 - Integer
 - Float
 - String
 - Bool
*/

//: Raw Value: String
enum Food: String {
    case pizza, banana, chicken, bigMac
}

let stringValuePizza = Food.pizza.rawValue

//: Raw Value: Int
enum Days: Int {
    case mon = 1, tue, wed, thu, fri = 11, sat, sun
}

//Days.mon.rawValue

//: Initialization from Raw Value
//let possibleDay = Days(rawValue: 1)

//
//if let someDay = Days(rawValue: 11) {
//    switch someDay {
//    case .sat, .sun:
//        print("It's the weekend!")
//    default:
//        print("Weekday!!")
//    }
//} else {
//    print("No such day exists")
//}


/*
    Enumeration Associative Value
*/

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

let myQRCode = Barcode.qrCode("XYZ")
let myUPC = Barcode.upc(1, 2, 3, 5)

// Not the base way to validate object using enums
if case let Barcode.qrCode(value) = myQRCode {
    print("This is a qrcode")
    print(value)
}

if case let Barcode.upc(numberSystem, manufactuer, product, check) = myUPC {
    print("numberSystem:", numberSystem)
    print("namufactuer:", manufactuer)
    print("product:", product)
    print("check:", check)
}

// Best way to validate objects using enums: switch statement

let code = myQRCode
switch code {
case let .upc(numberSystem, manufactuer, product, check):
    print("UPC: \(numberSystem), \(manufactuer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}















