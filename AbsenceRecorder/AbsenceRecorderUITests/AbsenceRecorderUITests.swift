//
//  AbsenceRecorderUITests.swift
//  AbsenceRecorderUITests
//
//  Created by Zack Obied on 28/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import XCTest

class AbsenceRecorderUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenRecordingAnAbsenceStudentsRemainSelected() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["BY-1"]/*[[".cells.staticTexts[\"BY-1\"]",".staticTexts[\"BY-1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname8"]/*[[".cells.staticTexts[\"Surname8\"]",".staticTexts[\"Surname8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname7"]/*[[".cells.staticTexts[\"Surname7\"]",".staticTexts[\"Surname7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname6"]/*[[".cells.staticTexts[\"Surname6\"]",".staticTexts[\"Surname6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname5"]/*[[".cells.staticTexts[\"Surname5\"]",".staticTexts[\"Surname5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["BY-1"].buttons["Mar 8, 2020"].tap()
        
        let divisionCell = tablesQuery.cells.element(boundBy: 0)
        let divisionCellNoAbsence = tablesQuery.cells.element(boundBy: 1)
        XCTAssertEqual(divisionCell.isSelected, true)
        XCTAssertEqual(divisionCellNoAbsence.isSelected, false)
    }
    
    func testSipeToClearRemovesAbsence() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        let by1StaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["BY-1"]/*[[".cells.staticTexts[\"BY-1\"]",".staticTexts[\"BY-1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        by1StaticText.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname1"]/*[[".cells.staticTexts[\"Surname1\"]",".staticTexts[\"Surname1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname2"]/*[[".cells.staticTexts[\"Surname2\"]",".staticTexts[\"Surname2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname3"]/*[[".cells.staticTexts[\"Surname3\"]",".staticTexts[\"Surname3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["BY-1"].buttons["Mar 8, 2020"].tap()
        by1StaticText.swipeRight()
        by1StaticText.tap()
        
        let divisionCell = tablesQuery.cells.element(boundBy: 0)
        let divisionCellNoAbsence = tablesQuery.cells.element(boundBy: 1)
        XCTAssertEqual(divisionCell.isSelected, false)
        XCTAssertEqual(divisionCellNoAbsence.isSelected, false)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
