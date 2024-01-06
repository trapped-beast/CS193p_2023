// Unlike multiline comments in C, multiline comments in Swift can be nested inside other multiline comments.
/* This is the start of the first multiline comment.
    /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */

// Unlike many other languages, Swift doesn’t require you to write a semicolon (;) after each statement in your code, although you can do so if you wish. However, semicolons are required if you want to write multiple separate statements on a single line:
let cat = "🐱"; print(cat)

// You can access the minimum and maximum values of each integer type with its min and max properties:
let minValue = UInt8.max

// The values of these properties are of the appropriate-sized number type (such as UInt8 in the example above) and can therefore be used in expressions alongside other values of the same type.
let minValueSubTwo = UInt8.max - 2

/* 
 * Integer literals can be written as:
 *       A decimal number, with no prefix
 *       A binary number, with a 0b prefix
 *       An octal number, with a 0o prefix
 *       A hexadecimal number, with a 0x prefix
 */
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

// Numeric literals can contain extra formatting to make them easier to read. Both integers and floats can be padded with extra zeros and can contain underscores to help with readability. Neither type of formatting affects the underlying value of the literal:
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// The rules for combining numeric constants and variables are different from the rules for numeric literals. The literal value 3 can be added directly to the literal value 0.14159, because number literals don’t have an explicit type in and of themselves. Their type is inferred only at the point that they’re evaluated by the compiler.
let ret1 = 3 + 0.14159
let three = 3
let ret2 = Double(three) + 0.14159
 
// Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword. Once you define a type alias, you can use the alias anywhere you might use the original name.
typealias Integer8 = Int8
let integer8Max = Integer8.max

// If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple
let http404Error = (404, "Not Found")
let (statusCode, _) = http404Error
print(statusCode)

// Alternatively, access the individual element values in a tuple using index numbers starting at zero
print("The status code is \(http404Error.0).")
print("The status message is \(http404Error.1).")

// You can name the individual elements in a tuple when the tuple is defined. If you name the elements in a tuple, you can use the element names to access the values of those elements
let http200Status = (code:200, message:"OK")
print("The status code is \(http200Status.code).")
print("The status message is \(http200Status.message).")
