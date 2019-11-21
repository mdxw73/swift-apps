//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Obied, Zack (NA) on 21/11/2019.
//  Copyright © 2019 Obied, Zack (NA). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {
    
    func testTamagotchiReturnsDefaultInitializedInfo() {
        //arrange
        //act
        let tamagotchi = Tamagotchi()
        //assert
        XCTAssertNotNil(tamagotchi)
        XCTAssertEqual(tamagotchi.getEverything(), [0, "Tammy", "Feminine", 1, 1, false, true])
    }

}
