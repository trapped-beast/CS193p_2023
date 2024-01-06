// Functions without a defined return type return a special value of type Void. This is simply an empty tuple, which is written as ().

// If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil.
func minMax(in array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else {
        return nil
    }
    var min = array[0]
    var max = array[0]
    for num in array {
        if num > max { max = num }
        if num < max { min = num }
    }
    return (min, max)
}

// You can use optional binding to check whether this version of the minMax(array:) function returns an actual tuple value or nil.
let array1: [Int] = [2, 4, 5, 1, 3]
if let bounds = minMax(in: array1) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// If the entire body of the function is a single expression, the function implicitly returns that expression.
func greeting() -> String { "Hello, world!" }
let g = greeting()

// Each function parameter has both an argument label and a parameter name. The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.
// If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter. If a parameter has an argument label, the argument must be labeled when you call the function.

// Place parameters that don’t have default values at the beginning of a function’s parameter list, before the parameters that have default values. Parameters that don’t have default values are usually more important to the function’s meaning — writing them first makes it easier to recognize that the same function is being called, regardless of whether any default parameters are omitted.
