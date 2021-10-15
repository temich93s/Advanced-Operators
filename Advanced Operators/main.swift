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


