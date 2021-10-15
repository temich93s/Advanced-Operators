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

