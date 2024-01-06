// You use the for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.
let maxHour = 12
print(Array(0...maxHour))

//  Use the stride(from:to:by:) function to skip the unwanted marks.
print(Array(stride(from: 0, to: maxHour, by: 3)))

// Closed ranges are also available, by using stride(from:through:by:) instead
print(Array(stride(from: 0, through: maxHour, by: 3)))

// A simple game of Snakes and Ladders.
let finalSquare = 25
var board: [Int] = Array(repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var diceRoll: Int
var square = 0
var cnt = 0
var offset: Int
//while square < finalSquare {
//    diceRoll = Int.random(in: 1...6)
//    print("\nRound \(cnt+1) dice: \(diceRoll).")
//    square += diceRoll
//    print("\tTake \(diceRoll) step -> reach square \(square).")
//    if square < finalSquare {
//        offset = board[square]
//        square += offset
//        if offset > 0 {
//            print("\tTurn ends at the bottom of a ladder, move up -> reach square \(square).")
//        }
//        else if offset < 0 {
//            print("\tTurn ends at the head of a snake, move down -> reach square \(square).")
//        }
//    }
//    cnt += 1
//}
//print("\nReach destination at round \(cnt+1)!")
repeat {
    offset = board[square]
    square += offset
    if offset > 0 {
        print("Turn ends at the bottom of a ladder, move up -> reach square \(square).")
    }
    else if offset < 0 {
        print("Turn ends at the head of a snake, move down -> reach square \(square).")
    }
    diceRoll = Int.random(in: 1...6)
    print("Round \(cnt+1) dice: \(diceRoll).")
    square += diceRoll
    print("\tTake \(diceRoll) step -> reach square \(square).\n")
    cnt += 1
} while square < finalSquare
print("\nReach destination at round \(cnt+1)!")
// In the repeat-while loop above, square += board[square] is always executed immediately after the loop’s while condition confirms that square is still on the board. This behavior removes the need for the array bounds check seen in the while loop version of the game described earlier.

// Swift provides a shorthand spelling of if that you can use when setting values.
let score = 79
let rate = if score > 90 {
    "A"
} else if score > 80 {
    "B"
} else if score > 60 {
    "C"
} else {
    "D"
}

// All of the branches of an if expression need to contain values of the same type. Because Swift checks the type of each branch separately, values like nil that can be used with more than one type prevent Swift from determining the if expression’s type automatically. Instead, you need to specify the type explicitly
let comment: String? = if score==100 {
    "Awesome!"
} else {
    nil
}

// An alternate way to provide this type information is to provide an explicit type for nil
let comment1 = if score==100 {
    "Awesome!"
} else {
    nil as String?
}

// In contrast with switch statements in C and Objective-C, switch statements in Swift don’t fall through the bottom of each case and into the next one by default. Instead, the entire switch statement finishes its execution as soon as the first matching switch case is completed, without requiring an explicit break statement. This makes the switch statement safer and easier to use than the one in C and avoids executing more than one switch case by mistake.
// Although break isn’t required in Swift, you can use a break statement to match and ignore a particular case or to break out of a matched case before that case has completed its execution.
// To explicitly fall through at the end of a particular switch case, use the fallthrough keyword.

// Values in switch cases can be checked for their inclusion in an interval.
let rateInSwitch = switch score {
case 90...100: "A"
case 80..<90: "B"
case 60..<80: "C"
case 00..<60: "D"
default: "Illegal input."
}

// A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case. This behavior is known as value binding, because the values are bound to temporary constants or variables within the case’s body.
// Compound cases can also include value bindings. All of the patterns of a compound case have to include the same set of value bindings, and each binding has to get a value of the same type from all of the patterns in the compound case. This ensures that, no matter which part of the compound case matched, the code in the body of the case can always access a value for the bindings and that the value always has the same type.
let point = (9, 0)
switch point {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin.")
default:
    print("Not on an axis.")
}

// If you need C-style fallthrough behavior, you can opt in to this behavior on a case-by-case basis with the fallthrough keyword.
// The fallthrough keyword doesn’t check the case conditions for the switch case that it causes execution to fall into. The fallthrough keyword simply causes code execution to move directly to the statements inside the next case (or default case) block, as in C’s standard switch statement behavior.
let integerToDescribe = 19
var description = "The number \(integerToDescribe) is "
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also "
    fallthrough
case 20:
    description += "not a prime number, and also "
    fallthrough
default:
    description += "a integer."
}
print(description)

