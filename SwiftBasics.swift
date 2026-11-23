// Swift Basics

print("=== Variables and Constants ===")
var name = "Alex"
name = "Sam"
let age = 25
print("Name: \(name), Age: \(age)")

print("\n=== Basic Types ===")
let integer: Int = 10
let decimal: Double = 3.14
let isSwiftFun: Bool = true
let character: Character = "S"
let text: String = "Swift"
print(integer, decimal, isSwiftFun, character, text)

print("\n=== Strings ===")
let firstName = "John"
let lastName = "Doe"
let fullName = firstName + " " + lastName
print(fullName)
print("Length: \(fullName.count)")
print(fullName.uppercased())

print("\n=== Arrays ===")
var languages = ["Swift", "Python", "Java"]
languages.append("Kotlin")
languages.insert("C++", at: 0)
print(languages)
print("First: \(languages[0])")
print("Count: \(languages.count)")

for language in languages {
    print(language)
}

print("\n=== Dictionaries ===")
var scores = ["Math": 90, "Science": 85]
scores["English"] = 88
print(scores)
print("Math score: \(scores["Math"] ?? 0)")

print("\n=== Sets ===")
var numbers: Set<Int> = [1, 2, 3, 3]
numbers.insert(4)
print(numbers)

print("\n=== If, Else, and Switch ===")
let temperature = 28

if temperature > 30 {
    print("It is hot")
} else if temperature > 20 {
    print("The weather is pleasant")
} else {
    print("It is cold")
}

let day = 3
switch day {
case 1:
    print("Monday")
case 2:
    print("Tuesday")
case 3:
    print("Wednesday")
default:
    print("Other day")
}

print("\n=== Loops ===")
for number in 1...5 {
    print(number)
}

var counter = 0
while counter < 3 {
    print("Counter: \(counter)")
    counter += 1
}

print("\n=== Optionals ===")
var nickname: String? = nil
nickname = "Swiftie"

if let nickname = nickname {
    print("Nickname: \(nickname)")
}

print("Nickname with default: \(nickname ?? "No nickname")")

print("\n=== Functions ===")
func greet(person: String) -> String {
    return "Hello, \(person)!"
}

func add(_ first: Int, _ second: Int) -> Int {
    return first + second
}

print(greet(person: "Alex"))
print("2 + 3 = \(add(2, 3))")

print("\n=== Closures ===")
let multiply = { (a: Int, b: Int) -> Int in
    return a * b
}
print("4 * 5 = \(multiply(4, 5))")

let numbersToDouble = [1, 2, 3, 4]
let doubled = numbersToDouble.map { $0 * 2 }
print(doubled)

print("\n=== Tuples ===")
let coordinates = (x: 10, y: 20)
print("X: \(coordinates.x), Y: \(coordinates.y)")

print("\n=== Structs ===")
struct Book {
    let title: String
    var pages: Int

    func description() -> String {
        return "\(title) has \(pages) pages"
    }
}

var book = Book(title: "Swift Basics", pages: 300)
book.pages = 320
print(book.description())

print("\n=== Classes ===")
class Person {
    var name: String

    init(name: String) {
        self.name = name
    }

    func introduce() -> String {
        return "Hi, I am \(name)"
    }
}

let person = Person(name: "Taylor")
print(person.introduce())

print("\n=== Enums ===")
enum Direction {
    case north
    case south
    case east
    case west
}

let direction = Direction.north
switch direction {
case .north:
    print("Going north")
case .south:
    print("Going south")
case .east:
    print("Going east")
case .west:
    print("Going west")
}

print("\n=== Error Handling ===")
enum DivisionError: Error {
    case divisionByZero
}

func divide(_ a: Int, by b: Int) throws -> Int {
    guard b != 0 else {
        throw DivisionError.divisionByZero
    }
    return a / b
}

do {
    let result = try divide(10, by: 2)
    print("10 / 2 = \(result)")
    try divide(10, by: 0)
} catch DivisionError.divisionByZero {
    print("Cannot divide by zero")
} catch {
    print("An unknown error occurred")
}

