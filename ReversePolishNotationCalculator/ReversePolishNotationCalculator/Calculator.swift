//
//  Calculator.swift
//  ReversePolishNotationCalculator
//
//  Created by Zack Obied on 08/06/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class Calculator {
    
    func evaluate(expression: String) -> String {
        let parts = expression.components(separatedBy: " ")
        var stack = [Int]()
        for i in 0 ..< parts.count {
            let current = parts[i]
            if isNumber(current) {
                stack.append(Int(current)!)
            } else {
                var operand2 = 0
                var operand1 = 0
                if let operandTwo = stack.last {
                    operand2 = operandTwo
                    stack.removeLast()
                } else {
                    return "Maths Error"
                }
                if let operandOne = stack.last {
                    operand1 = operandOne
                    stack.removeLast()
                } else {
                    return "Maths Error"
                }
                
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
                    return "Unidentified Operator Error"
                }
                stack.append(result)
            }
        }
        return String(stack.last!)
    }
    
    func isNumber(_ item: String) -> Bool {
        if let _ = Int(item) {
            return true
        } else {
            return false
        }
    }
    
}
