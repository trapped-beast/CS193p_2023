// A multiline string literal includes all of the lines between its opening and closing quotation marks. The string begins on the first line after the opening quotation marks (""") and ends on the line before the closing quotation marks
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
print(singleLineString)
print(multilineString)

// When your source code includes a line break inside of a multiline string literal, that line break also appears in the string’s value. If you want to use line breaks to make your source code easier to read, but you don’t want the line breaks to be part of the string’s value, write a backslash (\) at the end of those lines.
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

// A multiline string can be indented to match the surrounding code. The whitespace before the closing quotation marks (""") tells Swift what whitespace to ignore before all of the other lines. However, if you write whitespace at the beginning of a line in addition to what’s before the closing quotation marks, that whitespace is included.
let linesWithIndentation = """
    
    The whitespace before the closing quotation marks matters.
        This line begin with some whitespace.
    This line doesn't begin with some whitespace.
    """
print(linesWithIndentation)

// An arbitrary Unicode scalar value, written as \u{n}.
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

// Because multiline string literals use three double quotation marks instead of just one, you can include a double quotation mark (") inside of a multiline string literal without escaping it. To include the text """ in a multiline string, escape at least one of the quotation marks.
let threeDoubleQuotationMarks = """
Escaping a double quotation mark "
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print(threeDoubleQuotationMarks)

// You can place a string literal within extended delimiters to include special characters in a string without invoking their effect. You place your string within quotation marks (") and surround that with number signs (#).
print("Line1\nLine2")
print(#"Line1\nLine2"#)
print(##"Line1\nLine2"##)

// If you need the special effects of a character in a string literal, match the number of number signs within the string following the escape character (\).
print(#"Line1\#nLine2"#)
print(##"Line1\##nLine2"##)

// String literals created using extended delimiters can also be multiline string literals. You can use extended delimiters to include the text """ in a multiline string, overriding the default behavior that ends the literal.
let threeMoreDoubleQuotationMarks = #"""
\nHere are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)

// To create an empty String value as the starting point for building a longer string, either assign an empty string literal to a variable or initialize a new String instance with initializer syntax.
var emptyString = ""
var anotherEmptyString = String()

// Find out whether a String value is empty by checking its Boolean isEmpty property.
if emptyString.isEmpty && anotherEmptyString.isEmpty {
    print("We can initialize an empty string.")
}

// Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable.
// Behind the scenes, Swift’s compiler optimizes string usage so that actual copying takes place only when absolutely necessary. This means you always get great performance when working with strings as value types.

// You can access the individual Character values for a String by iterating over the string with a for-in loop
for i in "Dog!🐶" {
    print(i)
}

// Alternatively, you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation
let excalmation: Character = "!"
print(excalmation)

// String values can be constructed by passing an array of Character values as an argument to its initializer
let catCharacters:[Character] = ["C","a","t",excalmation,"🐱"]
let catString = String(catCharacters)
print(catString)

// String values can be added together (or concatenated) with the addition operator (+) (or with the String type’s append() method) to create a new String value
emptyString.append("🐮")
emptyString += "🐎"
print(emptyString)

// If you’re using multiline string literals to build up the lines of a longer string, you want every line in the string to end with a line break, including the last line.
let badStart = """
    one
    two
    """
let end = "three"
print(badStart + end)
let goodStart = """
    one
    two
    
    """
print(goodStart + end)

