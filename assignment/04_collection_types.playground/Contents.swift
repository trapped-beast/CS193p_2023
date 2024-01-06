// It’s good practice to create immutable collections in all cases where the collection doesn’t need to change. Doing so makes it easier for you to reason about your code and enables the Swift compiler to optimize the performance of the collections you create.

// The type of a Swift array is written in full as Array<Element>, where Element is the type of values the array is allowed to store. You can also write the type of an array in shorthand form as [Element].
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

// You access and modify an array through its methods and properties, or by using subscript syntax.
var shoppingList = ["Eggs", "Milk"]
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
shoppingList[0] = "Six eggs"
print(shoppingList)

// You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing.
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)

// To insert an item into the array at a specified index, call the array’s insert(_:at:) method.
// Similarly, you remove an item from the array with the remove(at:) method. This method removes the item at the specified index and returns the removed item (although you can ignore the returned value if you don’t need it).
shoppingList.insert("Candy", at: 0)
let candy = shoppingList.remove(at: 0)

// Any gaps in an array are closed when an item is removed.
var firstItem = shoppingList[0]

// If you want to remove the final item from an array, use the removeLast() method rather than the remove(at:) method to avoid the need to query the array’s count property. Like the remove(at:) method, removeLast() returns the removed item
let apple = shoppingList.removeLast()

// If you need the integer index of each item as well as its value, use the enumerated() method to iterate over the array. For each item in the array, the enumerated() method returns a tuple composed of an integer and the item. The integers start at zero and count up by one for each item; if you enumerate over a whole array, these integers match the items’ indices. You can decompose the tuple into temporary constants or variables as part of the iteration.
for (index, value) in shoppingList.enumerated() {
    print("Item \(index): \(value)")
}

// The type of a Swift dictionary is written in full as Dictionary<Key, Value>, where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys. You can also write the type of a dictionary in shorthand form as [Key: Value].
// A dictionary Key type must conform to the Hashable protocol, like a set’s value type.

// This example creates an empty dictionary of type [Int: String] to store human-readable names of integer values. Its keys are of type Int, and its values are of type String.
var nameOfIntegers: [Int: String] = [:]
nameOfIntegers[16] = "sixteen"
print(nameOfIntegers)

// You can also initialize a dictionary with a dictionary literal, which has a similar syntax to the array literal seen earlier. A dictionary literal is a shorthand way to write one or more key-value pairs as a Dictionary collection.
var airports: [String: String] = ["Beijing":"Shoudu", "Shanghai":"Hongqiao"]

// You access and modify a dictionary through its methods and properties, or by using subscript syntax.
airports["Guangzhou"] = "Baiyun"
airports["Beijing"] = "Daxing"
print(airports)

// As an alternative to subscripting, use a dictionary’s updateValue(_:forKey:) method to set or update the value for a particular key. Like the subscript examples above, the updateValue(_:forKey:) method sets a value for a key if none exists, or updates the value if that key already exists. Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.
// The updateValue(_:forKey:) method returns an optional value of the dictionary’s value type. For a dictionary that stores String values, for example, the method returns a value of type String?, or “optional String”. This optional value contains the old value for that key if one existed before the update, or nil if no value existed
if let oldValue = airports.updateValue("Pudong", forKey: "Shanghai") {
    print("The old value for Shanghai is \(oldValue).")
}

// You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key
airports["Apple"] = "Apple International"
print(airports)
airports["Apple"] = nil
print(airports)

// Alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method. This method removes the key-value pair if it exists and returns the removed value, or returns nil if no value existed
if let removedValue = airports.removeValue(forKey: "Guangzhou") {
    print("The removed airport's name is \(removedValue).")
}
else {
    print("The dictionary doesn't contain a value for Guangzhou.")
}

// You can iterate over the key-value pairs in a dictionary with a for-in loop. Each item in the dictionary is returned as a (key, value) tuple, and you can decompose the tuple’s members into temporary constants or variables as part of the iteration
for (city, airport) in airports {
    print(city, ":", airport)
}

// You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its keys and values properties
for city in airports.keys {
    print(city)
}
for airport in airports.values {
    print(airport)
}

// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property
let cities = [String](airports.keys)
let airportNames = [String](airports.values)

// Swift’s Dictionary type doesn’t have a defined ordering. To iterate over the keys or values of a dictionary in a specific order, use the sorted() method on its keys or values property.

print(shoppingList)
let r = shoppingList[1...4]
let t = shoppingList.dropFirst(2)
print(t)
