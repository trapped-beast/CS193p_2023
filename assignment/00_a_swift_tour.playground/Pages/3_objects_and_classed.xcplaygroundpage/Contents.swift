// Use init to create an initializer to set up the class when an instance is created.
class NamedShape{
    var number: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func description() -> String{
        return "\(name) is a namedShape."
    }
}
let shape = NamedShape(name: "Rectangle")
shape.description()

// Subclasses include their superclass name after their class name, separated by a colon. There’s no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.
// Methods on a subclass that override the superclass’s implementation are marked with override — overriding a method by accident, without override, is detected by the compiler as an error. The compiler also detects methods with override that don’t actually override any method in the superclass.
class Square: NamedShape{
    override func description() -> String{
        return "\(name) is a Square."
    }
}
let shape2 = Square(name: "Square1")
shape2.description()

// In addition to simple properties that are stored, properties can have a getter and a setter.
// In the setter for perimeter, the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.
class SquareCal: NamedShape{
    var sideLength: Double = 0.0
    
    var perimeter: Double {
        get {
            return 4 * sideLength
        }
        set {
            sideLength = newValue / 4.0
        }
    }
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name:name)
    }
    
    override func description() -> String{
        return "\(name) is a Square_Cal."
    }
}
let shape3 = SquareCal(sideLength: 3.1, name: "Square2")
shape3.description()
shape3.sideLength
shape3.perimeter
shape3.perimeter = 20
shape3.perimeter
shape3.sideLength

// If you don’t need to compute the property but still need to provide code that’s run before and after setting a new value, use willSet and didSet. The code you provide is run any time the value changes outside of an initializer.
class Another_SquareCal: NamedShape{
    var sideLength: Double = 0.0
    
    var perimeter: Double = 0.0 {
        willSet {
                print("\(name) is setting perimeter to \(newValue)")
            }
    }
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name:name)
    }
    
    override func description() -> String{
        return "\(name) is a Square_Cal."
    }
}
let shape4 = Another_SquareCal(sideLength: 3.1, name: "Square3")
shape4.perimeter = 20

// When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.
let shape5: SquareCal? = SquareCal(sideLength: 3.1, name: "Square4")
let shape6: SquareCal? = nil
let sideLength1 = shape5?.sideLength
let sideLength2 = shape6?.sideLength
