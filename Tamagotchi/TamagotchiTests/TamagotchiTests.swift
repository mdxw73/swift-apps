//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Zack Obied on 11/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {
    
    func testTamagotchiReturnsInfo() {
        //arrange
        //act
        let tamagotchi = Tamagotchi()
        //assert
        XCTAssertNotNil(tamagotchi)
        XCTAssertEqual(tamagotchi.getName(), "Tammy")
        XCTAssertEqual(tamagotchi.getGender(), "Female")
        XCTAssertEqual(tamagotchi.getAge(), 0)
        XCTAssertEqual(tamagotchi.getWeight(), 10)
        XCTAssertEqual(tamagotchi.getHeight(), 1.0)
        XCTAssertEqual(tamagotchi.getHappiness(), true)
        XCTAssertEqual(tamagotchi.getHunger(), true)
        XCTAssertEqual(tamagotchi.getFatigue(), false)
        XCTAssertEqual(tamagotchi.getIllness(), false)
        XCTAssertEqual(tamagotchi.mature(), false)
    }

}
