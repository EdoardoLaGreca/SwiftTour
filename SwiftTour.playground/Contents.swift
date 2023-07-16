import Cocoa

// See here: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/
// Experiments are omitted.

print("Hello, world!")

// ==== Simple Values ====

// `var` for variables and `let` for constants.
// Constants can be assigned a value exactly once, but it does not need to be known at compile time.

// Variable
var myVariable = 42
myVariable = 50

// Constant
let myConstant = 42

// Variables (and constants) can only be assigned values that match their type.
// Types can be optionally explicit, except if the initial value does not provide enough information, in which case it must be specified.
// Variables (and constants) without an explicit type infer their type from the value assigned to them.
// A variable's type is specified after the its name during declaration, with a colon between its name and type.

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// There is no implicit value conversion. Type conversion is done by creating a new instance of the destination type.

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// To include values in strings, write the value in parentheses and a backslash right before.

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// Strings can take up multiple lines when they start with three double quotation marks.
// Each line of the string can be indented as long as the indentation of each line match the closing quotation marks.
// If the indentation matches, it is removed. Otherwise, the difference between the line indentation and the matching indentation is added in the line.

let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(apples + oranges) pieces of fruit.
        """

// Brackets can be used to create arrays and dictionaries and to access their elements with an index or a key.
// Elements are separated using commas. A comma is allowed after the last element.
// Arrays automatically grow as you add elements.

var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"

var occupations = [
    "Malcolm": "Capitain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

fruits.append("blueberries")
print(fruits)

// Empty arrays and dictionaries are created using [] and [:] respectively.
// However, new variables (and other places where there is no type information) require to specify a type.

fruits = []
occupations = [:]
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

// ==== Control Flow ====

// `if` and `switch` make conditionals. `for-in`, `while`, and `repeat-while` make loops.
// Parentheses around the condition are optional, but braces around the body are required.

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


// In an `if` statement, the conditional must be a Boolean expression.
// Writing `if score { ... }` is wrong. The `score` variable is not automatically compared to zero.
// It is possible to write `if` and `switch` statements after the equal sign or after `return`, to choose a value based on the condition.

/* TODO: removing this comment causes an error because this feature will be released in Swift 5.9
let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}
print("Score:", teamScore, scoreDecoration)
*/

// By using `if` and `let` together, you can work with optionals (optional values).
// An optional value either contains a value or `nil`, to indicate that a value is missing.
// A variable that contains an optional value is declared with a question mark after its type.

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// An `if-let` conditional checks if an optional value is `nil`. It executes its body only if the value is not `nil`.
// If the value is not `nil`, it is unwrapped and assigned to the constant in the `if-let` condition.
// You can assign a default value to an optional value using the `??` operator. The default value is used only if the optional value is `nil`.

let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

// You can unwrap an optional value while keeping its original name using `if-let`.

if let nickname {
    print("Hey, \(nickname)")
}

// The `switch` statement supports any kind of data and a wide variety of comparison operations.

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercres":
    print("That would make a good tea sandwitch.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// The `let` keyword can be used in patterns and allows you to assign the value that matched the pattern to a constant.
// Once a case is matched (and its code executed), the program exits from the switch statement. There is no need to use a `break` keyword at the end of each case's code.
// To iterate over items in a dictionary, you can use `for-in` with a pair of names for each key-value pair. Dictionaries are unordered, don't expect any order when you use a `for-in`.

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// `while` loops repeat a block of code until a condition changes.
// The condition may be put at the end to ensure that the loop is run at least once.

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// To make a range of indexes, use `..<`.
// `..<` omits its upper value, while `...` includes its upper value.

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

// ==== Functions and Closures ====

// The `func` keyword declares a function. By writing the function's name followed by a list of arguments, you can call that function.

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

// By default, function arguments are labeled using their parameter names.
// Labels can be customized by using a custom label before the parameter name or an underscore to indicate that there is no label.
func greet(_ person: String, on day: String) -> String {
    return "Hello, \(person), today is \(day)."
}
greet("John", on: "Wednesday")

// Tuple make compound values. They are useful to return multiple values from a function.
// Elements in a tuple can be referred to by name or number.

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

// Functions can be nested. Inner functions have access to outer variables.
// Nested functions are useful to organize code in a complex or long function.

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Functions are a first-class type, which means that a function can return another function as a value.

func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrement()
increment(7)

// It is also possible to make a function take another function as argument.

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// Functions are special closures.
// Code in a closure has access to variables and functions that were available in the outer scope, even if the closure is in a different scope when it's executed.
// Braces with nothing before create a closure. The `in` keyword separates a closure's arguments and return type from its body.

numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// Closures can be written more concisely.
// When a closure's type is known, you can omit the type of its parameters, its return type, or both.
// Single statement closures implicitly return the value of their only statement.

let mappeNumbers = numbers.map({ number in 3 * number })
print(mappeNumbers)

// Parameter can be referred to by number instead of by name. This is especially useful in short closures.
// If a closure is passed as the last argument to a function, it can appear immediately after the parentheses.
// If a closure is the only argument to a function, you can omit the parentheses.

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

// ==== Objects and Classes ====

// The `class` keyword, followed by the class's name, creates a class.
// Class properties are declared in the same way as a constant or variable declaration. The only difference is the context (class context).
// Class methods and function declarations are also written the same way.

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// To create an instance of a class, put parentheses after the class name.
// Dot syntax can be useful to access the properties and methods of the instance.

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// Use `init` to create an initializer.

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// Use the `self` keyword to refer to class properties and methods, rather than local variables and functions.
// Creating the instance of a class is the same as calling the `init` function.
// Every property needs a value assigned. This can be done either in its declaration or the initializer.
// Use `deinit` to create a de-initializer. A deinitializer is run right before an object of that class is deallocated.
// To create a subclass of an existing superclass, add the superclass name after the subclass name, separated by a colon.
// Methods that override a superclass's implementation must be marked with `override`. Overriding a method without that keyword is detected by the compiler as an error. Same for methods that have that keyword but do not override any other method.

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// Properties can have getters and setters.

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral trinagle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// In setters, the new value has the implicit name `newValue`. It is possible to provide an explicit name in parentheses after `set`.
// Notice that EquilateralTriangle's initializer has three different steps:
//  1. Setting the value of properties that the subclass delcares.
//  2. Calling the superclass's initializer.
//  3. Changing the value of properties defined by the superclass. (Additional setups with methods, getters, or setters can also be done here.)
// Use `willSet` and `didSet` to provide code that's run before and after setting a new value. That code is run any time the value changes outside of an initializer.

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// By writing a question mark `?` before operations like methods, properties, and subscripting, if the value before `?` is `nil`, everything after `?` is ignored and the whole expression returns `nil`. Otherwise, the evaluation continues with the unwrapped value. In both cases, the expression results in an optional value.

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sidelength = optionalSquare?.sideLength

// ==== Enumeration and Structures ====

// Use `enum` for enumerations. Enumerations can have methods.

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
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

// By default, raw values start at zero and increment by one each time. It is possible to change this behavior by specifying values.
// When one value is specified, all the values afterward are assigned in order, incrementing by one each time.
// Values are not necessarily integer values, they can also be strings or floating-point numbers.
// The `rawValue` property enables access to the raw value of a case.
// By using the `init?(rawValue:)` initializer, you can make an instance of an enumeration from a raw value. It returns either the enumeration case matching the raw value or `nil` if there is no matching value.

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

// An enumeration's case values are actual values.
// When there isn't a meaningful raw value, there is no need to provide one.

enum Suit {
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
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// When the type of an enumeration is known (e.g. in its declaration), it is possible to use an abbreviated form to refer to one of its values (e.g. `.hearts`). Otherwise, when the type is not known, it must be fully specified (e.g. `Suit.hearts`).
// If an enumeration has raw values, every instance of a particular enumeration case always has the same raw value. That is, because those values are part of the declaration.
// If an enumeration has values (called "associated values") associated with the case, those values may be different for each instance of the same case. That is, because they are determined when you make an enumeration instance.
// Associated values behave like stored properties of a case instance.

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunreise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}

// Use `struct` for structures.
// Structures are similar to classes in behaviour.
// One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, while classes are always passed by reference.

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// ==== Concurrency ====

// Use `async` to mark a function that runs asynchronously.

func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

// To call an asynchronous function, write `await` in front of it.

func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

// To let an asynchronous function run in parallel with other asynchronous functions, use `async let`.
// To use the value of a constant declared with `async let`, use `await`.

func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}

// Use `Task` to call asynchronous functions from synchronous code, without waiting for them to return.

Task {
    await connectUser(to: "primary")
}

// ==== Protocols and Extensions ====

// Use `protocol` to declare a protocol.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Classes, enumerations and structures can all adopt protocols.

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// The `mutating` keyword marks a method that modifies its structure. Class methods do not need that keyword, because class methods can always modify their class.
// Use `extension` to add functionality to an existing type, like new methods and computed properties.
// Extensions are useful to add protocol conformance to a type that is declared elsewhere.

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

// You can use protocol names just like any other named type (e.g. to create a collection of objects with different types but all conforming to a single protocol).
// If a value's type is a protocol type, methods and attributes outside the protocol type are not available.

let protocolValue: any ExampleProtocol = a
print(protocolValue.simpleDescription)

// The variable `protocolValue` has `SimpleClass` as runtime type, but the compiler treats it as a variable of `ExampleProtocol` type. This ensures that you don't accidentally access methods or properties outside the protocol.

// ==== Error Handling ====

// Errors are represented using the `Error` protocol.

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// Use `throw` to throw an error.
// Use `throws` to mark a functions that can throw an error.
// By throwing an error in a function, the function returns immediately and the code that called the function handles the error.

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// An error can be handled in several ways.
// A way to handle errors is by using `do-catch`. Inside the `do` block, you put code that can throw an error and write `try` in front of it. Inside the `catch` block, the error is given the name `error` unless you give it a different name.

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

// You can have multiple `catch` blocks, to handle specific errors.
// To handle a specific error, write a pattern after `catch`, just like you would do after `case` in a `switch`.

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// Another way to handle errors is to use `try?` to convert the result in an optional.
// When the function throws an error, the error is discarded and the result is nil. Otherwise, the result is an optional containing the value returned by the function.

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// Use `defer` to write code that is executed after all other code in the function, just before the function returns. That code is always executed at the end of the function, even if it throws an error.
// The `defer` code is useful to write cleanup code. It can be written next to setup code, even though they need to be executed at different times.

var fridgeIsOpen = false
var fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

// ==== Generics ====

// Names inside angle brackets make a generic function or type.

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

// Functions an methods can be generic, as well as classes, enumerations, and structures.

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// Use `where` to specify generic requirements (e.g. the type must implement a protocol).

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

// Requirements can also be specified in angle brackets.
// Writing `<T: Equatable>` is the same as writing `<T> ... where T: Equatable`.

// The end. :)
