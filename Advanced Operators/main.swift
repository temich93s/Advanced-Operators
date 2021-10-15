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
