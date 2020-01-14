//
//  CarCustomizerUITests.swift
//  CarCustomizerUITests
//
//  Created by Zack Obied on 11/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import XCTest

class CarCustomizerUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtExhaustAndTiresPackagesTransmissionPackageIsDisabled() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.switches["tiresSwitch"].tap()
        app.switches["engineAndExhaustSwitch"].tap()
        
        //assert
        XCTAssertEqual(app.switches["transmissionSwitch"].isEnabled, false)

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testThatDisplayStatsGetLoadedWithTheFirstCarOnLaunch() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = """
        Make: Mazda
        Model: MX-5
        Top Speed: 125mph
        Acceleration (0-60): 7.7s
        Handling: 5
        """
        
        //act
        let actual = app.staticTexts["selectedCarStatistics"].label
        
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testButtonsAreReenabledWhenCyclingCars() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.buttons["nextCar"].tap()
        
        //assert
        XCTAssertEqual(app.switches["engineAndExhaustSwitch"].isEnabled, true)
        XCTAssertEqual(app.switches["tiresSwitch"].isEnabled, true)
        XCTAssertEqual(app.switches["transmissionSwitch"].isEnabled, true)
    }
    
    func testRemainingFundsIsInitiallySetToOneThousand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "Remaining Funds: 1000"
        
        //act
        let actual = app.staticTexts["remainingFunds"].label
        
        //assert
        XCTAssertEqual(actual, expected)
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
