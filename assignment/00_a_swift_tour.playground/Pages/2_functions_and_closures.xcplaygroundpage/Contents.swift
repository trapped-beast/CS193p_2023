// By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write _ to use no argument label.
func greet(_ person: String, on day: String){
    print("Hi, \(person),today is \(day)!")
}
greet("Joey", on: "Friday")

// Functions are a first-class type. This means that a function can return another function as its value.
func makeIncrementer() -> ((Int) -> Int){
    func addOne(number: Int) -> Int{
        return number + 1
    }
    return addOne
}
let increment = makeIncrementer()
increment(7)

// A function can take another function as one of its arguments.
func hasAnyMatches(lists:[Int], condition:(Int)->Bool) -> Bool{
    for i in lists{
        if condition(i){
            return true
        }
    }
    return false
}
func greaterThanTen(_ number: Int) -> Bool{
    return number>10
}
var numbers = [5, 8, 10, 13]
hasAnyMatches(lists: numbers, condition: greaterThanTen)

// Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it’s executed.
// You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    print("\(number) => \(result)")
    return result
})

// Rewrite the closure to return zero for all odd numbers.
numbers.map ({
    (number: Int) -> Int in
    let oddToZero: Int = (number % 2 == 1 ? 0 : number)
    print("\(number) => \(oddToZero)")
    return oddToZero
})

// You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
let mappedNumbers = numbers.map ({number in 3 * number})
print(mappedNumbers)

// You can refer to parameters by number instead of by name — this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.
let sortedNumbers = numbers.sorted {$0 > $1}
print(sortedNumbers)
