//
//  DivisionTests.swift
//  AbsenceRecorderTests
//
//  Created by Zack Obied on 08/03/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import XCTest

class DivisionTests: XCTestCase {
    
    func testGetAbsenceWithCurrentDateRetrievesExistingAbsenceOnSameDay() {
        //arrange
        let division = Division(code: "TestDiv")
        let absence = Absence(date: Date())
        division.absences.append(absence)
        let dateLaterToday = Date(timeIntervalSinceNow: 100)
        //act
        let actual = division.getAbsence(for: dateLaterToday)
        //assert
        XCTAssertNotNil(actual)
    }

}
