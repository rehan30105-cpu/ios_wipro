// Assessment Milestone 1
// Integrated Swift Programming: Classes, Structs, Protocols and Generics

print("=== Structures and Classes ===")

struct Point {
    var x: Int
    var y: Int

    func display() {
        print("Point: (\(x), \(y))")
    }
}

var point = Point(x: 10, y: 20)
point.x = 15
point.display()

class Counter {
    private(set) var value: Int

    init(value: Int = 0) {
        self.value = value
    }

    func increment(by amount: Int = 1) {
        value += amount
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 4)
print("Counter: \(counter.value)")

print("\n=== Value Type vs Reference Type ===")

struct Rectangle {
    var width: Int
    var height: Int
}

let firstRectangle = Rectangle(width: 20, height: 10)
var secondRectangle = firstRectangle
secondRectangle.width = 30

print("First width: \(firstRectangle.width)")
print("Second width: \(secondRectangle.width)")

class Book {
    var title: String

    init(title: String) {
        self.title = title
    }
}

let firstBook = Book(title: "Swift")
let secondBook = firstBook
secondBook.title = "Swift Advanced"

print("First title: \(firstBook.title)")
print("Second title: \(secondBook.title)")

print("\n=== Protocols ===")

protocol Drawable {
    var description: String { get }
    func draw()
}

extension Drawable {
    func printDescription() {
        print(description)
    }
}

struct Circle: Drawable {
    let radius: Double

    var description: String {
        "Circle with radius \(radius)"
    }

    func draw() {
        print("Drawing a circle")
    }
}

class Triangle: Drawable {
    let base: Double
    let height: Double

    init(base: Double, height: Double) {
        self.base = base
        self.height = height
    }

    var description: String {
        "Triangle with base \(base) and height \(height)"
    }

    func draw() {
        print("Drawing a triangle")
    }
}

let shapes: [Drawable] = [
    Circle(radius: 5),
    Triangle(base: 10, height: 6)
]

for shape in shapes {
    shape.draw()
    shape.printDescription()
}

print("\n=== Protocol Inheritance ===")

protocol Identifiable {
    var id: String { get }
}

protocol Vehicle: Identifiable {
    var speed: Int { get }
    func start()
}

struct Car: Vehicle {
    let id: String
    let speed: Int

    func start() {
        print("Car \(id) started at \(speed) km/h")
    }
}

let car = Car(id: "CAR-101", speed: 120)
car.start()

print("\n=== Generics ===")

func swapValues<T>(_ first: inout T, _ second: inout T) {
    let temporary = first
    first = second
    second = temporary
}

var numberOne = 10
var numberTwo = 20
swapValues(&numberOne, &numberTwo)
print("Numbers: \(numberOne), \(numberTwo)")

var wordOne = "Hello"
var wordTwo = "Swift"
swapValues(&wordOne, &wordTwo)
print("Words: \(wordOne), \(wordTwo)")

struct Box<T> {
    var value: T

    func getValue() -> T {
        value
    }
}

let integerBox = Box(value: 100)
let stringBox = Box(value: "Generic Box")

print(integerBox.getValue())
print(stringBox.getValue())

print("\n=== Generic Stack ===")

struct Stack<Element> {
    private var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        items.popLast()
    }

    func peek() -> Element? {
        items.last
    }

    var isEmpty: Bool {
        items.isEmpty
    }

    var count: Int {
        items.count
    }
}

var integerStack = Stack<Int>()
integerStack.push(10)
integerStack.push(20)
integerStack.push(30)

print("Top item: \(integerStack.peek() ?? 0)")
print("Popped item: \(integerStack.pop() ?? 0)")
print("Stack count: \(integerStack.count)")

print("\n=== Generic Functions with Constraints ===")

func printCount<T: Collection>(_ items: T) {
    print("Item count: \(items.count)")
}

printCount([1, 2, 3, 4])
printCount("Swift")

print("\n=== Associated Type Protocol ===")

protocol Container {
    associatedtype Item

    mutating func append(_ item: Item)
    var items: [Item] { get }
    subscript(index: Int) -> Item { get }
}

struct ArrayContainer<Item>: Container {
    private(set) var items: [Item] = []

    mutating func append(_ item: Item) {
        items.append(item)
    }

    subscript(index: Int) -> Item {
        items[index]
    }
}

var container = ArrayContainer<String>()
container.append("Swift")
container.append("iOS")

print("Container items: \(container.items)")
print("First item: \(container[0])")
