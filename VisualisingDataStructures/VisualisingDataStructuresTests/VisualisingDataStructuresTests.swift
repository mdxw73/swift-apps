//
//  VisualisingDataStructuresTests.swift
//  VisualisingDataStructuresTests
//
//  Created by Obied, Zack (NA) on 27/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import XCTest
@testable import VisualisingDataStructures

class VisualisingDataStructuresTests: XCTestCase {
    
    func testPushingToStack() {
        //arrange
        let stack = Stack()
        //act
        stack.push("Example")
        //assert
        XCTAssertEqual(stack.peek(), "Example")
    }
    
    func testPoppingFromStack() {
        //arrange
        let stack = Stack()
        //act
        stack.push("Example")
        stack.pop()
        //assert
        XCTAssertEqual(stack.peek(), nil)
    }
    
    func testDisplayInitialStackReturnsEmptyArray() {
        //arrange
        let stack = Stack()
        let expected = [String](repeating: "", count: 5)
        //act
        let actual = stack.display()
        //assert
        XCTAssertEqual(actual, expected)
    }

}
