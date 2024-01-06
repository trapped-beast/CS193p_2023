// Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.
// Closures can capture and store references to any constants and variables from the context in which they’re defined. This is known as closing over those constants and variables. Swift handles all of the memory management of capturing for you.

// Closure expressions are a way to write inline closures in a brief, focused syntax.

// Swift’s standard library provides a method called sorted(by:), which sorts an array of values of a known type, based on the output of a sorting closure that you provide. Once it completes the sorting process, the sorted(by:) method returns a new array of the same type and size as the old one, with its elements in the correct sorted order.
// The sorted(by:) method accepts a closure that takes two arguments of the same type as the array’s contents, and returns a Bool value to say whether the first value should appear before or after the second value once the values are sorted. The sorting closure needs to return true if the first value should appear before the second value, and false otherwise.
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
print(names.sorted())
print(names.sorted(by: backward))

print(names.sorted(by: {(s1: String, s2: String) in
    return s1 > s2
}))

// It’s always possible to infer the parameter types and return type when passing a closure to a function or method as an inline closure expression. As a result, you never need to write an inline closure in its fullest form when the closure is used as a function or method argument.
print(names.sorted(by: { s1, s2 in s1 > s2 }))

// Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.
// If you use these shorthand argument names within your closure expression, you can omit the closure’s argument list from its definition. The type of the shorthand argument names is inferred from the expected function type, and the highest numbered shorthand argument you use determines the number of arguments that the closure takes. The in keyword can also be omitted, because the closure expression is made up entirely of its body.
print(names.sorted(by: {$0 > $1}))

// There’s actually an even shorter way to write the closure expression above. Swift’s String type defines its string-specific implementation of the greater-than operator (>) as a method that has two parameters of type String, and returns a value of type Bool. This exactly matches the method type needed by the sorted(by:) method. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation
print(names.sorted(by: >))

// If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. You write a trailing closure after the function call’s parentheses, even though the trailing closure is still an argument to the function. When you use the trailing closure syntax, you don’t write the argument label for the first closure as part of the function call.
func printResult(lhs: Int, rhs: Int, mathOp: (Int, Int) -> Int) {
    print("\(lhs) \(rhs) -> \(mathOp(lhs, rhs))")
}
printResult(lhs: 1, rhs: 2, mathOp: { $0 + $1 })
printResult(lhs: 1, rhs: 2) { $0 - $1 }
print(names.sorted() { $0 > $1 })

// If a closure expression is provided as the function’s or method’s only argument and you provide that expression as a trailing closure, you don’t need to write a pair of parentheses () after the function or method’s name when you call the function
print(names.sorted { $0 > $1 })

// Trailing closures are most useful when the closure is sufficiently long that it isn’t possible to write it inline on a single line.
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let enNumbers = numbers.map { (num) -> String in
    var output = ""
    var n = num
    while n != 0 {
        output = digitNames[n % 10]! + output
        n = n / 10
    }
    return output
}
print(enNumbers)

// If a function takes multiple closures, you omit the argument label for the first trailing closure and you label the remaining trailing closures.
