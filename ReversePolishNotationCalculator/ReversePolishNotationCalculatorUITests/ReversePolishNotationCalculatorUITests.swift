//
//  ReversePolishNotationCalculatorUITests.swift
//  ReversePolishNotationCalculatorUITests
//
//  Created by Zack Obied on 08/06/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import XCTest

class ReversePolishNotationCalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDigitButtonsProduceRelevantInput() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["0"].tap()
        
        let enterButton = app.buttons["Enter"]
        enterButton.tap()
        app.buttons["1"].tap()
        
        let enterStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Enter"]/*[[".buttons[\"Enter\"].staticTexts[\"Enter\"]",".staticTexts[\"Enter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterStaticText.tap()
        app.buttons["2"].tap()
        enterButton.tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.staticTexts["3"]/*[[".buttons[\"3\"].staticTexts[\"3\"]",".staticTexts[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        enterButton.tap()
        app.buttons["4"].tap()
        enterButton.tap()
        app.buttons["5"].tap()
        enterButton.tap()
        app.buttons["6"].tap()
        enterStaticText.tap()
        app.buttons["7"].tap()
        enterButton.tap()
        app.buttons["8"].tap()
        enterButton.tap()
        app2/*@START_MENU_TOKEN@*/.staticTexts["9"]/*[[".buttons[\"9\"].staticTexts[\"9\"]",".staticTexts[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual(app.staticTexts["Display"].label, "0 1 2 3 4 5 6 7 8 9")
    }
    
    func testEvaluateDisplaysResultAndChangeSignButtonProducesANegativeResult() {
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["6"]/*[[".buttons[\"6\"].staticTexts[\"6\"]",".staticTexts[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Enter"]/*[[".buttons[\"Enter\"].staticTexts[\"Enter\"]",".staticTexts[\"Enter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["+/-"].tap()
        app.buttons["2"].tap()
        app.buttons["*"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Evaluate"]/*[[".buttons[\"Evaluate\"].staticTexts[\"Evaluate\"]",".staticTexts[\"Evaluate\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual(app.staticTexts["Display"].label, "-12")
    }
    
    func testOtherOperatorsProduceExpectedResult() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["8"].tap()
        
        let enterStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Enter"]/*[[".buttons[\"Enter\"].staticTexts[\"Enter\"]",".staticTexts[\"Enter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterStaticText.tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.staticTexts["3"]/*[[".buttons[\"3\"].staticTexts[\"3\"]",".staticTexts[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        enterStaticText.tap()
        app2/*@START_MENU_TOKEN@*/.staticTexts["5"]/*[[".buttons[\"5\"].staticTexts[\"5\"]",".staticTexts[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["-"].tap()
        app.buttons["/"].tap()
        app2/*@START_MENU_TOKEN@*/.staticTexts["Evaluate"]/*[[".buttons[\"Evaluate\"].staticTexts[\"Evaluate\"]",".staticTexts[\"Evaluate\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        XCTAssertEqual(app.staticTexts["Display"].label, "-5")
    }
    
    func testClearRemovesAllDataFromDisplay() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["2"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["5"]/*[[".buttons[\"5\"].staticTexts[\"5\"]",".staticTexts[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["8"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Clear"]/*[[".buttons[\"Clear\"].staticTexts[\"Clear\"]",".staticTexts[\"Clear\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["1"].tap()
        
        XCTAssertEqual(app.staticTexts["Display"].label, "1")
    }
    
    func testRestrictionsOnSignsAndDigits() {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["6"]
        button.tap()
        button.staticTexts["6"].tap()
        
        let staticText = app/*@START_MENU_TOKEN@*/.staticTexts["6"]/*[[".buttons[\"6\"].staticTexts[\"6\"]",".staticTexts[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        staticText.tap()
        button.tap()
        
        let enterStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Enter"]/*[[".buttons[\"Enter\"].staticTexts[\"Enter\"]",".staticTexts[\"Enter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterStaticText.tap()
        staticText.tap()
        enterStaticText.tap()
        
        let staticText2 = app/*@START_MENU_TOKEN@*/.staticTexts["/"]/*[[".buttons[\"\/\"].staticTexts[\"\/\"]",".staticTexts[\"\/\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        staticText2.tap()
        staticText2.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Evaluate"]/*[[".buttons[\"Evaluate\"].staticTexts[\"Evaluate\"]",".staticTexts[\"Evaluate\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        XCTAssertEqual(app.staticTexts["Display"].label, "111")
    }
    
}
