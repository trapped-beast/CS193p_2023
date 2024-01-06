// You can write if or switch after the equal sign (=) of an assignment or after return, to choose a value based on the condition.
var score = 100
let ifExpr = if (score == 100) {"🎉"} else {""}
print("score: \(score)", ifExpr)

func getRate(score: Int) -> String{
    return if (score == 100) {"🎉"} else {""}
}
getRate(score: score-1)


// You can use if and let together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains nil to indicate that a value is missing. Write a question mark (?) after the type of a value to mark the value as optional.
var optionalName1: String? = "chw"
var optionalName2: String? = nil
var greetingM = "Hello!"
if let name = optionalName1 {
    greetingM = "Hello, \(name)"
}
if let name = optionalName2 {
    greetingM = "Hello, \(name)"
}
else{
    greetingM = "Hello, whoever!"
}


// Another way to handle optional values is to provide a default value using the ?? operator. If the optional value is missing, the default value is used instead.
let nickName: String? = nil
let fullName: String = "chw"
greetingM = "Hi, \(nickName ?? fullName)"


// You can use a shorter spelling to unwrap a value, using the same name for that unwrapped value.
if let nickName{
    print("Hi, \(nickName)")
}

// Switches support any kind of data and a wide variety of comparison operations — they aren’t limited to integers and tests for equality.
// After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so you don’t need to explicitly break out of the switch at the end of each case’s code.
let employee = "🔥🐮"
switch employee{
case "🐰":
    print("A cute rabbit.")
case "🐯", "🐆":
    print("A big cat.")
case let x where x.hasSuffix("🐮"):
    print("\(x) need work hard.😭😭")
default:
    print("We all have a bright future.💪")
}

// You use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair.
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestType = ""
for (type, numbers) in interestingNumbers{
    for n in numbers{
        if(n > largest){
            largest = n;
            largestType = type
        }
    }
}
