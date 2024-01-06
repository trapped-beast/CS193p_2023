// You introduce enumerations with the enum keyword and place their entire definition within a pair of braces
enum CompassPoint {
    case north
    case south
    case east
    case west
}
// The values defined in an enumeration (such as north, south, east, and west) are its enumeration cases. You use the case keyword to introduce new enumeration cases.
// Swift enumeration cases don’t have an integer value set by default, unlike languages like C and Objective-C. In the CompassPoint example above, north, south, east and west don’t implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are values in their own right, with an explicitly defined type of CompassPoint.

// Each enumeration definition defines a new type. Like other types in Swift, their names start with a capital letter. Give enumeration types singular rather than plural names, so that they read as self-evident.
var directionToHead = CompassPoint.west

// The type of directionToHead is already known, and so you can drop the type when setting its value. This makes for highly readable code when working with explicitly typed enumeration values.
directionToHead = .east

// For some enumerations, it’s useful to have a collection of all of that enumeration’s cases. You enable this by writing : CaseIterable after the enumeration’s name. Swift exposes a collection of all the cases as an allCases property of the enumeration type.
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
for beverage in Beverage.allCases {
    print(beverage)
}

// The examples in the previous section show how the cases of an enumeration are a defined (and typed) value in their own right. However, it’s sometimes useful to be able to store values of other types alongside these case values. This additional information is called an associated value, and it varies each time you use that case as a value in your code.
// You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed. Enumerations similar to these are known as discriminated unions, tagged unions, or variants in other programming languages.
enum Barcode {
    case upc(Int , Int , Int , Int )
    case qrCode(String)
}

// This definition doesn’t provide any actual Int or String values — it just defines the type of associated values that Barcode constants and variables can store when they’re equal to Barcode.upc or Barcode.qrCode.
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// You can check the different barcode types using a switch statement, similar to the example in Matching Enumeration Values with a Switch Statement. This time, however, the associated values are extracted as part of the switch statement. You extract each associated value as a constant (with the let prefix) or a variable (with the var prefix) for use within the switch case’s body:
switch productBarcode {
case .upc(let a, let b, let c, let d):
    print(a,b,c,d)
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

// If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single let or var annotation before the case name, for brevity.
switch productBarcode {
case let .upc(a, b, c, d):
    print(a,b,c,d)
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}
