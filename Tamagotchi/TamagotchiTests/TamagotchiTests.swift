//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Obied, Zack (NA) on 21/11/2019.
//  Copyright © 2019 Obied, Zack (NA). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {
    
    func testTamagotchiReturnsInfo() {
        //arrange
        //act
        let tamagotchi = Tamagotchi()
        //assert
        XCTAssertNotNil(tamagotchi)
    }

}
