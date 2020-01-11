//
//  CarCustomizerTests.swift
//  CarCustomizerTests
//
//  Created by Zack Obied on 11/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import XCTest
@testable import CarCustomizer

class CarCustomizerTests: XCTestCase {

    func testTamagotchiReturnsInfo() {
        //arrange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let expected = """
        Make: Mazda
        Model: MX-5
        Top Speed: 125mph
        Acceleration (0-60): 7.7s
        Handling: 5
        """
        //act
        let actual = car.displayStats()
        //assert
        XCTAssertEqual(actual, expected)
    }

}
