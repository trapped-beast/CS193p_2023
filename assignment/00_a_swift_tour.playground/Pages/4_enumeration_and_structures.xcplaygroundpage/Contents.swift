// Use enum to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
// By default, Swift assigns the raw values starting at zero and incrementing by one each time, but you can change this behavior by explicitly specifying values.
enum Rank: Int, CaseIterable {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String{
        switch self{
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
print(ace)
print(aceRawValue)
Rank.jack.simpleDescription()
Rank.six.simpleDescription()

// Write a function that compares two Rank values by comparing their raw values.
func compareRank(lhs:Rank, rhs:Rank) -> String {
    let difference = lhs.rawValue - rhs.rawValue
    if(difference>0){
        return ">"
    }
    else if(difference<0){
        return "<"
    }
    else{
        return "="
    }
}
compareRank(lhs:Rank.ace, rhs:Rank.jack)
compareRank(lhs:Rank.jack, rhs:Rank.ace)
compareRank(lhs:Rank.jack, rhs:Rank.jack)

// You can also use strings or floating-point numbers as the raw type of an enumeration. Use the rawValue property to access the raw value of an enumeration case.
enum SquareNum: Float{
    case one, four, nine
}
SquareNum.one.rawValue
SquareNum.four.rawValue
SquareNum.nine.rawValue
enum Season: String{
    case spring, summer, autumn, winter
}
Season.spring.rawValue
Season.summer.rawValue
Season.autumn.rawValue
Season.winter.rawValue

// Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value. It returns either the enumeration case matching the raw value or nil if there’s no matching Rank.
if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}

// The case values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
enum Suit: CaseIterable {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    // Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
    func color() -> String {
        switch self{
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()
// Notice the two ways that the hearts case of the enumeration is referred to above: When assigning a value to the hearts constant, the enumeration case Suit.hearts is referred to by its full name because the constant doesn’t have an explicit type specified. Inside the switch, the enumeration case is referred to by the abbreviated form .hearts because the value of self is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known.

// If an enumeration has raw values, those values are determined as part of the declaration, which means every instance of a particular enumeration case always has the same raw value. Another choice for enumeration cases is to have values associated with the case — these values are determined when you make the instance, and they can be different for each instance of an enumeration case. You can think of the associated values as behaving like stored properties of the enumeration case instance.
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case greeting(name: String)
}
let success = ServerResponse.result("6:00 am", "8:00 pm")
let failure = ServerResponse.failure("Out of cheese")
let greeting = ServerResponse.greeting(name: "chw")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
case let .greeting(name):
    print("Good night, \(name)")
}

// Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they’re passed around in your code, but classes are passed by reference.
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// Write a function that returns an array containing a full deck of cards, with one card of each combination of rank and suit.
func getADeckOfCards() -> [Card] {
    var cards: [Card] = []
    for rank in Rank.allCases {
        for suit in Suit.allCases {
            cards.append(Card(rank: rank, suit: suit))
        }
    }
    return cards
}
for card in getADeckOfCards(){
    print(card.simpleDescription())
}
