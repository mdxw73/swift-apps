//
//  AbsenceRecorderTests.swift
//  AbsenceRecorderTests
//
//  Created by Zack Obied on 28/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import XCTest
@testable import AbsenceRecorder

class AbsenceRecorderTests: XCTestCase {

    func testDivisionFactoryReturnsExpectedDivisions() {
        //arrange
        let expectedCodes = ["BY-1", "XC-1", "DV-1"]
        let expectedSizes = [8, 5, 10]
        var divisions = [Division]()
        //act
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "XC-1", of: 5))
        divisions.append(DivisionFactory.createDivision(code: "DV-1", of: 10))
        //assert
        for (index, division) in divisions.enumerated() {
            XCTAssertEqual(division.code, expectedCodes[index])
            XCTAssertEqual(division.students.count, expectedSizes[index])
        }
    }
    
    func testGetAbsenceMethodReturnsExpectedAbsences() {
        //arrange
        let division = Division(code: "Z")
        let currentDate = Date()
        let expectedAbsence = Absence(date: currentDate, present: [Student(forename: "X", surname: "Y", birthday: currentDate)])
        division.absences.append(expectedAbsence)
        //act
        let absence = division.getAbsence(for: currentDate)
        //assert
        XCTAssertEqual(absence, expectedAbsence)
    }

}
