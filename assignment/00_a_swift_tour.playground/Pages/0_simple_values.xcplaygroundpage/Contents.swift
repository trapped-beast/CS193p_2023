// Create a constant with an explicit type of Float and a value of 4.
let four: Float = 4

// Values are never implicitly converted to another type.
let label = "the width is "
let width = 42
let widthLabel = label + String(width)

// Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
let s1 = "result is \(3.14*2)"
var name = "chw"
let greeting = "Hi, \(name)"

// Use three double quotation marks (""") for strings that take up multiple lines. Indentation at the start of each quoted line is removed, as long as it matches the indentation of the closing quotation marks.
let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.
        """
print(quotation)

// A comma is allowed after the last element in Dictionary or Array.
let dic1 = [
    "Chandler": "Bing",
    "Ross": "Geller",
    "Joey": "Tribbiani",
]
let arr1 = ["Rachel", "Phoebe", "Monica",]

// empty dictionary
let emptyDic: [String:String] = [:]


// In an if statement, the conditional must be a Boolean expression — this means that code such as if score { ... } is an error, not an implicit comparison to zero.
var flagBool: Bool = false
var flagInt: Int = 0
if(flagBool){}
//if(flagInt){}
