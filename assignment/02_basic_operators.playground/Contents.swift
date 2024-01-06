// Unlike the assignment operator in C and Objective-C, the assignment operator in Swift doesn’t itself return a value.
// This feature prevents the assignment operator (=) from being used by accident when the equal to operator (==) is actually intended. By making if x = y invalid, Swift helps you to avoid these kinds of errors in your code.
let (x, y) = (1, 2)
//if x = y { }
if x == y {}

// Unlike the arithmetic operators in C and Objective-C, the Swift arithmetic operators don’t allow values to overflow by default.
//let notAllowed: Int8 = Int8.max + 1

// The remainder operator (a % b) works out how many multiples of b will fit inside a and returns the value that’s left over (known as the remainder).
// The remainder operator (%) is also known as a modulo operator in other languages. However, its behavior in Swift for negative numbers means that, strictly speaking, it’s a remainder rather than a modulo operation.
/*
 * To determine the answer for a % b, the % operator calculates the
 * following equation and returns remainder as its output:
 *      a = (b x some multiplier) + remainder
 * where some multiplier is the largest number of multiples of b that will
 * fit inside a.
 */
print("9 % 2 = \(9 % 2)")
print("-9 % 2 = \(-9 % 2)")

// The sign of b is ignored for negative values of b. This means that a % b and a % -b always give the same answer.
print("9 % -2 = \(9 % -2)")

// The unary minus operator (-) is prepended directly before the value it operates on, without any white space.
let minusThree = -3

// Although the unary plus operator doesn’t actually do anything, you can use it to provide symmetry in your code for positive numbers when also using the unary minus operator for negative numbers.
let three = +3

// The compound assignment operators don’t return a value. For example, you can’t write let b = a += 2.

// You can compare two tuples if they have the same type and the same number of values. Tuples are compared from left to right, one value at a time, until the comparison finds two values that aren’t equal. Those two values are compared, and the result of that comparison determines the overall result of the tuple comparison. If all the elements are equal, then the tuples themselves are equal.

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

// Tuples can be compared with a given operator only if the operator can be applied to each value in the respective tuples.
// two tuples of type (String, Bool) can’t be compared with the < operator because the < operator can’t be applied to Bool values
//("blue", false) < ("purple", true)

// The Swift standard library includes tuple comparison operators for tuples with fewer than seven elements. To compare tuples with seven or more elements, you must implement the comparison operators yourself.

// You can’t iterate over a one-sided range that omits a first value, because it isn’t clear where iteration should begin. You can iterate over a one-sided range that omits its final value; however, because the range continues indefinitely, make sure you add an explicit end condition for the loop.
for i in 0... {
    if i >= 10{
        break
    }
    print(String(i), terminator: " ")
}

// You can also check whether a one-sided range contains a particular value.
let range = ..<5
range.contains(3)
range.contains(5)
