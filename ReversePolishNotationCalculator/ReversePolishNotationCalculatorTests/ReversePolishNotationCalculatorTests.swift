//
//  ReversePolishNotationCalculatorTests.swift
//  ReversePolishNotationCalculatorTests
//
//  Created by Zack Obied on 08/06/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import XCTest
@testable import ReversePolishNotationCalculator

class ReversePolishNotationCalculatorTests: XCTestCase {
    
    func testCalculatorWithAdditionOfTwoOperands() {
        //arrange
        let expression = "2 3 +"
        let expected = "5"
        //act
        let calculator = Calculator()
        //assert
        XCTAssertEqual(calculator.evaluate(expression: expression), expected)
    }
    
    func testCalculatorWithSubtractionOfTwoOperands() {
        //arrange
        let expression = "17 5 -"
        let expected = "12"
        //act
        let calculator = Calculator()
        //assert
        XCTAssertEqual(calculator.evaluate(expression: expression), expected)
    }
    
    func testCalculatorWithMultiplicationOfTwoOperands() {
        //arrange
        let expression = "11 6 *"
        let expected = "66"
        //act
        let calculator = Calculator()
        //assert
        XCTAssertEqual(calculator.evaluate(expression: expression), expected)
    }
    
    func testCalculatorWithDivisionOfTwoOperands() {
        //arrange
        let expression = "21 7 /"
        let expected = "3"
        //act
        let calculator = Calculator()
        //assert
        XCTAssertEqual(calculator.evaluate(expression: expression), expected)
    }
    
    func testCalculatorWithComplexMultioperationalExpression() {
        //arrange
        let expression = "121 11 / 2 24 * + 5 + 8 /"
        let expected = "8"
        //act
        let calculator = Calculator()
        //assert
        XCTAssertEqual(calculator.evaluate(expression: expression), expected)
    }
    
    func testIsNumberCheckReturnsCorrectBooleanValue() {
        //arrange
        let item1 = "5"
        let item2 = "*"
        //act
        let calculator = Calculator()
        //assert
        XCTAssertEqual(calculator.isNumber(item1), true)
        XCTAssertEqual(calculator.isNumber(item2), false)
    }
    
    func testMathsErrorScenario() {
        //arrange
        let expression = "121 11 / *"
        let expected = "Maths Error"
        //act
        let calculator = Calculator()
        //assert
        XCTAssertEqual(calculator.evaluate(expression: expression), expected)
    }
    
    func testUnidentifiedOperatorErrorScenario() {
        //arrange
        let expression = "121 11 @"
        let expected = "Unidentified Operator Error"
        //act
        let calculator = Calculator()
        //assert
        XCTAssertEqual(calculator.evaluate(expression: expression), expected)
    }

}