// To use string interpolation inside a string that uses extended delimiters, match the number of number signs after the backslash to the number of number signs at the beginning and end of the string.
print("6 times 7 is \(6*7)")
print(#"6 times 7 is \(6*7)"#)
print(#"6 times 7 is \#(6*7)"#)

// Behind the scenes, Swift’s native String type is built from Unicode scalar values. A Unicode scalar value is a unique 21-bit number for a character or modifier, such as U+0061 for LATIN SMALL LETTER A ("a"), or U+1F425 for FRONT-FACING BABY CHICK ("🐥").
// Note that not all 21-bit Unicode scalar values are assigned to a character — some scalars are reserved for future assignment or for use in UTF-16 encoding. Scalar values that have been assigned to a character typically also have a name, such as LATIN SMALL LETTER A and FRONT-FACING BABY CHICK in the examples above.
print("\u{61}")
print("\u{1F425}")

// Every instance of Swift’s Character type represents a single extended grapheme cluster. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.
// Here’s an example. The letter é can be represented as the single Unicode scalar é (LATIN SMALL LETTER E WITH ACUTE, or U+00E9). However, the same letter can also be represented as a pair of scalars — a standard letter e (LATIN SMALL LETTER E, or U+0065), followed by the COMBINING ACUTE ACCENT scalar (U+0301). The COMBINING ACUTE ACCENT scalar is graphically applied to the scalar that precedes it, turning an e into an é when it’s rendered by a Unicode-aware text-rendering system.
// In both cases, the letter é is represented as a single Swift Character value that represents an extended grapheme cluster. In the first case, the cluster contains a single scalar; in the second case, it’s a cluster of two scalars
let eAcute: Character = "\u{E9}"
let e: Character = "\u{65}"
let acute: Character = "\u{301}"
let combinedEAcute: Character = "\u{65}\u{301}"
print("""
Every instance of Swift’s Character type represents a single extended grapheme cluster. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.

""")
print("We can combine \(e) and \(acute) to get a \(combinedEAcute), which look the same as the single Unicode scalar \(eAcute).")
print("""
      Although this two Swift Character look the same and both represent a single extended grapheme cluster,\
      the extented grapheme cluster represented behind is different:
      """)
print("\tThe former has \(combinedEAcute.unicodeScalars.count) unicode scalar.")
print("\tThe latter has \(eAcute.unicodeScalars.count) unicode scalar.")

// Extended grapheme clusters are a flexible way to represent many complex script characters as a single Character value. For example, Hangul syllables from the Korean alphabet can be represented as either a precomposed or decomposed sequence. Both of these representations qualify as a single Character value in Swift.
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

// Extended grapheme clusters enable scalars for enclosing marks (such as COMBINING ENCLOSING CIRCLE, or U+20DD) to enclose other Unicode scalars as part of a single Character value.
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
for i in 0x2460...0x2473 {
    print(Character(UnicodeScalar(i)!), terminator: " ")
}
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

// To retrieve a count of the Character values in a string, use the count property of the string.
// Note that Swift’s use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string’s character count.
var word = "cafe"
print("\n\(word) has \(word.count) characters.")
word += "\u{301}"
print("\(word) has \(word.count) characters.")

// Extended grapheme clusters can be composed of multiple Unicode scalars. This means that different characters — and different representations of the same character — can require different amounts of memory to store. Because of this, characters in Swift don’t each take up the same amount of memory within a string’s representation. As a result, the number of characters in a string can’t be calculated without iterating through the string to determine its extended grapheme cluster boundaries. If you are working with particularly long string values, be aware that the count property must iterate over the Unicode scalars in the entire string in order to determine the characters for that string.
// Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string.
// As mentioned above, different characters can require different amounts of memory to store, so in order to determine which Character is at a particular position, you must iterate over each Unicode scalar from the start or end of that String. For this reason, Swift strings can’t be indexed by integer values.
// Use the startIndex property to access the position of the first Character of a String. The endIndex property is the position after the last character in a String. As a result, the endIndex property isn’t a valid argument to a string’s subscript. If a String is empty, startIndex and endIndex are equal.
// You access the indices before and after a given index using the index(before:) and index(after:) methods of String. To access an index farther away from the given index, you can use the index(_:offsetBy:) method instead of calling one of these methods multiple times.
// You can use subscript syntax to access the Character at a particular String index.
let stringIndicesInfo = "Use String.Index rather than Integer to access some characher in a string."
let sII = stringIndicesInfo
sII[sII.startIndex]
sII[sII.index(after: sII.startIndex)]
sII[sII.index(before: sII.endIndex)]
sII[sII.index(sII.startIndex, offsetBy: 11)]
sII[sII.index(sII.endIndex, offsetBy: -11)]

// Use the indices property to access all of the indices of individual characters in a string.
for index in sII.indices {
    print(sII[index], terminator: " ")
}

// You can use the startIndex and endIndex properties and the index(before:), index(after:), and index(_:offsetBy:) methods on any type that conforms to the Collection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.

// To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))

// To remove a single character from a string at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the removeSubrange(_:) method
welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
print("\nNot welcome is \(welcome).")

// You can use the insert(_:at:), insert(contentsOf:at:), remove(at:), and removeSubrange(_:) methods on any type that conforms to the RangeReplaceableCollection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.

// When you get a substring from a string — for example, using a subscript or a method like prefix(_:) — the result is an instance of Substring, not another string. Substrings in Swift have most of the same methods as strings, which means you can work with substrings the same way you work with strings. However, unlike strings, you use substrings for only a short amount of time while performing actions on a string. When you’re ready to store the result for a longer time, you convert the substring to an instance of String.
var greeting = "hello, world!"
var index = greeting.firstIndex(of: ",") ?? greeting.endIndex
var beginning = greeting[..<index]
let newGreeting = String(beginning)

// Like strings, each substring has a region of memory where the characters that make up the substring are stored. The difference between strings and substrings is that, as a performance optimization, a substring can reuse part of the memory that’s used to store the original string, or part of the memory that’s used to store another substring. (Strings have a similar optimization, but if two strings share memory, they’re equal.) This performance optimization means you don’t have to pay the performance cost of copying memory until you modify either the string or substring. As mentioned above, substrings aren’t suitable for long-term storage — because they reuse the storage of the original string, the entire original string must be kept in memory as long as any of its substrings are being used.

// Swift provides three ways to compare textual values: string and character equality, prefix equality, and suffix equality.
// String and character equality is checked with the “equal to” operator (==) and the “not equal to” operator (!=).
// Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent. Extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they’re composed from different Unicode scalars behind the scenes.
let str1 = "caf" + "\u{E9}"
let str2 = "caf" + "\u{65}\u{301}"
str1 == str2
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
latinCapitalLetterA == cyrillicCapitalLetterA

// String and character comparisons in Swift aren’t locale-sensitive.

// To check whether a string has a particular string prefix or suffix, call the string’s hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value.
// The hasPrefix(_:) and hasSuffix(_:) methods perform a character-by-character canonical equivalence comparison between the extended grapheme clusters in each string.
let longText = "String and character comparisons in Swift aren’t locale-sensitive."
longText.hasPrefix("Str")
longText.hasSuffix("tive.")
