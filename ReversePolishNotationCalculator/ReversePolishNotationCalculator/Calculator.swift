//
//  Calculator.swift
//  ReversePolishNotationCalculator
//
//  Created by Zack Obied on 08/06/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class Calculator {
    
    func evaluate(expression: String) -> Int {
        let parts = expression.components(separatedBy: " ")
        var stack = [Int]()
        for i in 0 ..< parts.count {
            let current = parts[i]
            if isNumber(current) {
                stack.append(Int(current)!)
            } else {
                let operand2 = stack.last!
                stack.removeLast()
                let operand1 = stack.last!
                stack.removeLast()
                
                var result = 0
                
                if current == "+" {
                    result = operand1 + operand2
                } else if current == "-" {
                    result = operand1 - operand2
                } else if current == "*" {
                    result = operand1 * operand2
                } else if current == "/" {
                    result = operand1 / operand2
                } else {
                    print("error: unidentified operator")
                }
                stack.append(result)
            }
        }
        return stack.last!
    }
    
    func isNumber(_ item: String) -> Bool {
        if let _ = Int(item) {
            return true
        } else {
            return false
        }
    }
    
}
