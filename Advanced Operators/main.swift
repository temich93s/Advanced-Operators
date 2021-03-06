//
//  main.swift
//  Advanced Operators
//
//  Created by 2lup on 16.10.2021.
//

import Foundation

print("Hello, World!")


//MARK: Побитовый оператор NOT
print("\n//Побитовый оператор NOT")

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // равен 11110000
print(initialBits, invertedBits)


//MARK: Побитовый оператор AND
print("\n//Побитовый оператор AND")

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // равен 00111100
print(firstSixBits, lastSixBits, middleFourBits)


//MARK: Побитовый оператор OR
print("\n//Побитовый оператор OR")

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // равен 11111110
print(someBits,moreBits, combinedbits)


//MARK: Побитовый оператор XOR
print("\n//Побитовый оператор XOR")

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // равен 00010001


//MARK: Поведение сдвига для беззнаковых целых чисел
print("\n//Поведение сдвига для беззнаковых целых чисел")

let shiftBits: UInt8 = 4   // 00000100 бинарный вид
print(shiftBits << 1)       // 00001000
print(shiftBits << 2)       // 00010000
print(shiftBits << 5)       // 10000000
print(shiftBits << 6)       // 00000000
print(shiftBits >> 2)       // 00000001

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16 // redComponent равен 0xCC, или 204
let greenComponent = (pink & 0x00FF00) >> 8 // greenComponent равен 0x66, или 102
let blueComponent = pink & 0x0000FF // blueComponent равен 0x99, или 153
print(pink, redComponent, greenComponent, blueComponent)


//MARK: Переполнение значения
print("\n//Переполнение значения")

var willOverflow = UInt8.max
// willOverflow равняется 255, что является наибольшим числом, которое может держать UInt
willOverflow = willOverflow &+ 1
// willOverflow теперь равно 0
print(willOverflow)

var unsignedOverflow = UInt8.min
// unsignedOverflow равен 0, что является наименьшим возможным значением UInt8
unsignedOverflow = unsignedOverflow &- 1
// unsignedOverflow теперь равно 255
print(unsignedOverflow)

var signedUnderflow = Int8.min
// signedUnderflow равняется -128, что является самым маленьким числом, которое может держать Int8
signedUnderflow = signedUnderflow &- 1
// signedUnderflow теперь равняется 127
print(signedUnderflow)


//MARK: Приоритет и ассоциативность
print("\n//Приоритет и ассоциативность")

print(2 + 3 % 4 * 5)
// это равно 17

print(2 + ((3 % 4) * 5))
// это равно 17


//MARK: Операторные функции
print("\n//Операторные функции")

struct Vector2D {
    var x = 0.0, y = 0.0
}
 
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector является экземпляром Vector2D, который имеет значения (5.0, 5.0)
print(vector, anotherVector, combinedVector, separator: "\n")


//MARK: Префиксные и постфиксные операторы
print("\n//Префиксные и постфиксные операторы")

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
// negative - экземпляр Vector2D со значениями (-3.0, -4.0)
let alsoPositive = -negative
// alsoPositive - экземпляр Vector2D со значениями (3.0, 4.0)
print(positive, negative, alsoPositive, separator: "\n")


//MARK: Составные операторы присваивания
print("\n//Составные операторы присваивания")

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
var vectorToAdd = Vector2D(x: 3.0, y: 4.0)
print(original, vectorToAdd, separator: "\n")
original += vectorToAdd
// original теперь имеет значения (4.0, 6.0)
print(original)


//MARK: Операторы эквивалентности
print("\n//Операторы эквивалентности")

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("Эти два вектора эквиваленты.")
}
// Выведет "Эти два вектора эквиваленты."

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}
 
let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("Эти два вектора так же эквиваленты.")
}
// Выведет "Эти два вектора так же эквиваленты."


//MARK: Пользовательские операторы
print("\n//Пользовательские операторы")

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}
 
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
// toBeDoubled имеет значения (2.0, 8.0)
// afterDoubling так же имеет значения (2.0, 8.0)
print(toBeDoubled, afterDoubling, separator: "\n")


//MARK: Приоритет для пользовательских инфиксных операторов
print("\n//Приоритет для пользовательских инфиксных операторов")

infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector является экземпляром Vector2D со значениями (4.0, -2.0)
print(firstVector, secondVector, plusMinusVector, separator: "\n")


//MARK: Result Builders
print("\n//Result Builders")

protocol Drawable {
    func draw() -> String
}
struct Line: Drawable {
    var elements: [Drawable]
    func draw() -> String {
        return elements.map { $0.draw() }.joined(separator: "")
    }
}
struct Text: Drawable {
    var content: String
    init(_ content: String) { self.content = content }
    func draw() -> String { return content }
}
struct Space: Drawable {
    func draw() -> String { return " " }
}
struct Stars: Drawable {
    var length: Int
    func draw() -> String { return String(repeating: "*", count: length) }
}
struct AllCaps: Drawable {
    var content: Drawable
    func draw() -> String { return content.draw().uppercased() }
}

let name: String? = "Ravi Patel"
let manualDrawing = Line(elements: [
    Stars(length: 3),
    Text("Hello"),
    Space(),
    AllCaps(content: Text((name ?? "World") + "!")),
    Stars(length: 2),
    ])
print(manualDrawing.draw())
// Выведет "***Hello RAVI PATEL!**"


@resultBuilder
struct DrawingBuilder {
    static func buildBlock(_ components: Drawable...) -> Drawable {
        return Line(elements: components)
    }
    static func buildEither(first: Drawable) -> Drawable {
        return first
    }
    static func buildEither(second: Drawable) -> Drawable {
        return second
    }
}

func draw(@DrawingBuilder content: () -> Drawable) -> Drawable {
    return content()
}
func caps(@DrawingBuilder content: () -> Drawable) -> Drawable {
    return AllCaps(content: content())
}

func makeGreeting(for name: String? = nil) -> Drawable {
    let greeting = draw {
        Stars(length: 3)
        Text("Hello")
        Space()
        caps {
            if let name = name {
                Text(name + "!")
            } else {
                Text("World!")
            }
        }
        Stars(length: 2)
    }
    return greeting
}
let genericGreeting = makeGreeting()
print(genericGreeting.draw())
// Выведет "***Hello WORLD!**"

let personalGreeting = makeGreeting(for: "Ravi Patel")
print(personalGreeting.draw())
// Выведет "***Hello RAVI PATEL!**"

let capsDrawing = caps {
    let partialDrawing: Drawable
    if let name = name {
        let text = Text(name + "!")
        partialDrawing = DrawingBuilder.buildEither(first: text)
    } else {
        let text = Text("World!")
        partialDrawing = DrawingBuilder.buildEither(second: text)
    }
    return partialDrawing
}

extension DrawingBuilder {
    static func buildArray(_ components: [Drawable]) -> Drawable {
        return Line(elements: components)
    }
}

let manyStars = draw {
    Text("Stars:")
    for length in 1...3 {
        Space()
        Stars(length: length)
    }
}