// In Swift, you can nest loops and conditional statements inside other loops and conditional statements to create complex control flow structures. However, loops and conditional statements can both use the break statement to end their execution prematurely. Therefore, it’s sometimes useful to be explicit about which loop or conditional statement you want a break statement to terminate. Similarly, if you have multiple nested loops, it can be useful to be explicit about which loop the continue statement should affect.
// To achieve these aims, you can mark a loop statement or conditional statement with a statement label.
// A labeled statement is indicated by placing a label on the same line as the statement’s introducer keyword, followed by a colon.

// The following example uses the break and continue statements with a labeled while loop for an adapted version of the Snakes and Ladders game that you saw earlier in this chapter. This time around, the game has an extra rule: To win, you must land exactly on square 25.
square = 0
cnt = 0
gameLoop: while square != finalSquare {
    diceRoll = Int.random(in: 1...6)
    print("\nRound \(cnt+1) dice: \(diceRoll).")
    switch square + diceRoll {
    case finalSquare:
        print("\tTake \(diceRoll) step -> reach square \(square+diceRoll).")
        print("\nReach destination at round \(cnt+1)!")
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        print("This will move us beyond the final square. So roll again.")
        cnt += 1
        continue gameLoop
    default:
        square += diceRoll
        print("\tTake \(diceRoll) step -> reach square \(square).")
        offset = board[square]
        square += offset
        if offset > 0 {
            print("\tTurn ends at the bottom of a ladder, move up -> reach square \(square).")
        }
        else if offset < 0 {
            print("\tTurn ends at the head of a snake, move down -> reach square \(square).")
        }
        cnt += 1
    }
}
// If the break statement above didn’t use the gameLoop label, it would break out of the switch statement, not the while statement. Using the gameLoop label makes it clear which control statement should be terminated.
// It isn’t strictly necessary to use the gameLoop label when calling continue gameLoop to jump to the next iteration of the loop. There’s only one loop in the game, and therefore no ambiguity as to which loop the continue statement will affect. However, there’s no harm in using the gameLoop label with the continue statement. Doing so is consistent with the label’s use alongside the break statement and helps make the game’s logic clearer to read and understand.

// A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else clause — the code inside the else clause is executed if the condition isn’t true.
func greet(person: [String:String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you!")
        return
    }
    print("I hope the weather is nice in \(location)!")
}
greet(person: ["name" : "chw"])
greet(person: ["name" : "chw", "location" : "Guangzhou"])

// If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace. Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in.
// If that condition isn’t met, the code inside the else branch is executed. That branch must transfer control to exit the code block in which the guard statement appears. It can do this with a control transfer statement such as return, break, continue, or throw, or it can call a function or method that doesn’t return, such as fatalError(_:file:line:).
// Using a guard statement for requirements improves the readability of your code, compared to doing the same check with an if statement. It lets you write the code that’s typically executed without wrapping it in an else block, and it lets you keep the code that handles a violated requirement next to the requirement.
func greetIfVersion(person: [String:String]) {
    if let name = person["name"] {
        print("Hello \(name)!")
    } else {
        return
    }
    if let location = person["location"] {
        print("I hope the weather is nice in \(location)!")
    } else {
        print("I hope the weather is nice near you!")
        return
    }
}
greetIfVersion(person: ["name" : "chw"])
greetIfVersion(person: ["name" : "chw", "location" : "Guangzhou"])
